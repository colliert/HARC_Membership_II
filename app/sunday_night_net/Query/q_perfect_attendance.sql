/*
* q_perfect_attendance
* --------------------
*
* Author:  Tim Collier
* Date: October 3, 2024
*
* Purpose:  Determine who, for a given month, checked into the net each week.
*           Basic Process is to count how many nets there were in a month by looking
*           for how many Sundays there were.
*           Then compare how many times someone checked into the net during that same month.
*           If the number of member check-ins for that month equals the number of nets for
*           that month, the member is declared as having perfect attendance at the net for that month.

*/
WITH target_dates AS (SELECT DISTINCT qso_date
                      FROM v_net_qso
                      WHERE strftime('%Y-%m', qso_date) = '2025-10' -- Replace '2024-09' with the target year-month
                        AND strftime('%w', qso_date) = '1' -- '1' indicates Sunday (UTC MONDAY)
)
SELECT call
     , CASE
           WHEN pers_pref_nam IS NOT NULL THEN pers_f_nam || ' (' || pers_pref_nam || ')'
           ELSE pers_f_nam
    END             as first_name
     , b.pers_l_nam as last_name
     ,  strftime('%Y-%m', qso_date) as month
FROM v_net_qso a,
     v_pers b
WHERE strftime('%Y-%m', qso_date) = '2025-10' -- Replace '2024-09' with the target year-month
  AND a.call = b.pers_call
GROUP BY 1, 2, 3
HAVING COUNT(DISTINCT qso_date) = (SELECT COUNT(*) FROM target_dates)
ORDER BY l_nam, f_nam;
