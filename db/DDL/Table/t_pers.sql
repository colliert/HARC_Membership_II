/*
 * t_pers
 * ------
 *
 * Author:  Tim Collier
 * Date:  November 18, 2024
 *
 * Purpose:  Store system information about anyone who checks into the net.  Of particular interest are:
             (a)  Membership status of the callsign.
 *           (b)  Name by which the person prefers to be called.
 */
create table t_pers
(
    pers_call     TEXT   not null
        primary key,
    pers_f_nam    TEXT,
    pers_m_nam    TEXT,
    pers_l_nam    TEXT,
    pers_pref_nam TEXT,
    pers_typ_cd   NUMBER not null
        constraint pers_typ_FK
            references t_pers_typ
);


