/*
t_pers_typ.sql
==========================
Author: J. Timothy Collier
Created: 2/15/26
Last Updated: 2/15/26
==========================
Purpose:  Store types of persons that exist in the t_pers table.  Current values are:
          0 = Non-member
          1 = Club member
          2 = Club member - Old Callsign
          3 = Silent Key
          4 = Non-member - Old Callsign

*/
c
reate table t_pers_typ
(
    pers_typ_cd   NUMERIC not null
        primary key,
    pers_typ_desc TEXT    not null
);


