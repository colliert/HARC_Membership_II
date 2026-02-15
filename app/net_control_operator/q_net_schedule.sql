select a.sched_date
     ,b.f_nam || ' ' || b.l_nam || ' (' || a.pers_call ||')' as Operator
from t_nco_schedule a
join t_hcol_export b on a.pers_call = b.call
where quarter = ?
Order by a.sched_date