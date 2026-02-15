CREATE VIEW v_checkins_most_recent_net as
    /*
    * v_checkins_most_recent_net
    * --------------------------
    *
    * Author:  Tim Collier
    * Date: November 15, 2024
    *
    * Purpose:  Retrieve list of check-ins from the most recent Sunday Night Net.
    *           Note, that because of the joining of v_pers, if a person is not listed
    *           in the t_pers table, they will not appear on this report.
    *
    */
with max_checkin_date as (select max(qso_date) as max_date from v_net_qso)
select call
     , CASE
           WHEN pers_pref_nam IS NOT NULL THEN pers_f_nam || ' (' || pers_pref_nam || ')'
           ELSE pers_f_nam
    END              as first_name
     , b.pers_l_nam  as last_name
     , qso_date      as UTC_Checkin_Date
     , qso_time      as UTC_Time
     , b.pers_typ_cd as Member_Status
from v_net_qso a
   , max_checkin_date
         join v_pers b on a.call = b.pers_call
where a.qso_date >= max_date;


