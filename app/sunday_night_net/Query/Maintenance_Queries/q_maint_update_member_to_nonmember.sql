/*
 q_remove_as_member
 ------------------
 Author: Tim Collier
 
Purpose:  Declare persons in the t_pers table, who are currently labeled as members
          (pers_typ_cd=1), but do not appear in t_hcol_export (loaded from the membership
          database of record on HamClubOnline, to non-members (pers_typ_cd = 0).
*/
update t_pers
set pers_typ_cd = 0
where pers_call in
    (
    select 
         pers_call
    from v_pers 
    where pers_typ_cd = 1
    and 
    pers_call not in
        (
        select call from v_hcol_export
        where (roster = 'Active' or roster = 'Expiring Soon')
        )
    )    