-- Table: qso_table_v007
DROP TABLE IF EXISTS qso_table_v007;
CREATE TABLE qso_table_v007 ('pk' INTEGER PRIMARY KEY    ,'my_grid' TEXT     ,'my_call' TEXT     ,'my_rig' TEXT     ,'call' TEXT     ,'first_name' TEXT     ,'last_name' TEXT     ,'street' TEXT     ,'city' TEXT     ,'county' TEXT     ,'state' TEXT     ,'postal_country' TEXT     ,'zip' TEXT     ,'grid' TEXT     ,'dxcc_country' TEXT     ,'iota' TEXT     ,'sota' TEXT     ,'cq_zone' TEXT     ,'itu' TEXT     ,'ten_ten' TEXT     ,'email' TEXT     ,'url' TEXT     ,'mode' TEXT     ,'band_rx' TEXT     ,'band_tx' TEXT     ,'rst_sent' TEXT     ,'rst_received' TEXT     ,'qsl_via' TEXT     ,'qsl_sent' TEXT     ,'qsl_received' TEXT     ,'srx' TEXT     ,'stx' TEXT     ,'comments' TEXT     ,'satellite' TEXT     ,'qso_start' REAL     ,'qso_done' REAL     ,'latitude' REAL     ,'longitude' REAL     ,'tx_frequency' REAL     ,'rx_frequency' REAL     ,'azimuth' REAL     ,'elevation' REAL     ,'power' REAL    ,'srx_numeric' INTEGER     ,'stx_numeric' INTEGER     ,'dxcc_id' INTEGER    ,'contest_id' TEXT    ,'my_sota' TEXT    ,'skcc' TEXT);

-- Table: t_ant_typ
DROP TABLE IF EXISTS t_ant_typ;
CREATE TABLE t_ant_typ (
    ant_typ_cd     INTEGER PRIMARY KEY NOT NULL,
    ant_typ_desc   TEXT
);