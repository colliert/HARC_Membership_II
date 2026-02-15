select pk
,call
,first_name
,last_name
,date(qso_start,'unixepoch') as 'UTC Date'
,time(qso_start,'unixepoch') as 'UTC Time'
from v_qso_table_v008
where date(qso_start,'unixepoch') > '2023-12-10'
--order by last_name