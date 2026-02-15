CREATE VIEW v_maint_remove_as_member AS
/*
 * v_maint_remove_as_member
 * ------------------------
 *
 * Author: Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  Check members of t_pers who are designated as members against the t_hcol_export table.  It they do not
 *           appear in the t_hcol_export member, they are not HARC members and should have their membership status
 *           changed in t_pers (going from a 1 = member to 0 = non-member.).
 */
select
     pers_call
     ,pers_f_nam
     ,pers_l_nam
from v_pers 
where pers_typ_cd = 1
    and
     pers_call not in
    (
        select  call from v_hcol_export
        where (roster = 'Active' or roster = 'Expiring Soon')
    );


