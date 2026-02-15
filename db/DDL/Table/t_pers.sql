/*
t_pers.sql
==========================
Author: J. Timothy Collier
Created: 2/15/26
Last Updated: 2/15/26
==========================
Purpose:  Contains information about persons who have checked into the HARC
          Sunday Night Net.
          Since the HARC Sunday Night Net allows both members and non-members to check
          into the net, a place to store all persons' information was necessayr.  The
          HARC Membership Table (t_harc_Export) is a source of member-only
          information.
          Anybody who ever checked into the net is store here.  There actual net
          check-in information is in t_net_qso.

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


