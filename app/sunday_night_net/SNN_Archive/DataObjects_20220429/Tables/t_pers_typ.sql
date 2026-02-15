-- auto-generated definition
create table t_pers_typ
(
    pers_typ_cd   int default 0 not null
        constraint t_pers_typ_pk
            primary key,
    pers_typ_desc text not null
);

