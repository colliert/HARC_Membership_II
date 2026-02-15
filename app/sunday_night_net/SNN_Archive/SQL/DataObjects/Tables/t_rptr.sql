-- auto-generated definition
create table t_rptr
(
    rptr_cd            TEXT not null
        primary key,
    rptr_desc          TEXT,
    rptr_call          TEXT,
    rptr_tx_freq       REAL,
    rptr_rx_freq       REAL,
    rptr_ctcss         REAL,
    rptr__lat          REAL,
    rptr_long          REAL,
    rptr_allstar_node  INTEGER,
    rptr_echolink_node INTEGER
);

