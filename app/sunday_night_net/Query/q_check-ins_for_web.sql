/*
* q_check-ins_for_web
* -------------------
* 
* Author:  Tim Collier
* Date:  September 10, 2024
* Requestor: Gene McAvoy (KG7XD)
* 
* Purpose:  Generate a csv file, that will be read into MS Excel,
*           be converted to a pivot table, and uploaded to the W7HEN.org
*           website (members area).  It will show the Sunday Night Check-ins
*           by member.
*           
*/
select a.l_nam || ', ' || a.f_nam || '  (' || a.call || ')' as Person
     , qso_date                                             as UTC_Checkin_Date
from v_net_qso a
         join v_pers b on a.call = b.pers_call
where a.qso_date >= '2024-01-01'
  AND b.pers_typ_cd = 1
order by 1