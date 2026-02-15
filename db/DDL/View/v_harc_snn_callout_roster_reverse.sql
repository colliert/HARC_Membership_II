CREATE VIEW v_harc_snn_callout_roster_reverse AS
/*
* v_harc_snn_callout_roster_reverse
* ---------------------------------
* (see v_harc_snn_callout_roster for description of callout roster)
*
* Author:  Tim Collier
* Date:  November 15, 2024
*
* Purpose:  For Random nights, print out the roster in reverse order (member/nonmember, and last name descending).
*/
    SELECT callsign,
           "first name",
           "last name",
           member,
           comments,
           Cutoff_Days
      FROM (
               SELECT callsign,
                      "first name",
                      "last name",
                      member,
                      comments,
                      Cutoff_Days
                 FROM (
                          SELECT *
                            FROM v_harc_snn_callout_roster
                      )
                ORDER BY 4,
                         "last name" DESC,
                         "first name" DESC
           );


