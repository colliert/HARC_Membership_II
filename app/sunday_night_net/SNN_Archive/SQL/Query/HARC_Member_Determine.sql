select v_qso_table_v008.call
,v_qso_table_v008.last_name
,CASE
	when ifnull(v_harc_member.pers_call,'0') = '0' then 'non-member'
	else 'member'
	END as 'member_status'
from v_qso_table_v008
left join v_harc_member on call=pers_call
