/*
* q_snn_checkins_by_time.sql
*-------------------
*
* Title:   Sunday Night Checkin list (by name).
* Author:  Tim Collier
* Date:    11/12/23
*
* List checkins from v_net_qso.sql where date is greater than the given date
*
*/
select call
     , first_name
     , last_name
     , date(qso_start) as UTC_Date
     , time(qso_start) as UTC_TIME
from v_net_qso
where date(qso_start) >= (select checkin_date from v_checkin_report_date)
order by last_name, first_name