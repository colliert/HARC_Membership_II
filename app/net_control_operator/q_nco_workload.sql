select b.f_nam ||' '||b.l_nam || ' (' || pers_call || ')' as NCO, count(pers_call) as Number_of_Nets
from t_nco_schedule a
join t_hcol_export b on a.pers_call = b.call
where quarter = ?
group by pers_call