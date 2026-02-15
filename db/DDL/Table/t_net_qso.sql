/*
t_net_qso.sql
==========================
Author: J. Timothy Collier
Created: 2/15/26
Last Updated: 2/15/26
==========================
Purpose:  Store the results of checkins to the HARC Sunday Night Net.
          Currently this table is sourced from qso_table_v008, which is MacLoggerDX's
          database.  It is designed, however, to allow easy update from almost any source,
          indlucing spreadhseets.
          This is the starting point, or starting table, for the HARC Sunday Night Net.

*/

create table t_net_qso
(
    qso_key  Numeric not null
        primary key,
    call     TEXT,
    net_id   TEXT,
    f_nam    TEXT,
    l_nam    TEXT,
    qso_date TEXT,
    qso_time TEXT
);


