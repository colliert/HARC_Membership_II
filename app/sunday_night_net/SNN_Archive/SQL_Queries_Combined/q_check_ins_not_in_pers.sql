/*
* q_Check_ins_not_in_pers
* -----------------------
* List Check ins to Sunday Night Net that are not listed in the
* t_pers table of known checkins.  Mostly to be able to generate
* suffix listing, and to get the operator's Nickname correct
*
* Author:  Tim Collier
* Date: November 22, 2020
*
*/
select distinct call
     , first_name
     , last_name
 --    , date(qso_start) as qso_date
from v_net_qso
where call not in
      (select pers_call from v_pers)