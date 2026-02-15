select pk
,call
,first_name
,last_name
,date(qso_start,'unixepoch') as 'QSO_Start(UTC)'
,time(qso_start,'unixepoch')as 'QSO_Time(UTC)'
from v_qso_table_v008
where date(qso_start,'unixepoch') > '2024-02-04'
--order by last_name