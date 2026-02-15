/*
q_copy_v008_to_t_net_qso
------------------------
Author:  Tim Collier
Date: December 26, 2025

Purpose:  Copy all data in the qso_table_v008 table (created by MacLoggerDX logging software) into the t_net_qso table.
          the t_net_qso table has a corresponding view (v_net_qso.sql).  Most of the other views are derived from
          v_net_qso.sql.  There is no major need for the table t_net_qso, as the view could be defined from any table
          that had the appropriate data items.  The table was used in development to make the process a little cleaner.
*/
delete from t_net_qso where call is not null;
insert into t_net_qso
    select
         a.pk
        ,a.call
        ,a.contest_id
        ,upper(substr(a.first_name,1,1)) || lower(substr(a.first_name,2))
        ,upper(substr(a.last_name,1,1)) || lower(substr(a.last_name,2))
        ,date(a.qso_start,'unixepoch') as qso_date
        ,time(a.qso_start,'unixepoch') as qso_time
    from qso_table_v008 a;