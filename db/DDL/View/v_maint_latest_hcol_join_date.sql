CREATE VIEW v_maint_latest_hcol_join_date AS
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
    select call
,f_nam as "First_Name"
,l_nam as "Last_Name"
,max(join_dat)  as Latest_Join_Date
from v_hcol_export;


