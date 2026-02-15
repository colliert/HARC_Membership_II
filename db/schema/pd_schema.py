import re
from decimal import Decimal, InvalidOperation
from typing import Optional, Union, Tuple

from pydantic import BaseModel, EmailStr, Field, field_validator, model_validator


# --- Helper: Name Normalizer ---

class NameNormalizer:
	particles = ["VAN", "VON"]

	def __init__(self, exceptions=None):
		self.exceptions = {k.upper(): v for k, v in (exceptions or {}).items()}

	def normalize(self, name: str) -> str:
		if not name or not isinstance(name, str):
			return name

		n = name.strip().upper()
		if n in self.exceptions:
			return self.exceptions[n]

		if n.startswith("MAC") and len(n) > 3:
			# Remove spaces after MAC
			rest = re.sub(r'^\s*', '', n[3:])
			return "Mac" + rest.capitalize()

		if n.startswith("MC") and len(n) > 2:
			rest = re.sub(r'^\s*', '', n[2:])
			return "Mc" + rest.capitalize()

		for p in self.particles:
			if n.startswith(p) and len(n) > len(p):
				rest = n[len(p):].strip()
				return p.title() + " " + rest.title()

		return n.title()


name_normalizer = NameNormalizer(exceptions={
	"MACDONALD": "MacDonald",
	"DEGROOT": "De Groot"
	# Add more if needed
})


# --- Helper: First/Middle Name Splitter ---

def split_first_name(pers_f_nam: Optional[str], pers_m_nam: Optional[str]) -> Tuple[Optional[str], Optional[str]]:
	pers_f_nam = (pers_f_nam or "").strip()
	pers_m_nam = (pers_m_nam or "").strip()

	if not pers_f_nam:
		return None, pers_m_nam.title() if pers_m_nam else None

	first_parts = pers_f_nam.split()

	if pers_m_nam:
		return first_parts[0].title(), pers_m_nam.title()

	if len(first_parts) == 2:
		first, middle = first_parts
		return first.title(), middle.title()

	if len(first_parts) > 2:
		return first_parts[0].title(), " ".join(first_parts[1:]).title()

	return first_parts[0].title(), None


# --- Schema ---

class THcolExportSchema(BaseModel):
	mem_num: int = Field(alias="roster_id")
	roster: Optional[str] = Field(alias="roster_status_desc")
	f_nam: Optional[str] = Field(alias="first_name")
	pref_nam: Optional[str] = Field(alias="nickname")
	l_nam: Optional[str] = Field(alias="last_name")
	call: Optional[str] = Field(alias="callsign")
	lic_cls: Optional[str] = Field(alias="lic_class")
	lic_exp_dat: Optional[str] = Field(alias="lic_exp")
	lic_num: Optional[str] = Field(alias="frn")
	lic_agncy: Optional[int] = Field(alias="agency_id")
	street: Optional[str] = Field(alias="address")
	city: Optional[str]
	st: Optional[str] = Field(alias="state")
	zip: Optional[str] = Field(alias="postalcode")
	country_cd: Optional[str] = Field(alias="country_code")
	lat: Optional[Decimal] = Field(alias="latitude")
	lon: Optional[Decimal] = Field(alias="longitude")
	elev: Optional[Decimal] = Field(alias="elevation")
	hcol_email: Optional[EmailStr] = Field(alias="email")
	hcol_email_stat: Optional[int] = Field(alias="email_status")
	phone_pri: Optional[str] = Field(alias="ni_national_format")
	phone_pri_typ: Optional[str] = Field(alias="phone_type_desc")
	phone_pri_pub: Optional[Union[int, None]] = Field(alias="publish")
	phone_alt: Optional[str] = Field(alias="alt_phone")
	phone_alt_typ: Optional[str] = Field(alias="alt_phone_type")
	phone_alt_pub: Optional[Union[int, None]] = Field(alias="alt_phone_publish")
	emer_cntct: Optional[str] = Field(alias="emergency_contact")
	join_dat: Optional[str] = Field(alias="join_date")
	left_dat: Optional[str] = Field(alias="remove_date")
	club_rank: Optional[str] = Field(alias="rank_name")
	club_pos: Optional[str] = Field(alias="position_text")
	dele: Optional[str] = Field(alias="delegate_text")
	mem_typ: Optional[str] = Field(alias="member_type")
	mem_exp_dat: Optional[str] = Field(alias="expire_date")
	club_bal: Optional[Decimal] = Field(alias="balance")
	dob: Optional[str] = Field(alias="birth_date")
	priv_mem: Optional[int] = Field(alias="private")
	tz: Optional[str] = Field(alias="time_zone")
	lst_login: Optional[str] = Field(alias="last_login_ts")
	role_cnt: Optional[int] = Field(alias="role_count")

	# --- Validators ---

	@field_validator("lat", "lon", "elev", mode="before")
	@classmethod
	def validate_decimal(cls, value: Optional[Union[str, float, int]]) -> Optional[Decimal]:
		if value is None or value == "":
			return None
		try:
			return Decimal(str(value))
		except (InvalidOperation, ValueError):
			return None

	@field_validator("club_bal", mode="before")
	@classmethod
	def convert_dollar(cls, value: str) -> Optional[Decimal]:
		if isinstance(value, str):
			return float(value.replace("$", "").replace(",", ""))
		return value

	@field_validator("phone_pri_pub", "phone_alt_pub", "hcol_email", mode="before")
	@classmethod
	def empty_string_to_none(cls, value: Optional[str]) -> Optional[Union[int, str]]:
		if value is None or value == "":
			return None
		if isinstance(value, str) and value.isdigit():
			return int(value)
		return value

	@field_validator("f_nam", "street", "city", mode="before")
	@classmethod
	def title_case(cls, value: Optional[str]) -> Optional[str]:
		if value:
			value = re.sub(r"\s+", " ", value.strip())
			return value.title()
		return value

	@field_validator("l_nam", mode="before")
	@classmethod
	def normalize_last_name(cls, value: Optional[str]) -> Optional[str]:
		return name_normalizer.normalize(value) if value else value

	@field_validator("call", mode="before")
	@classmethod
	def uppercase_callsign(cls, value: Optional[str]) -> Optional[str]:
		return value.upper() if value else value

	@field_validator("pref_nam", mode="before")
	@classmethod
	def uppercase_short_initials(cls, value: Optional[str]) -> Optional[str]:
		if value:
			value = value.strip()
			if len(value) <= 2:
				return value.upper()
		return value.title()

	@model_validator(mode="before")
	@classmethod
	def extract_middle_name(cls, values):
		f_raw = values.get("first_name")
		m_raw = values.get("middle_name")
		f_clean, m_clean = split_first_name(f_raw, m_raw)
		values["first_name"] = f_clean
		values["middle_name"] = m_clean
		return values
