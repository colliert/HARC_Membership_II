/*
q_maint_insert_new_member.sql
-----------------------------
Author:  Tim Collier

Purpose:  Insert members who appear in the Ham Club Online membership database of
          record (t_hcol_expotr) into the table that keeps track of anyone (member or not)
          who has ever checked into the net (t_pers).
          
          Select columns from v_hcol_export where the roster column is either 'Active' or 
          'Expiring Soon', and, who does not appear in the t_pers table with a pers_typ_cd
          of 1 (indicates member)
*/
insert into t_pers 
select 
     call
     ,f_nam
     ,NULL
     ,l_nam
     ,pref_nam
     ,1
from v_hcol_export
where (roster = 'Active' or roster = 'Expiring Soon')
        and
            length(call) > 0
        and
            call not in
                        (
                        select pers_call from v_pers
                        )