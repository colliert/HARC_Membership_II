select a.call 
,ifnull(c.pers_pref_nam, upper(substr(a.f_nam,1,1)) || lower(substr(a.f_nam,2))) as first_name
--,upper(substr(a.f_nam,1,1)) || lower(substr(a.f_nam,2)) as first_name
--,upper(substr(a.pref_nam,1,1)) || lower(substr(a.pref_nam,2)) as preferred_name
-- ,c.pers_pref_nam
,upper(substr(a.l_nam,1,1)) || lower(substr(a.l_nam,2)) as last_name
,b.qso_date
from v_hcol_export a
left join v_net_qso b on a.call = b.call and b.qso_date >'2024-10-12'
join v_pers c on c.pers_call = a.call
where upper(a.roster) = 'ACTIVE'
order by last_name, first_name