/*
 * t_hcol_export
 * -------------
 *
 * Author:  Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  Contains the results of a Ham Club Online member export.  Ham Club Online has been designated by
 *           Henderson Amateur Radio Club, Inc. leadership as the database of record regarding membership.
 *           As part of the Ham Club Online System, an export is provided in CSV format.  That information is loaded
 *           into this table to provide membership information to the system.
 *
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
    hcol_emal       TEXT,
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


