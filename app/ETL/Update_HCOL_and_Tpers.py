"""
Update_HCOL_and_Tpers.py
==========================
Author: J. Timothy Collier
Created: 1/12/26
Last Updated: 1/12/26 - Modularized code by adding several functions
==========================
Purpose:  Read information from the database of truth for members:  HamClubOnline (HCOL).
          Update t_hcol_export to have a table that reflects HCOL.
          Update t_pers to identify members and non-members.  Used in several apps.

"""

import os
import requests
from typing import Optional

from dotenv import load_dotenv

from schema.pd_schema import THcolExportSchema
from db.database import get_session
from db.models.harc_snn_3_prod import THcolExport, TPers


# ----------------------------------------------------------------------
# Utility Functions
# ----------------------------------------------------------------------

def split_name(pers_f_nam: str, pers_m_nam: str) -> tuple[str | None, str | None]:
    """
    Splits a first name that may contain a middle initial.
    If pers_m_nam is already provided, it takes precedence.
    """
    pers_f_nam = (pers_f_nam or "").strip()
    pers_m_nam = (pers_m_nam or "").strip()

    first_parts = pers_f_nam.split()
    possible_middle = ""

    if pers_m_nam:
        return first_parts[0].title() if first_parts else None, pers_m_nam.title()

    if len(first_parts) == 2:
        first, possible_middle = first_parts
        if len(possible_middle) > 1:
            return first.title(), possible_middle.strip(".").title()

    return first_parts[0].title() if first_parts else None, possible_middle


# ----------------------------------------------------------------------
# Environment & API
# ----------------------------------------------------------------------

def load_env_credentials() -> dict:
    """Load CURL credentials from .env."""
    load_dotenv()
    return {
        "version": os.getenv("CURL_VERSION"),
        "club": os.getenv("CURL_CLUB"),
        "user": os.getenv("CURL_USER"),
        "password": os.getenv("CURL_PASSWORD"),
    }


def fetch_hcol_members(curl_data: dict) -> dict:
    """Fetch and validate member data from HamClubOnline API."""
    CURL_URL = "https://secure.hamclubonline.com/api/members.php"

    try:
        response = requests.post(CURL_URL, data=curl_data, timeout=10)
        response.raise_for_status()
        payload = response.json()
    except requests.RequestException as exc:
        raise RuntimeError(f"API request failed: {exc}") from exc

    if payload.get("response") != "OK":
        raise RuntimeError("Invalid response from API")

    members = payload.get("members", [])
    if not members:
        raise RuntimeError("No members found in API response")

    return members[0]  # dict of member records


# ----------------------------------------------------------------------
# Database Processing
# ----------------------------------------------------------------------

def process_member(
    mem_info: dict,
    session,
) -> Optional[TPers]:
    """
    Process a single HCOL member record.
    Returns a new TPers object if one should be inserted,
    otherwise None.
    """
    validated = THcolExportSchema(**mem_info)

    # Always insert into THcolExport
    session.add(THcolExport(**validated.model_dump()))

    exists = session.query(TPers).filter_by(pers_call=validated.call).first()

    # ---- Active Full Members ----
    if validated.roster == "Active" and validated.mem_typ == "Full Member":
        tpers_data = {
            "pers_call": validated.call,
            "pers_f_nam": validated.f_nam or None,
            "pers_m_nam": mem_info.get("middle_name", "").title() or None,
            "pers_l_nam": validated.l_nam or None,
            "pers_pref_nam": validated.pref_nam or None,
            "pers_typ_cd": 1,
        }

        tpers_data["pers_f_nam"], tpers_data["pers_m_nam"] = split_name(
            tpers_data["pers_f_nam"],
            tpers_data["pers_m_nam"],
        )

        if exists:
            exists.pers_f_nam = tpers_data["pers_f_nam"]
            exists.pers_m_nam = tpers_data["pers_m_nam"]
            exists.pers_l_nam = tpers_data["pers_l_nam"]
            exists.pers_typ_cd = 1
            return None

        return TPers(**tpers_data)

    # ---- Inactive Members ----
    if validated.roster == "Inactive" and exists and exists.pers_typ_cd == 1:
        exists.pers_typ_cd = 0

    return None


# ----------------------------------------------------------------------
# Reporting
# ----------------------------------------------------------------------

def print_summary(
    num_hcol: int,
    num_added: int,
    num_updated: int,
    num_errors: int,
) -> None:
    print("\n------------------------------\n")
    if num_errors == 0:
        print("Database updated successfully.")
    else:
        print("Database update failed.")
    print(f"{num_hcol} HCOL records processed.")
    print(f"{num_added} new t_pers records added.")
    print(f"{num_updated} t_pers records updated.")
    print(f"{num_errors} errors encountered.")
    print("\n------------------------------\n")


# ----------------------------------------------------------------------
# Main Entry Point
# ----------------------------------------------------------------------

def main() -> None:
    curl_data = load_env_credentials()

    try:
        hcol_members = fetch_hcol_members(curl_data)
    except RuntimeError as exc:
        print(f"❌ {exc}")
        return

    session = next(get_session())
    session.query(THcolExport).delete()

    new_tpers_records: list[TPers] = []

    num_hcol = 0
    num_added = 0
    num_updated = 0
    num_errors = 0

    for _, mem_info in hcol_members.items():
        try:
            print(
                f"Processing: {mem_info['roster_id']} - "
                f"{mem_info['callsign']} - "
                f"{mem_info['last_name'].title()} - "
                f"{mem_info['member_type']}"
            )

            tpers = process_member(mem_info, session)
            num_hcol += 1

            if tpers:
                new_tpers_records.append(tpers)
                num_added += 1
            else:
                num_updated += 1

        except Exception as exc:
            print(f"\n❌ Error processing roster_id {mem_info.get('roster_id')}: {exc}")
            num_errors += 1

    if new_tpers_records:
        session.bulk_save_objects(new_tpers_records)

    if num_errors == 0:
        session.commit()
    else:
        session.rollback()

    print_summary(num_hcol, num_added, num_updated, num_errors)
    session.close()


if __name__ == "__main__":
    main()
