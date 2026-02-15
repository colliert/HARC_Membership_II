with find_max_date as (select max(join_dat) as max_join_dat from v_hcol_export)
select a.call
     , a.l_nam
     , a.f_nam
     , a.join_dat
from main.v_hcol_export a
   , find_max_date b
where a.join_dat = Max_join_dat