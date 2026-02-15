select call_sign
,first_name
,last_name
,t_pers.pers_typ
from daylite_harc_mem
join t_pers on call_sign = t_pers.pers_call
where pers_typ = 0
order by last_name

