/*
 q_checkin_list
 --------------
 
Author:    Tim Collier
Date:      April 10, 2023

Purpose:  Produce a list of the actual checkins for a particular Sunday Night Net.
          The selection criteria can be by Net date, or contest_id, which are selected
          by commenting and un-commenting below.
          
*/

select call
,first_name
,Last_Name
,date(qso_start,'unixepoch') as UTC_Checkin_Date
,time(qso_start,'unixepoch') as UTC_Time
,   case b.pers_typ
        when 1 
            then 'Member'
        else 'Non-Member'
     end Member_Status     

from v_net_qso a
join v_pers b on a.call=b.pers_call
where contest_id = 'HARC-SNN-20230409'
-- where date(qso_start,'unixepoch')= ? 
--order by pers_typ desc,last_name,first_Name
--order by Member_Status, Last_Name, First_Name
 order by UTC_Time