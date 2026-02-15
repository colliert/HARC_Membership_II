/*
 * q_HARC_snn_schedule.sql
 *
 * Author:  Tim Collier
 * Date:  October 23, 2025
 *
 * Purpose:  Print out the quarterly net control operator schedule.
 *           The Quarter is determined in the line WHERE b.quarter = '202x1y'
 */
select date(a.net_date)               as 'Net Date'
     , CASE
           WHEN c.pers_pref_nam IS NOT NULL THEN c.pers_f_nam || ' (' || c.pers_pref_nam || ')'
           ELSE c.pers_f_nam
           END || ' ' || c.pers_l_nam as 'Operator'
     , a.pers_call                    as 'Call Sign'

from t_nco_avail a
         join t_pers c on c.pers_call = a.pers_call
where scheduled = 'Y'
  AND date(a.net_date) in
      (select date(b.net_date)
       from t_nco_date b
       where b.quarter = '2026Q1')
order by 1;


s