/*
 * q_count_by_date_v008
 * --------------------
 * Author:  Tim Collier
 *
 *  Count the number of checkins by date.
 *  The date is taken from qso_start in the qso_table_v008 table
 *  which is maintained by MacLoggerDX
 */
select date(qso_start, 'unixepoch') as "Net Date"
     , count(qso_start)             as "Checkins"
from v_qso_table_v008
group by 1
order by 1