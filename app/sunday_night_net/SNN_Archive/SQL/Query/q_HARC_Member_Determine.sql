select a.call
,a.last_name
,CASE
	when ifnull(v_harc_member.pers_call,'0') = '0' then 'non-member'
	else 'member'
	END as 'member_status'
from v_net_qso a
left join v_harc_member on a.call= v_harc_member.pers_call
