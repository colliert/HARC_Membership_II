select pk
,call
,first_name
,last_name
,ifnull((select mem_call from v_harc_member where v_harc_member.mem_call=v_qso_table_v007.call),'Non-Member') as Member
,datetime(qso_start,'unixepoch')
from v_qso_table_v007
where datetime(qso_start,'unixepoch')  BETWEEN '2018-10-14' and '2018-10-15'
order by Member, last_name 
