/*
q_sunday_dates_for_quarter.sql
==========================
Author: J. Timothy Collier
Created: 1/2/26
Last Updated: 1/2/26
==========================
Purpose: List the Sunday dates for a given quarter
*/
SELECT net_date
FROM t_nco_date
WHERE quarter = '2026Q1'
ORDER BY net_date;