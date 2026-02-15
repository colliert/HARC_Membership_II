/* q_Master_List_Personal_List_Compare.sql
   Author:  Tim Collier
   Date:  April 4, 2022

   Compare Master Membership List (maintained by Treasurer and Secretary) to personal list.

   Looks for call signs that appear in the master list that are not in the personal list and declares
   those call signs as needing to be Added as a member.

   Looks for call signs that appear in the person list but NOT in the master list and declares
   those call signs as needing to be Removed as a member.
*/
select '01-Add new member' as 'Task'
       , upper(callsign) as 'Call_Sign'
       , l_nam as 'Last_Name'
from HARC_mem_official
where upper(trim(callsign)) not in
      (select upper(trim(call_sign)) from Daylite_HARC_Mem where call_sign is not null)
union
select '02-Remove as Member' as 'Task'
     , call_sign as 'Call_Sign'
     , last_name as 'Last_Name'
from Daylite_HARC_Mem
where upper(trim(call_sign)) not in
      (select upper(trim(callsign)) from HARC_mem_official where callsign is not null)
order by 1, 3;
