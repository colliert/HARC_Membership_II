CREATE VIEW v_harc_snn_callout_roster_random AS
/*
* v_harc_snn_callout_roster_random
* --------------------------------
* (see v_harc_snn_callout_roster for description of the roster)
*
* Author:  Tim Collier
* Date:  November 15, 2024
*
* Purpose:  Randomize the order of the HARC Sunday Night Net Roster.  Basically, generate the callout
*           list from v_harc_snn_callout_roster, and then create a column of random numbers (random()), and
*           sort the callout roster by the ranndom number (within member/nonmember).
*/
    SELECT callsign,
           "first name",
           "last name",
           member,
           comments,
           Cutoff_Days
      FROM (
               SELECT random(),
                      callsign,
                      "first name",
                      "last name",
                      member,
                      comments,
                      Cutoff_Days
                 FROM (
                          SELECT *
                            FROM v_harc_snn_callout_roster
                      )
                ORDER BY 5,
                         1
           );


