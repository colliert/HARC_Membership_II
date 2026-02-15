CREATE VIEW v_harc_snn_callout_roster_suffix AS
/*
* v_harc_snn_callout_roster_suffix
* --------------------------------
* (see v_harc_snn_callout_roster for description of callout roster)
*
* Author:  Tim Collier
* Date:  November 15, 2024
*
* Purpose:  Used on the first net of the month (random night).  Prints out the list of callsigns
*           in order of their suffix.
*/
    select callsign
    ,"first name"
    ,"last name"
    ,member
    ,comments
    ,Cutoff_Days
from (select callsign
            ,case cast(substr(callsign,2,1) as integer)
                    when 0 then substr(callsign,4,length(callsign))
                else substr(callsign,3,length(callsign))
            end as "Suffix"
            ,"first name"
            ,"last name"
            ,member
            ,comments
            ,Cutoff_Days
from (select * from v_harc_snn_callout_roster)
order by 5,2);


