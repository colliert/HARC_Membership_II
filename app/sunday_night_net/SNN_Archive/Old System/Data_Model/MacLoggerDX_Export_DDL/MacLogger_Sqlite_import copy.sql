

-- Table: JTC_Temp_Table
CREATE TABLE JTC_Temp_Table
(
    Callsign   CHAR NOT NULL,
    First_Name CHAR NOT NULL,
    Last_Name  CHAR,
    qso_date   CHAR
);


-- Table: qso_table_v007
CREATE TABLE qso_table_v007
(
    pk             INTEGER PRIMARY KEY,
    my_grid        CHAR,
    my_call        CHAR,
    my_rig         CHAR,
    call           CHAR,
    first_name     CHAR,
    last_name      CHAR,
    street         CHAR,
    city           CHAR,
    county         CHAR,
    state          CHAR,
    postal_country CHAR,
    zip            CHAR,
    grid           CHAR,
    dxcc_country   CHAR,
    iota           CHAR,
    sota           CHAR,
    cq_zone        CHAR,
    itu            CHAR,
    ten_ten        CHAR,
    email          CHAR,
    url            CHAR,
    mode           CHAR,
    band_rx        CHAR,
    band_tx        CHAR,
    rst_sent       CHAR,
    rst_received   CHAR,
    qsl_via        CHAR,
    qsl_sent       CHAR,
    qsl_received   CHAR,
    srx            CHAR,
    stx            CHAR,
    comments       CHAR,
    satellite      CHAR,
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
    contest_id     CHAR,
    my_sota        CHAR,
    skcc           CHAR
);


-- Table: t_ant_typ
CREATE TABLE t_ant_typ
(
    ant_typ_cd   INTEGER PRIMARY KEY
                         NOT NULL,
    ant_typ_desc CHAR
);


-- Table: t_call_out_cutoff_days
CREATE TABLE t_call_out_cutoff_days
(
    dat_est  CHAR    PRIMARY KEY,
    num_days INTEGER NOT NULL
)WITHOUT ROWID;


-- Table: t_harc_add_qso_details
CREATE TABLE t_harc_add_qso_details
(
    qso_table_v007_pk INTEGER PRIMARY KEY
                              NOT NULL,
    rptr_cd           CHAR    DEFAULT 'H2'
                              NOT NULL,
    rad_typ_cd        INTEGER DEFAULT 1
                              NOT NULL,
    pwr_typ_cd        INTEGER DEFAULT 1
                              NOT NULL,
    ant_typ_cd        INTEGER DEFAULT 1
                              NOT NULL,
    qso_comment       CHAR,
    FOREIGN KEY
    (
        qso_table_v007_pk
    )REFERENCES qso_table_v007(pk),
    FOREIGN KEY
    (
        ant_typ_cd
    )REFERENCES t_ant_typ(ant_typ_cd),
    FOREIGN KEY
    (
        pwr_typ_cd
    )REFERENCES t_pwr_typ(pwr_typ_cd),
    FOREIGN KEY
    (
        rad_typ_cd
    )REFERENCES t_rad_typ(rad_typ_cd),
    FOREIGN KEY
    (
        rptr_cd
    )REFERENCES t_rptr(rptr_cd)
);


-- Table: t_harc_member
CREATE TABLE t_harc_member
(
    mem_call      CHAR PRIMARY KEY
                       NOT NULL,
    mem_f_nam     CHAR,
    mem_m_nam     CHAR,
    mem_l_nam     CHAR,
    mem_nicknam   CHAR,
    mem_lic_class
);


-- Table: t_harc_member_allstar
CREATE TABLE t_harc_member_allstar
(
    mem_call         CHAR    NOT NULL
                             REFERENCES t_harc_member(mem_call),
    node_num         INTEGER NOT NULL
                             UNIQUE,
    node_ext         CHAR,
    node_id          CHAR,
    node_freq        REAL,
    node_tone        REAL,
    node_location    CHAR,
    node_country     CHAR,
    node_site_nam    CHAR,
    node_affiliation CHAR,
    node_eff_dat     CHAR,
    PRIMARY KEY
    (
        mem_call,
        node_num
    )
);


-- Table: t_harc_member_tmp
CREATE TABLE t_harc_member_tmp
(
    mem_call      CHAR PRIMARY KEY
                       NOT NULL,
    mem_f_nam     CHAR,
    mem_m_nam     CHAR,
    mem_l_nam     CHAR,
    mem_nicknam   CHAR,
    mem_lic_class
);


-- Table: t_pwr_typ
CREATE TABLE t_pwr_typ
(
    pwr_typ_cd   INTEGER PRIMARY KEY
                         NOT NULL,
    pwr_typ_desc CHAR
);


-- Table: t_rad_typ
CREATE TABLE t_rad_typ
(
    rad_typ_cd   INTEGER PRIMARY KEY
                         NOT NULL,
    rad_typ_desc CHAR
);


-- Table: t_rptr
CREATE TABLE t_rptr
(
    rptr_cd            CHAR    PRIMARY KEY
                               NOT NULL,
    rptr_desc          CHAR,
    rptr_call          CHAR,
    rptr_tx_freq       REAL,
    rptr_rx_freq       REAL,
    rptr_ctcss         REAL,
    rptr__lat          REAL,
    rptr_long          REAL,
    rptr_allstar_node  INTEGER,
    rptr_echolink_node INTEGER
);


-- View: v_ant_typ
CREATE VIEW v_ant_typ AS
    SELECT *
      FROM t_ant_typ;


-- View: v_call_out_cutoff_days
CREATE VIEW v_call_out_cutoff_days AS
    SELECT *
      FROM t_call_out_cutoff_days;


-- View: v_callsign_suffix
CREATE VIEW v_callsign_suffix AS
    SELECT DISTINCT call AS Call,
                    first_name AS First_Name,
                    last_name AS Last_Name,
                    CASE CAST(substr(call, 2, 1)AS INTEGER)WHEN 0 THEN substr(call, 4, length(call))ELSE substr(call, 3, length(call))END AS Suffix
      FROM v_qso_table_v007
     ORDER BY 4;


-- View: v_checkin_count
CREATE VIEW v_checkin_count AS
    SELECT date(qso_start, 'unixepoch')AS [Net Date],
           count(qso_start)AS Checkins
      FROM v_qso_table_v007
     GROUP BY 1
     ORDER BY 1;


-- View: v_current_call_out_cutoff_days
CREATE VIEW v_current_call_out_cutoff_days AS
    SELECT num_days AS current_num_days
      FROM v_call_out_cutoff_days
     WHERE dat_est = 
                     (
                         SELECT max(dat_est)
                           FROM v_call_out_cutoff_days
                     );


-- View: v_harc_add_qso_details
CREATE VIEW v_harc_add_qso_details AS
    SELECT *
      FROM t_harc_add_qso_details;


-- View: v_harc_member
CREATE VIEW v_harc_member AS
    SELECT *
      FROM t_harc_member;


-- View: v_harc_member_allstar
CREATE VIEW v_harc_member_allstar AS
    SELECT t_harc_member_allstar.mem_call,
           t_harc_member_allstar.node_num,
           t_harc_member_allstar.node_ext,
           t_harc_member_allstar.node_id,
           t_harc_member_allstar.node_freq,
           t_harc_member_allstar.node_tone,
           t_harc_member_allstar.node_location,
           t_harc_member_allstar.node_country,
           t_harc_member_allstar.node_site_nam,
           t_harc_member_allstar.node_affiliation,
           t_harc_member_allstar.node_eff_dat
      FROM t_harc_member_allstar;


-- View: v_harc_member_allstar_listing
CREATE VIEW v_harc_member_allstar_listing AS
    SELECT v_harc_member.mem_call,
           v_harc_member.mem_f_nam,
           v_harc_member.mem_m_nam,
           v_harc_member.mem_l_nam,
           v_harc_member_allstar.node_num,
           v_harc_member_allstar.node_id,
           v_harc_member_allstar.node_freq,
           v_harc_member_allstar.node_tone,
           v_harc_member_allstar.node_location,
           v_harc_member_allstar.node_country,
           v_harc_member_allstar.node_site_nam,
           v_harc_member_allstar.node_affiliation,
           v_harc_member_allstar.node_eff_dat
      FROM v_harc_member_allstar
           JOIN
           v_harc_member ON v_harc_member.mem_call = v_harc_member_allstar.mem_call
     ORDER BY v_harc_member.mem_call;


-- View: v_harc_snn_callout_roster
CREATE VIEW v_harc_snn_callout_roster AS
    SELECT DISTINCT v_qso_table_v007.call AS Callsign,
                    CASE WHEN mem_call IS NULL THEN v_qso_table_v007.first_name ELSE ifnull(mem_nicknam, mem_f_nam)END AS [First Name],
                    last_name AS [Last Name],
                    CASE WHEN ifnull(v_harc_member.mem_call, '0') = '0' THEN 'non-member' ELSE 'member' END AS Member,
                    '                                                                    ' AS Comments
      FROM v_qso_table_v007
           LEFT JOIN
           v_harc_member ON trim(upper(Call)) = trim(upper(v_harc_member.mem_call))/* * Select those records that show a contest id beginning with HARC-SNN (Sunday Night Net)
* as well as those that are within the required number of days (probably 28 days).
* There may be some special cases where a call sign is always included */
     WHERE substr(contest_id, 1, 4) = 'HARC' AND 
           date(qso_start, 'unixepoch') > 
                                          (
                                              SELECT date('now', '-' || 
                                                                        (
                                                                            SELECT current_num_days
                                                                              FROM v_current_call_out_cutoff_days
                                                                        ) || ' days')
                                          ) OR 
           call IN('KI7EWQ'/* Gage Calihan (monitoring) re Earl WB6AMT */, 'KI6CCW'/* Thomas Turner Net Control */, 'WB6AMT'/* Earl Lizardi Net Control */, 'N6YFN'/* Lawrence Roney Net Control */, 'K7JTC'/* Tim Collier Net Control */, 'WJ3EP'/* Jay Frumpkin Net Control */, 'KM7MLH'/* Mike Hargett Net Control */)-- insert comma-separated call signs that will always appear in call-out list
     ORDER BY 4,
              3,
              2;


-- View: v_harc_snn_callout_roster_random
CREATE VIEW v_harc_snn_callout_roster_random AS
    SELECT callsign,
           "first name",
           "last name",
           member,
           comments
      FROM
           (
               SELECT random(),
                      callsign,
                      "first name",
                      "last name",
                      member,
                      comments
                 FROM
                      (
                          SELECT *
                            FROM v_harc_snn_callout_roster
                      )
                ORDER BY 5,
                         1
           );


-- View: v_member_qso
CREATE VIEW v_member_qso AS
    SELECT v_harc_member.mem_call,
           v_harc_member.mem_f_nam,
           v_harc_member.mem_m_nam,
           v_harc_member.mem_l_nam,
           v_qso_table_v007.band_rx,
           v_qso_table_v007.rx_frequency,
           v_qso_table_v007.tx_frequency,
           v_qso_table_v007.latitude,
           v_qso_table_v007.longitude,
           v_qso_table_v007.contest_id,
           v_qso_table_v007.qso_start,
           v_reptr.rptr_desc
      FROM v_harc_member
           INNER JOIN
           v_qso_table_v007 ON v_harc_member.mem_call = v_qso_table_v007.call
           INNER JOIN
           v_harc_add_qso_details ON v_qso_table_v007.pk = v_harc_add_qso_details.qso_table_v007_pk
           INNER JOIN
           v_reptr ON v_harc_add_qso_details.rptr_cd = v_reptr.rptr_cd;


-- View: v_pwr_typ
CREATE VIEW v_pwr_typ AS
    SELECT *
      FROM t_pwr_typ;


-- View: v_qso_table_expanded
CREATE VIEW v_qso_table_expanded AS
    SELECT v_qso_table_v007.pk,
           v_qso_table_v007.my_grid,
           v_qso_table_v007.my_call,
           v_qso_table_v007.my_rig,
           v_qso_table_v007.call,
           v_qso_table_v007.first_name,
           v_qso_table_v007.last_name,
           CASE WHEN ifnull(v_harc_member.mem_call, '0') = '0' THEN 'non-member' ELSE 'member' END AS HARC_member,
           v_qso_table_v007.street,
           v_qso_table_v007.city,
           v_qso_table_v007.county,
           v_qso_table_v007.state,
           v_qso_table_v007.postal_country,
           v_qso_table_v007.zip,
           v_qso_table_v007.grid,
           v_qso_table_v007.dxcc_country,
           v_qso_table_v007.email,
           v_qso_table_v007.mode,
           v_qso_table_v007.band_rx,
           v_qso_table_v007.band_tx/*  */,
           datetime( ( ( (v_qso_table_v007.qso_start) / 86400) + 2440587.5))AS julian_qso_start,
           datetime( ( (v_qso_table_v007.qso_done) / 86400) + 2440587.5)AS julian_qso_done,
           v_qso_table_v007.latitude,
           v_qso_table_v007.longitude,
           v_qso_table_v007.tx_frequency,
           v_qso_table_v007.rx_frequency,
           v_qso_table_v007.azimuth,
           v_qso_table_v007.elevation,
           v_qso_table_v007.power,
           v_qso_table_v007.dxcc_id,
           v_qso_table_v007.contest_id,
           v_harc_add_qso_details.qso_table_v007_pk,
           v_harc_add_qso_details.rptr_cd,
           v_harc_add_qso_details.rad_typ_cd,
           v_harc_add_qso_details.pwr_typ_cd,
           v_harc_add_qso_details.ant_typ_cd,
           v_reptr.rptr_desc,
           v_rad_typ.rad_typ_desc,
           v_pwr_typ.pwr_typ_desc,
           v_ant_typ.ant_typ_desc,
           v_harc_add_qso_details.qso_comment
      FROM v_qso_table_v007
           INNER JOIN
           v_harc_add_qso_details ON v_qso_table_v007.pk = v_harc_add_qso_details.qso_table_v007_pk
           INNER JOIN
           v_reptr ON v_harc_add_qso_details.rptr_cd = v_reptr.rptr_cd
           INNER JOIN
           v_rad_typ ON v_harc_add_qso_details.rad_typ_cd = v_rad_typ.rad_typ_cd
           INNER JOIN
           v_pwr_typ ON v_harc_add_qso_details.pwr_typ_cd = v_pwr_typ.pwr_typ_cd
           INNER JOIN
           v_ant_typ ON v_harc_add_qso_details.ant_typ_cd = v_ant_typ.ant_typ_cd
           LEFT JOIN
           v_harc_member ON trim(upper(call)) = trim(upper(mem_call));-- -- ([UNIXepoch Date]/86400) + 2440587.5--


-- View: v_qso_table_v007
CREATE VIEW v_qso_table_v007 AS
    SELECT *
      FROM qso_table_v007;


-- View: v_rad_typ
CREATE VIEW v_rad_typ AS
    SELECT *
      FROM t_rad_typ;


-- View: v_reptr
CREATE VIEW v_reptr AS
    SELECT *
      FROM t_rptr;


COMMIT TRANSACTION;

