--
-- File generated with SQLiteStudio v3.4.4 on Sun Dec 3 19:02:45 2023
--
-- Text encoding used: UTF-8
--

-- Table: Daylite_HARC_Mem
CREATE TABLE Daylite_HARC_Mem (
    call_sign     vchar2(50),
    first_name    vchar2(50),
    middle_name   vchar2(50),
    last_name     vchar2(50),
    nick_name     vchar2(50),
    mem_street    vchar2(50),
    mem_city      vchar2(50),
    mem_state     vchar2(50),
    mem_zipcode   vchar2(50),
    mem_phone     vchar2(50),
    mem_email     vchar2(50),
    mem_lic_class vchar2(50)
);


-- Table: HARC_mem_official
CREATE TABLE HARC_mem_official (
    callsign vchar2(50),
    f_nam    vchar2(50),
    m_NAM    vchar2(50),
    l_nam    vchar2(50),
    license  vchar2(50),
    email    vchar2(50),
    status   vchar2(50)
);


-- Table: qso_table_v007
CREATE TABLE qso_table_v007 (
    pk             INTEGER PRIMARY KEY,
    my_grid        vchar2(50),
    my_call        vchar2(50),
    my_rig         vchar2(50),
    call           vchar2(50),
    first_name     vchar2(50),
    last_name      vchar2(50),
    street         vchar2(50),
    city           vchar2(50),
    county         vchar2(50),
    state          vchar2(50),
    postal_country vchar2(50),
    zip            vchar2(50),
    grid           vchar2(50),
    dxcc_country   vchar2(50),
    iota           vchar2(50),
    sota           vchar2(50),
    cq_zone        vchar2(50),
    itu            vchar2(50),
    ten_ten        vchar2(50),
    email          vchar2(50),
    url            vchar2(50),
    mode           vchar2(50),
    band_rx        vchar2(50),
    band_tx        vchar2(50),
    rst_sent       vchar2(50),
    rst_received   vchar2(50),
    qsl_via        vchar2(50),
    qsl_sent       vchar2(50),
    qsl_received   vchar2(50),
    srx            vchar2(50),
    stx            vchar2(50),
    comments       vchar2(50),
    satellite      vchar2(50),
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
    contest_id     vchar2(50),
    my_sota        vchar2(50),
    skcc           vchar2(50)
);


-- Table: qso_table_v008
CREATE TABLE qso_table_v008 (
    pk             INTEGER PRIMARY KEY,
    my_grid        vchar2(50),
    my_call        vchar2(50),
    my_rig         vchar2(50),
    call           vchar2(50),
    first_name     vchar2(50),
    last_name      vchar2(50),
    street         vchar2(50),
    city           vchar2(50),
    county         vchar2(50),
    state          vchar2(50),
    postal_country vchar2(50),
    zip            vchar2(50),
    grid           vchar2(50),
    dxcc_country   vchar2(50),
    iota           vchar2(50),
    sota           vchar2(50),
    cq_zone        vchar2(50),
    itu            vchar2(50),
    ten_ten        vchar2(50),
    email          vchar2(50),
    url            vchar2(50),
    mode           vchar2(50),
    band_rx        vchar2(50),
    band_tx        vchar2(50),
    rst_sent       vchar2(50),
    rst_received   vchar2(50),
    qsl_via        vchar2(50),
    qsl_sent       vchar2(50),
    qsl_received   vchar2(50),
    srx            vchar2(50),
    stx            vchar2(50),
    comments       vchar2(50),
    satellite      vchar2(50),
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
    contest_id     vchar2(50),
    my_sota        vchar2(50),
    skcc           vchar2(50),
    pota           vchar2(50),
    my_pota        vchar2(50),
    wwff           vchar2(50),
    my_wwff        vchar2(50),
    sig            vchar2(50),
    my_sig         vchar2(50),
    sig_info       vchar2(50),
    my_sig_info    vchar2(50),
    ext_val_1      vchar2(50),
    ext_val_2      vchar2(50),
    ext_val_3      vchar2(50),
    ext_val_4      vchar2(50),
    distance       REAL
);


-- Table: qso_table_v008_backup2
CREATE TABLE qso_table_v008_backup2 (
    pk             INT,
    my_grid        vchar2(50),
    my_call        vchar2(50),
    my_rig         vchar2(50),
    call           vchar2(50),
    first_name     vchar2(50),
    last_name      vchar2(50),
    street         vchar2(50),
    city           vchar2(50),
    county         vchar2(50),
    state          vchar2(50),
    postal_country vchar2(50),
    zip            vchar2(50),
    grid           vchar2(50),
    dxcc_country   vchar2(50),
    iota           vchar2(50),
    sota           vchar2(50),
    cq_zone        vchar2(50),
    itu            vchar2(50),
    ten_ten        vchar2(50),
    email          vchar2(50),
    url            vchar2(50),
    mode           vchar2(50),
    band_rx        vchar2(50),
    band_tx        vchar2(50),
    rst_sent       vchar2(50),
    rst_received   vchar2(50),
    qsl_via        vchar2(50),
    qsl_sent       vchar2(50),
    qsl_received   vchar2(50),
    srx            vchar2(50),
    stx            vchar2(50),
    comments       vchar2(50),
    satellite      vchar2(50),
    qso_start      REAL,
    qso_done       REAL,
    latitude       REAL,
    longitude      REAL,
    tx_frequency   REAL,
    rx_frequency   REAL,
    azimuth        REAL,
    elevation      REAL,
    power          REAL,
    srx_numeric    INT,
    stx_numeric    INT,
    dxcc_id        INT,
    contest_id     vchar2(50),
    my_sota        vchar2(50),
    skcc           vchar2(50),
    pota           vchar2(50),
    my_pota        vchar2(50),
    wwff           vchar2(50),
    my_wwff        vchar2(50),
    sig            vchar2(50),
    my_sig         vchar2(50),
    sig_info       vchar2(50),
    my_sig_info    vchar2(50),
    ext_val_1      vchar2(50),
    ext_val_2      vchar2(50),
    ext_val_3      vchar2(50),
    ext_val_4      vchar2(50),
    distance       REAL
);


-- Table: t_ant_typ
CREATE TABLE t_ant_typ (
    ant_typ_cd   INTEGER PRIMARY KEY
                         NOT NULL,
    ant_typ_desc vchar2(50)
);


-- Table: t_call_out_cutoff_days
CREATE TABLE t_call_out_cutoff_days (
    dat_est  TEXT    PRIMARY KEY,
    num_days INTEGER NOT NULL
)
WITHOUT ROWID;


-- Table: t_harc_add_qso_details
CREATE TABLE t_harc_add_qso_details (
    qso_table_v007_pk INTEGER PRIMARY KEY
                              NOT NULL,
    rptr_cd           TEXT    DEFAULT 'H2'
                              NOT NULL,
    rad_typ_cd        INTEGER DEFAULT 1
                              NOT NULL,
    pwr_typ_cd        INTEGER DEFAULT 1
                              NOT NULL,
    ant_typ_cd        INTEGER DEFAULT 1
                              NOT NULL,
    qso_comment       vchar2(50),
    FOREIGN KEY (
        qso_table_v007_pk
    )
    REFERENCES qso_table_v007 (pk),
    FOREIGN KEY (
        ant_typ_cd
    )
    REFERENCES t_ant_typ (ant_typ_cd),
    FOREIGN KEY (
        pwr_typ_cd
    )
    REFERENCES t_pwr_typ (pwr_typ_cd),
    FOREIGN KEY (
        rad_typ_cd
    )
    REFERENCES t_rad_typ (rad_typ_cd),
    FOREIGN KEY (
        rptr_cd
    )
    REFERENCES t_rptr (rptr_cd) 
);


-- Table: t_harc_member
CREATE TABLE t_harc_member (
    mem_call      TEXT PRIMARY KEY
                       NOT NULL,
    mem_f_nam     vchar2(50),
    mem_m_nam     vchar2(50),
    mem_l_nam     vchar2(50),
    mem_nicknam   vchar2(50),
    mem_lic_class
);


-- Table: t_harc_member_allstar
CREATE TABLE t_harc_member_allstar (
    mem_call         TEXT    NOT NULL
                             REFERENCES t_harc_member (mem_call),
    node_num         INTEGER NOT NULL
                             UNIQUE,
    node_ext         vchar2(50),
    node_id          vchar2(50),
    node_freq        REAL,
    node_tone        REAL,
    node_location    vchar2(50),
    node_country     vchar2(50),
    node_site_nam    vchar2(50),
    node_affiliation vchar2(50),
    node_eff_dat     vchar2(50),
    PRIMARY KEY (
        mem_call,
        node_num
    )
);


-- Table: t_pers
CREATE TABLE t_pers (
    pers_call      TEXT    NOT NULL
                           PRIMARY KEY,
    pers_f_nam     vchar2(50),
    pers_m_nam     vchar2(50),
    pers_l_nam     vchar2(50),
    pers_nicknam   vchar2(50),
    pers_lic_class vchar2(50),
    pers_typ       INTEGER,
    FOREIGN KEY (
        pers_typ
    )
    REFERENCES t_pers_typ (pers_typ_cd) 
);


-- Table: t_pers_cpy
CREATE TABLE t_pers_cpy (
    pers_call      TEXT    NOT NULL
                           PRIMARY KEY,
    pers_f_nam     vchar2(50),
    pers_m_nam     vchar2(50),
    pers_l_nam     vchar2(50),
    pers_nicknam   vchar2(50),
    pers_lic_class vchar2(50),
    pers_typ       INTEGER,
    FOREIGN KEY (
        pers_typ
    )
    REFERENCES t_pers_typ (pers_typ_cd) 
);


-- Table: t_pers_typ
CREATE TABLE t_pers_typ (
    pers_typ_cd   INT  DEFAULT 0
                       NOT NULL
                       CONSTRAINT t_pers_typ_pk PRIMARY KEY,
    pers_typ_desc TEXT NOT NULL
);


-- Table: t_pwr_typ
CREATE TABLE t_pwr_typ (
    pwr_typ_cd   INTEGER PRIMARY KEY
                         NOT NULL,
    pwr_typ_desc vchar2(50)
);


-- Table: t_rad_typ
CREATE TABLE t_rad_typ (
    rad_typ_cd   INTEGER PRIMARY KEY
                         NOT NULL,
    rad_typ_desc vchar2(50)
);


-- Table: t_rptr
CREATE TABLE t_rptr (
    rptr_cd            TEXT    PRIMARY KEY
                               NOT NULL,
    rptr_desc          vchar2(50),
    rptr_call          vchar2(50),
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
                    CASE CAST (substr(call, 2, 1) AS INTEGER) WHEN 0 THEN substr(call, 4, length(call) ) ELSE substr(call, 3, length(call) ) END AS Suffix
      FROM v_net_qso
     ORDER BY 4;


-- View: v_checkin_count
CREATE VIEW v_checkin_count AS
    SELECT date(qso_start, 'unixepoch') AS [Net Date],
           count(qso_start) AS Checkins
      FROM v_net_qso
     GROUP BY 1
     ORDER BY 1;


-- View: v_current_call_out_cutoff_days
CREATE VIEW v_current_call_out_cutoff_days AS
    SELECT num_days AS current_num_days
      FROM v_call_out_cutoff_days
     WHERE dat_est = (
                         SELECT max(dat_est) 
                           FROM v_call_out_cutoff_days
                     );


-- View: v_data_maint_required
CREATE VIEW v_data_maint_required AS
    SELECT '01 - Add new member' AS action_needed,
           call_sign AS callsign,
           first_name AS first_name,
           last_name AS last_name,
           999 AS pers_typ
      FROM daylite_harc_mem
     WHERE trim(call_sign) NOT IN (
               SELECT trim(v_pers.pers_call) 
                 FROM v_pers
           )
    UNION-- Next select all members (from daylite_harc_mem) who appear in
    /* t_pers as non-members.  Display their call, names, and pers_typ code. */SELECT '02 - Change from non-member to member' AS action_needed,
           call_sign AS callsign,
           first_name AS first_name,
           last_name AS last_name,
           t_pers.pers_typ AS per_typ
      FROM daylite_harc_mem
           JOIN
           t_pers ON call_sign = t_pers.pers_call
     WHERE pers_typ = 0
    UNION-- Next find all HARC members from t_pers who do not appear at
    /* all in Daylite_HARC_Mem. but who do appear in t_pers. */SELECT '03 - Change from member to non-member' AS action_needed,
           v_pers.pers_call AS callsign,
           v_pers.pers_f_nam AS first_name,
           v_pers.pers_l_nam AS last_name,
           v_pers.pers_typ AS pers_typ
      FROM v_pers
     WHERE pers_typ = 1 AND 
           v_pers.pers_call NOT IN (
               SELECT Daylite_HARC_Mem.call_sign
                 FROM Daylite_HARC_Mem
                WHERE Daylite_HARC_Mem.call_sign IS NOT NULL
           )
    UNION
    SELECT DISTINCT '04 - Add non-member' AS action_needed,
                    call AS callsign,
                    first_name AS first_name,
                    last_name AS last_name,
                    0 AS pers_typ
      FROM v_net_qso
     WHERE call NOT IN (
               SELECT v_pers.pers_call
                 FROM v_pers
           )
    UNION
    SELECT '05 - Possible call sign change',
           pers_call,
           pers_f_nam,
           pers_l_nam,
           1
      FROM v_pers
     WHERE pers_l_nam IN (
               SELECT a.last_name
                 FROM Daylite_HARC_Mem a
                WHERE a.call_sign NOT IN (
                          SELECT pers_call
                            FROM v_pers
                      )
           )
    UNION
    SELECT '06 - Members with Multiple Call signs',
           pers_call,
           pers_f_nam,
           pers_l_nam,
           pers_typ
      FROM v_pers
     WHERE pers_typ = 1 AND 
           pers_l_nam IN (
               SELECT pers_l_nam
                 FROM (
                          SELECT v_pers.pers_l_nam || ' ' || v_pers.pers_f_nam AS full_name,
                                 pers_f_nam,
                                 pers_l_nam,
                                 count(v_pers.pers_call) AS num_call
                            FROM v_pers
                           GROUP BY 1
                      )
                WHERE num_call > 1
           )
     ORDER BY action_needed,
              pers_l_nam;
-- They used to be members but are no longer members.-- List the pers_typ-- Find all call signs in the log file that have not been accounted for in the-- t_pers file.  This is to keep track of callsigns, suffixes, and nicknames.

-- View: v_harc_add_qso_details
CREATE VIEW v_harc_add_qso_details AS
    SELECT *
      FROM t_harc_add_qso_details;


-- View: v_harc_member
CREATE VIEW v_harc_member AS
    SELECT a.pers_call,
           a.pers_f_nam,
           a.pers_m_nam,
           a.pers_l_nam,
           a.pers_nicknam,
           a.pers_lic_class,
           pers_typ
      FROM t_pers a
     WHERE pers_typ = 1
     ORDER BY a.pers_l_nam;


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


-- View: v_harc_snn_callout_roster
CREATE VIEW v_harc_snn_callout_roster AS
    SELECT DISTINCT a.call AS Callsign,
                    CASE WHEN v_pers.pers_call IS NULL THEN a.first_name ELSE ifnull(v_pers.pers_nicknam, v_pers.pers_f_nam) END AS [First Name],
                    a.last_name AS [Last Name],
                    CASE WHEN v_pers.pers_typ = '1' THEN 'member' ELSE 'non-member' END AS Member,
                    '                                                                    ' AS Comments,
                    (
                        SELECT current_num_days
                          FROM v_current_call_out_cutoff_days
                    )
                    AS Cutoff_Days
      FROM v_net_qso a
           LEFT JOIN
           v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) )/* * Select those records that show a contest id beginning with HARC-SNN (Sunday Night Net)
* as well as those that are within the required number of days (probably 28 days).
* There may be some special cases where a call sign is always included */ 
     /* Selection Criteria 
   ------------------
   pers_typ - 0 or 1 (non-member or member, excludes duplicate callsign informatoin
   contest_id must contain 'HARC' (usually it will be HARC-SNN)
   qso_start date must be within the call_out_cutoff_days (v_current_call_out_cutoff_days)
   callsign (call) does not appear in the Silent Key List
   callsign (call) does appear in the mandatory call list */WHERE (pers_typ = 0 OR 
            pers_typ = 1) AND 
           substr(a.contest_id, 1, 4) = 'HARC' AND 
           date(a.qso_start, 'unixepoch') > (
                                                SELECT date('now', '-' || (
                                                                              SELECT current_num_days
                                                                                FROM v_current_call_out_cutoff_days
                                                                          )
||                                                          ' days') 
                                            )
AND 
           a.call NOT IN ('WB6MIE')/* Silent Key List, comma separated */ OR 
           a.call IN ('N6YFN'/* Lawrence Roney Net Control Operator */, 'K7JTC'/* Tim Collier Net Control Operator */, 'KF7JAF'/* Dave Le Blanc Net Control Operator */, 'KD7YMO'/* Gerry Grabo Net Control Operator */, 'KF4KF'/* Karol Frodsham Net Control Operator */, 'KG7XD'/* Gene McAvoy Net Control Operator */, 'N7WDZ'/* Gene Heiter New Call Sign. */, 'K7ZEX'/* Tony Fetcho Net Control Operator */)-- insert comma-separated call signs that will always appear in call-out list 
     ORDER BY 4,
              3,
              2;


-- View: v_harc_snn_callout_roster_random
CREATE VIEW v_harc_snn_callout_roster_random AS
    SELECT callsign,
           "first name",
           "last name",
           member,
           comments,
           Cutoff_Days
      FROM (
               SELECT random(),
                      callsign,
                      "first name",
                      "last name",
                      member,
                      comments,
                      Cutoff_Days
                 FROM (
                          SELECT *
                            FROM v_harc_snn_callout_roster
                      )
                ORDER BY 5,
                         1
           );


-- View: v_harc_snn_callout_roster_reverse
CREATE VIEW v_harc_snn_callout_roster_reverse AS
    SELECT callsign,
           "first name",
           "last name",
           member,
           comments,
           Cutoff_Days
      FROM (
               SELECT callsign,
                      "first name",
                      "last name",
                      member,
                      comments,
                      Cutoff_Days
                 FROM (
                          SELECT *
                            FROM v_harc_snn_callout_roster
                      )
                ORDER BY 5,
                         "last name" DESC,
                         "first name" DESC
           );


-- View: v_harc_snn_callout_roster_suffix
CREATE VIEW v_harc_snn_callout_roster_suffix AS
    SELECT callsign/* ,suffix */,
           "first name",
           "last name",
           member,
           comments,
           Cutoff_Days
      FROM (
               SELECT callsign,
                      CASE CAST (substr(callsign, 2, 1) AS INTEGER) WHEN 0 THEN substr(callsign, 4, length(callsign) ) ELSE substr(callsign, 3, length(callsign) ) END AS Suffix,
                      "first name",
                      "last name",
                      member,
                      comments,
                      Cutoff_Days
                 FROM (
                          SELECT *
                            FROM v_harc_snn_callout_roster
                      )
                ORDER BY 5,
                         2
           );


-- View: v_member_qso
CREATE VIEW v_member_qso AS
    SELECT v_harc_member.pers_call,
           v_harc_member.pers_f_nam,
           v_harc_member.pers_m_nam,
           v_harc_member.pers_l_nam,
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
           v_qso_table_v007 ON v_harc_member.pers_call = v_qso_table_v007.call
           INNER JOIN
           v_harc_add_qso_details ON v_qso_table_v007.pk = v_harc_add_qso_details.qso_table_v007_pk
           INNER JOIN
           v_reptr ON v_harc_add_qso_details.rptr_cd = v_reptr.rptr_cd;


-- View: v_net_qso.sql
CREATE VIEW v_net_qso AS
    SELECT pk/* Primary Key from MacLoggerDX table */,
           call/* Call sign */,
           contest_id/* String denoting a context (MacLoggerDX term). */,
           first_name,
           last_name,
           qso_start
      FROM v_qso_table_v008;
-- The software looks for 'HARC-SNN' to see if user-- checked in the the HARC SNN-- First Name-- Last Name-- QSO Date and Time in UnixEpoch format-- to convert unixepoch time to julian, use the following:-- (qso_start/86400)+2440587.5

-- View: v_pers
CREATE VIEW v_pers AS
    SELECT *
      FROM t_pers;


-- View: v_potential_call_roster_size
CREATE VIEW v_potential_call_roster_size AS/* ----------------------------------------------------------------------------
    Query:  q_potential_call_roster_size
    ------------------------------------
    
    Author:    Tim Collier
    Date:      April 3, 2023
    
    Purpose:  Show what the call roster would be given various cutoff dates
---------------------------------------------------------------------------- */
    SELECT 7 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 7 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 14 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 14 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 21 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 21 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 28 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 28 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 35 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 35 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 42 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 42 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 49 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 49 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 56 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 56 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 63 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 63 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 70 AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC' AND 
                      date(qso_start, 'unixepoch') > (
                                                         SELECT date('now', '-' || 70 || ' days') 
                                                     )
                ORDER BY 1
           )
    UNION
    SELECT 'All Time' AS Days_since_last_checkin,
           count(call) AS Potential_number_of_callouts
      FROM (
               SELECT DISTINCT call
                 FROM v_net_qso a
                      LEFT JOIN
                      v_pers ON trim(upper(a.Call) ) = trim(upper(v_pers.pers_call) ) 
                WHERE (pers_typ = 0 OR 
                       pers_typ = 1) AND 
                      substr(a.contest_id, 1, 4) = 'HARC'-- and date(qso_start) > (select date('now','-' || 70 || ' days'))
                ORDER BY 1
           );


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
           CASE WHEN (v_pers.pers_typ = 1) THEN 'member' ELSE 'non-member' END AS HARC_member,
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
           datetime( ( ( (v_qso_table_v007.qso_start) / 86400) + 2440587.5) ) AS julian_qso_start,
           datetime( ( (v_qso_table_v007.qso_done) / 86400) + 2440587.5) AS julian_qso_done,
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
           v_pers ON trim(upper(call) ) = trim(upper(pers_call) );
-- -- ([UNIXepoch Date]/86400) + 2440587.5-- 

-- View: v_qso_table_v007
CREATE VIEW v_qso_table_v007 AS
    SELECT *
      FROM qso_table_v007;


-- View: v_qso_table_v008
CREATE VIEW v_qso_table_v008 AS
    SELECT *
      FROM qso_table_v008;


-- View: v_rad_typ
CREATE VIEW v_rad_typ AS
    SELECT *
      FROM t_rad_typ;


-- View: v_reptr
CREATE VIEW v_reptr AS
    SELECT *
      FROM t_rptr;


-- View: v_snn_latest_net_checkin_count
CREATE VIEW v_snn_latest_net_checkin_count AS
    SELECT count(qso_start) AS Checkins,
           date(qso_start, 'unixepoch') AS Net_Date
      FROM v_qso_table_v008
     WHERE date(qso_start, 'unixepoch') IN (
               SELECT date( (
                                SELECT max(qso_start) 
                                  FROM v_qso_table_v008
                            ), 'unixepoch') AS Latest_Net_Date
           );


