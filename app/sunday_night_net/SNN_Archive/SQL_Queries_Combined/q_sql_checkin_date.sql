select  call
,first_name
,last_name
,date(qso_start) as 'UTC Date'
,time(qso_start) as 'UTC Time'
from v_net_qso
where date(qso_start) > '2023-12-03'
order by last_name