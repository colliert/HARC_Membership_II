/* 
q_hcol_mem_not_in_pers_2..sql
=============================================
        Author: J. Timothy Collier
          User: tcollier
       Created: 2026-08-10
 Last Modified: 2026-08-10
=============================================

Purpose: Identify members of t_hcol_mem_list, developed from the HCOL system and copying the roster list
         to a spreadsheet, converting the spreadsheet to a csv file, and then importing that
         into t_hcol_mem_list.  Then, compare that to t_pers, which was orginally developed to keep
         track of all callsigns contacted by the HARC Sunday Night Net.  Since my credentials were pulled
         from HCOL, I can no longer use the API and have to rely on this method, instead.

Design Notes:
*/
select *
from t_hcol_mem_list
where callsign not in
    (select pers_call from t_pers)