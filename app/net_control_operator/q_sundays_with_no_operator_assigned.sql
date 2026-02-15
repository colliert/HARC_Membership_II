/*
q_sundays_with_no_operator_assigned.sql
==========================
Author: J. Timothy Collier
Created: 1/2/26
Last Updated: 1/2/26
==========================
Purpose: List Sundays that have no operator assigned.  Should only list Sundays in quarters
         after the current quarter.
*/\
SELECT d.net_date
FROM t_nco_date d
         LEFT JOIN t_nco_avail a
                   ON a.net_date = d.net_date
                       AND a.scheduled = 'Y'
WHERE d.quarter = '2026Q2'
GROUP BY d.net_date
HAVING COUNT(a.pers_call) = 0;