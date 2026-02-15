CREATE VIEW v_maint_show_dupes AS
/*
 * v_maint_show_dupes
 * ------------------
 *
 * Author:  Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  Check for duplicate items in v_harc_snn_callout_roster
 *
 */
select callsign        as item_checked
     , 'Callsign'      as dupe_type
     , count(callsign) as num_found
from (select callsign, "First Name", "Last Name" from v_harc_snn_callout_roster)
group by callsign

Union

select full_name        as item_checked
     , 'Name'           as dupe_type
     , count(full_name) as num_found
from (select callsign, "First Name", "Last Name", "Last Name" || ", " || "First Name" as full_name
      from v_harc_snn_callout_roster)
group by full_name
order by 3 DESC, 1;


