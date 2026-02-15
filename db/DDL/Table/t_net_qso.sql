/*
 * t_net_qso
 * ---------
 *
 * Author:  Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  This table forms the starting point of tracking the check-ins for the Henderson Amateur Radio Club's
 *           Sunday Night Net.
 *           As of November 15, 2024, an extract is taken from qso_table_v008 and loaded into this table.
 *           qso_table_v008 belongs to MacLoggerDX.  Future implementations of the HARC SNN System may employ
 *           different tables and/or methods.  Therefore, t_net_qso is the common starting point for the system.
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


