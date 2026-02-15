select pk
,call
,first_name
,last_name
,date(qso_start,'unixepoch') as 'Mtg Date'
from v_qso_table_v007
where date(qso_start,'unixepoch') = date('2020-03-28')
order by last_name