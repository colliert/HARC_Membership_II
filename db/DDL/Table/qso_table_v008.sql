/*
 * qso_table_v008
 * --------------
 *
 * Author:  Agro, D. (August 22, 2023). MacLoggerDX (6.53). Dog Park Software.
            Retrieved  October 21, 2024 from https://dogparksoftware.com/MacLoggerDX.html
 * Date: October 21, 2024
 *
 * Purpose:  Base table for the MacLoggerDX software.  Since the base table was written to SQLite, it was decided
 *           to add additioanl tables to the SQLite database, and the HARC SNN Net database was created.
 *           (WARNING.  This table should not be modified in any way -- it is Read-Only.)
 */
create table qso_table_v008
(
    pk             INTEGER
        primary key,
    my_grid        TEXT,
    my_call        TEXT,
    my_rig         TEXT,
    call           TEXT,
    first_name     TEXT,
    last_name      TEXT,
    street         TEXT,
    city           TEXT,
    county         TEXT,
    state          TEXT,
    postal_country TEXT,
    zip            TEXT,
    grid           TEXT,
    dxcc_country   TEXT,
    iota           TEXT,
    sota           TEXT,
    cq_zone        TEXT,
    itu            TEXT,
    ten_ten        TEXT,
    email          TEXT,
    url            TEXT,
    mode           TEXT,
    band_rx        TEXT,
    band_tx        TEXT,
    rst_sent       TEXT,
    rst_received   TEXT,
    qsl_via        TEXT,
    qsl_sent       TEXT,
    qsl_received   TEXT,
    srx            TEXT,
    stx            TEXT,
    comments       TEXT,
    satellite      TEXT,
    qso_start      REAL,
    qso_done       REAL,
    latitude       REAL,
    longitude      REAL,
    tx_frequency   REAL,
    rx_frequency   REAL,
    azimuth        REAL,
    elevation      REAL,
    power          REAL,
    srx_numeric    INTEGER,
    stx_numeric    INTEGER,
    dxcc_id        INTEGER,
    contest_id     TEXT,
    my_sota        TEXT,
    skcc           TEXT,
    pota           TEXT,
    my_pota        TEXT,
    wwff           TEXT,
    my_wwff        TEXT,
    sig            TEXT,
    my_sig         TEXT,
    sig_info       TEXT,
    my_sig_info    TEXT,
    ext_val_1      TEXT,
    ext_val_2      TEXT,
    ext_val_3      TEXT,
    ext_val_4      TEXT,
    distance       REAL
);


