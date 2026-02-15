/*
 * t_pers_typ
 * ----------
 *
 * Author:  Tim Collier
 * Date:  November 20, 2024
 *
 * Purpose:  Store the codes for the various types of people stored in t_pers.  Current types are:
 *           0 - non-member
 *           1 - member
 *           2 - member, old callsign
 *           3 - silent key
 *           4 - non-member, old callsign
 */
create table t_pers_typ
(
    pers_typ_cd   NUMERIC not null
        primary key,
    pers_typ_desc TEXT    not null
);


