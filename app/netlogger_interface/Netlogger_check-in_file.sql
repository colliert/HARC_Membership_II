/*
 Author:  Tim Collier
 Date:  November 9, 2025
 Purpose:  Extract from database to input into Netlogger via check-in file.
  This will apparently work once l I get all of the Netlogger fields identified.
  */

 SELECT
    ROW_NUMBER() OVER (ORDER BY "Callsign") AS seq,
    "Callsign",
    'NV',
    'h1',
' ',
'Henderson',
"First Name" || ' ' || "Last Name" AS Name,
'op',
 '',
 ' ',
 'Clark',
 'DM25kx',
 '1315 Dream Valley St',
'89052-4001',
'291'
 '',
'',
'',
'United States',
'Tim'
FROM v_harc_snn_callout_roster

1




Callsign: The amateur radio callsign of the checking-in station. This is a primary identifier.
Name: The name of the operator.
QTH: The location (e.g., city, state) of the operator.
Time: The time of the check-in. While NetLogger often uses its internal clock for new check-ins, including a time column is crucial for importing historical data.
Band: The frequency band used for the check-in (e.g., 20M, 40M).
Mode: The mode of operation (e.g., SSB, CW, FT8).
Comments: An optional field for any additional notes or remarks.