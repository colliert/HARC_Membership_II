-- auto-generated definition
create table t_pers_BU
(
    mem_call      TEXT not null
        primary key,
    mem_f_nam     TEXT,
    mem_m_nam     TEXT,
    mem_l_nam     TEXT,
    mem_nicknam   TEXT,
    mem_lic_class TEXT,
    pers_typ      integer
        references t_pers_typ
);

