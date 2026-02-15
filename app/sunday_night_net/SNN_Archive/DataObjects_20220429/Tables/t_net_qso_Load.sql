drop table if exists t_net_qso;
create table t_net_qso as select pk
     , call
     , contest_id
     , first_name
     , last_name
     , datetime(qso_start, 'unixepoch') as qso_start
    from qso_table_v008;