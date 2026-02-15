CREATE VIEW v_maint_cha_nonmember_to_member AS
/*
* v_maint_cha_nonmember_to_member
* -------------------------------
*
* Author:  Tim Collier
* Date: November 25, 2025
*
* Purpose:  Check the list of people in t_pers against the HARC membership roles (t_HCOL_export).  If the
*           person exists in t_pers and is not designated a member, but they should be, list that person.
*/
select call
     , f_nam
     , l_nam
     , roster
from v_hcol_export
where (roster = 'Active' or roster = 'Expiring Soon')
  and call in
      (select pers_call from v_pers where pers_typ_cd = 0);


