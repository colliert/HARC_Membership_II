/*
q_nco_availability.sql
==========================
Author: J. Timothy Collier
Created: 12/29/25
Last Updated: 12/29/25
==========================
Purpose: List operators who said they were available for each net date
*/
select a.net_date
     , b.f_nam
     , b.l_nam
     , a.pers_call
from t_nco_avail a
         join t_hcol_export b on a.pers_call = b.call
join t_nco_date c on c.net_date = a.net_date
where c.quarter = ?
order by a.net_date, b.l_nam