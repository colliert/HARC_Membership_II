/*
q_update_non-mem_to_mem.sql
---------------------------

Updates any row of the t_pers table (everyone who has every checked into the SNN), 
where the pers_typ_cd is 0 (non-member).  Sets pers_typ_cd = 1 (member) if that call appears
in the HCOL database (the membership database of record
*/
update t_pers
set pers_typ_cd=1
where pers_call in 
    (
    select call
    from v_hcol_export
    where (roster = 'Active' or roster = 'Expiring Soon')
            and
            call in
                (
                select pers_call from v_pers where pers_typ_cd = 0
                )
    )        