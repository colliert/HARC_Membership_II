CREATE VIEW v_maint_add_person_to_pers AS
/*
* v_maint_add_person_to_pers
* --------------------------
*
* Author:  Tim Collier
* Date:  November 15, 2024
*
* Purpose:  Make sure everyone who has checked in exists in t_pers, which is where we keep track of things like
*           membership status (member / non-member) and preferred name (if one exists).  If the call sign
*           that appears in the t_net_qso table does not appear in the t_pers table, their info will
*           appear here so that they may be added.
 */
select call
     , f_nam
     , NULL as m_nam
     , l_nam
     , null as Preferred_nam
     , 0    as person_type
from v_net_qso
where call not in
      (select pers_call from v_pers);


