-- auto-generated definition
create table t_pers
(
    pers_call      TEXT not null
        primary key,
    pers_f_nam     TEXT,
    pers_m_nam     TEXT,
    pers_l_nam     TEXT,
    pers_nicknam   TEXT,
    pers_lic_class TEXT,
    pers_typ       integer
        references t_pers_typ
);

