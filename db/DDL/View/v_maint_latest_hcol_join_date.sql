CREATE VIEW v_maint_latest_hcol_join_date as
/*
* v_maint_latest_hcol_join_date
* -----------------------------
*
* Author: Tim Collier
* Date:  November 15, 2024
*
* Purpose:  Find the latest join date in the current t_hcol_export table and compare that against the
*           latest date in the Ham Club Online system.  If Ham Club Online has some additional members that
*           have yet to be added, download the HCOL Members export, and import it into t_hcol_export.
*/

with find_max_date as (select max(join_dat) as max_join_dat from v_hcol_export)
select a.call
     , a.l_nam
     , a.f_nam
     , a.join_dat
from main.v_hcol_export a
   , find_max_date b
where a.join_dat = Max_join_dat;
