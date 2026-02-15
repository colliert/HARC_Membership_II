'''
update_HCOL_member_list.py
-------------------------

Author:  Tim Collier
Date:    February 3, 2025

Purpose:  Use the API from HamClubOnline to update the HCOL member list.  Pydantic is used to validate
          the incoming API responses.  Also, several text fields are standardized (Initial Capital, all caps, etc.).

'''

import json
import os

import requests
from dotenv import load_dotenv  # to read the .env file

from db.database import get_session  # Database connection
from db.models.harc_snn_3_prod import THcolExport  # SQLAlchemy ORM model
from schema.pd_schema import THcolExportSchema  # Pydantic model

# Load the .env file (used for security purposes to hide user name and password)
# API URL and Data
CURL_URL = "https://secure.hamclubonline.com/api/members.php"
load_dotenv()
curl_data = {
	"version": os.getenv("CURL_VERSION"),
	"club": os.getenv("CURL_CLUB"),
	"user": os.getenv("CURL_USER"),
	"password": os.getenv("CURL_PASSWORD"),
}

# Fetch Data from API
try:
	hcol_mem_resp = requests.post(CURL_URL, data=curl_data)  # Get HCOL curl_data via API
	hcol_mem_resp.raise_for_status()
	hcol_mem_resp_json = hcol_mem_resp.json()
except requests.RequestException as e:
	print(f"Error fetching data: {e}")
	exit(1)

# Ensure response is OK
if hcol_mem_resp_json.get("response") != "OK":
	print("Invalid response from API.")
	exit(1)

# Database Session
session = next(get_session())

# Wipe the table before inserting new records

session.query(THcolExport).delete()

hcol_resp_mem_list = hcol_mem_resp_json["members"]  # pick out the Dictionary field 'members'

hcol_members = hcol_resp_mem_list[0]  # Get the first element in the list (which happens to be a dictionary of dictionaries)
print(hcol_members)
exit(14)
found_error = False
num_mem_examined = 0
num_mem_added = 0
num_err = 0
for hcol_seq, mem_info in hcol_members.items():

	num_mem_examined += 1

	try:
		print(
			f"Now working on member: {mem_info['roster_id']} - "
			f"{mem_info['callsign']} - "
			f"{mem_info['last_name']} - "
			f"{mem_info['roster_status_desc']}")
		validated_member = THcolExportSchema(**mem_info)  # Validate using Pydantic
		new_member = THcolExport(**validated_member.model_dump())  # Map to ORM model
		session.add(new_member)
		num_mem_added += 1
	except Exception as e:
		print(f"Error validating or inserting member {mem_info['roster_id']}: {e}")
		print(f"\n--------------------------\n")
		print(f'I N C O M I N G    D A T A')
		print(f"\n--------------------------\n")
		found_error = True
		num_err += 1

# Commit changes and close session
if found_error == False:
	session.commit()
	print(f"\n------------------------------\n")
	print(f"Database updated successfully.\n{num_mem_added} Members added")
	print("\n------------------------------\n")
else:
	session.rollback()
	print("\n-----------------------\n")
	print(f"Database update failed.\n{num_err} Errors found")
	print("\n-----------------------\n")

session.close()
