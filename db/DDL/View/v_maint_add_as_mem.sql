CREATE VIEW v_maint_add_as_mem AS
/*
* v_main_add_as_mem
* -----------------
*
* Author:  Tim Collier
* Date:  November 15, 2024
*
* Purpose:  Compare the list of HARC members in t_hcol_export against the entries in t_pers.  If a member does
*           not appear in t_pers, they should be added and their information will be reported here.
*/
    select
     call
     ,f_nam
     ,l_nam
     ,roster
from v_hcol_export
where (roster = 'Active' or roster = 'Expiring Soon')
        and
            length(call)>0
        and
            call not in
                        (
                        select pers_call from v_pers where pers_typ_cd = 1
                        );


