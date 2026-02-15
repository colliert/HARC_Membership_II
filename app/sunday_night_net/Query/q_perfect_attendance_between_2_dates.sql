/*
* q_perfect_attendance
* --------------------
*
* Author:  Tim Collier
* Date:    September 23, 2025
*
* Purpose:  Determine who, for a given range of dates, checked into the net each week.
*           Basic Process is to count how many nets there were in a period by looking
*           for how many Sundays there were.
*           Then compare how many times someone checked into the net during that same period.
*           If the number of member check-ins for that period equals the number of nets for
*           that period, the member is declared as having perfect attendance at the net for that month.

*/
WITH target_dates AS (SELECT DISTINCT qso_date
                      FROM v_net_qso
                      WHERE strftime('%Y-%m', qso_date) >= '2025-01'
                        AND strftime('%Y-%m', qso_date) <= '2025-10'-- Replace '2024-09' with the target year-month
                        AND strftime('%w', qso_date) = '1' -- '1' indicates Sunday (UTC MONDAY)
)
SELECT call
     , CASE
           WHEN pers_pref_nam IS NOT NULL THEN pers_f_nam || ' (' || pers_pref_nam || ')'
           ELSE pers_f_nam
    END             as first_name
     , b.pers_l_nam as last_name
FROM v_net_qso a,
     v_pers b
WHERE strftime('%Y-%m', qso_date) >= '2025-01' -- Replace date string with the target begin year-month
  AND strftime('%Y-%m', qso_date) <= '2025-10' -- Replace date string with the target end year-month
  AND a.call = b.pers_call
GROUP BY 1, 2, 3
HAVING COUNT(DISTINCT qso_date) = (SELECT COUNT(*) FROM target_dates)
ORDER BY l_nam, f_nam;
