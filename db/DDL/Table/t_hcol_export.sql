/*
t_hcol_export.sql
==========================
Author: J. Timothy Collier
Created: 2/15/26
Last Updated: 2/15/26
==========================
Purpose: Store information from the source of truth for club membership.  This mirrors
         the export from Ham Club Online.

*/

create table t_hcol_export
(
    mem_num         NUMERIC,
    roster          TEXT,
    f_nam           TEXT,
    pref_nam        TEXT,
    l_nam           TEXT,
    call            TEXT,
    lic_cls         TEXT,
    lic_exp_dat     TEXT,
    lic_num         TEXT,
    lic_agncy       TEXT,
    street          TEXT,
    city            TEXT,
    st              TEXT,
    zip             TEXT,
    country_cd      TEXT,
    lat             NUMERIC,
    lon             NUMERIC,
    elev            NUMERIC,
    hcol_email      TEXT,
    hcol_email_stat TEXT,
    club_email      TEXT,
    club_email_stat TEXT,
    phone_pri       TEXT,
    phone_pri_typ   TEXT,
    phone_pri_pub   TEXT,
    phone_alt       TEXT,
    phone_alt_typ   TEXT,
    phone_alt_pub   TEXT,
    emer_cntct      TEXT,
    join_dat        TEXT,
    left_dat        TEXT,
    club_rank       TEXT,
    club_pos        TEXT,
    dele            TEXT,
    mem_typ         TEXT,
    mem_exp_dat     TEXT,
    club_bal        NUMERIC,
    dob             TEXT,
    priv_mem        NUMERIC,
    tz              TEXT,
    lst_login       TEXT,
    role_cnt        NUMERIC
);


