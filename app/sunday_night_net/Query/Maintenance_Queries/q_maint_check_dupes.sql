--
-- q_maint_check_dupes
-- -------------
-- 
-- Author:  Tim Collier
--   Date:  July 18,2023
--
--  Check the roster (v_harc_snn_callout_roster) for duplicate callsigns and/or duplicate names for the callouts.
--  This should prevent someone from being called more than once during the Sunday Night Net. 
--
select callsign as item_checked
     ,'Callsign' as dupe_type
     ,count(callsign) as num_found 
from (select callsign, "First Name","Last Name" from v_harc_snn_callout_roster)
group by callsign

Union

select full_name as item_checked
     ,'Name' as dupe_type
     ,count(full_name) as num_found 
from (select callsign, "First Name","Last Name", "Last Name" || ", "|| "First Name" as full_name from v_harc_snn_callout_roster)
group by full_name
order by 3 DESC, 1