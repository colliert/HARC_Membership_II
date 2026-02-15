/*
q_not_heard_from.sql
==========================
Author: J. Timothy Collier
Created: 12/29/25
Last Updated: 12/29/25
==========================
Purpose: List Net Control Operting Stations from whom we have not heard regarding the current quarter's schedule
*/
select a.pers_call
     , c.pers_f_nam
     , c.pers_l_nam
from t_nco_operator a
         join t_pers c on a.pers_call = c.pers_call
where not exists (select 1
                  from t_nco_avail b
                  where net_date > '2026-01-01' -- Change This each quarter
                    and a.pers_call = b.pers_call)

