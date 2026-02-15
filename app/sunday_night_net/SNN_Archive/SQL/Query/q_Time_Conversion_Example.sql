/*
Example of Time Conversion
--------------------------

qso_start is stored in unixepoch format.
The formula to convert unixepoch to julian time is:
(unix_time / 86400) + 2440587.5
 */
select pk
,qso_start as 'Raw_Unix_date'
     , datetime(qso_start, 'unixepoch')          as 'SQLite Unix Conversion'
     , datetime((qso_start / 86400) + 2440587.5) as 'Calculated'
from v_net_qso