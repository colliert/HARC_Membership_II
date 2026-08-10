/* 
q_mem_in_pers_not_in_mem_list.sql
=============================================
        Author: J. Timothy Collier
          User: tcollier
       Created: 2026-08-10
 Last Modified: 2026-08-10
=============================================

Purpose:  Identify those in t_pers who are identified as members, but are not members
          according to the HCOL website (the database of truth).

Design Notes:
*/
select *
from t_pers
where pers_typ_cd = 1 and
      pers_call not in (select callsign from t_hcol_mem_list)
order by pers_call;