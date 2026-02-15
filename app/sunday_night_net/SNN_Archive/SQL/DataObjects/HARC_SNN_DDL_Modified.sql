--
-- File generated with SQLiteStudio v3.4.4 on Sat Dec 9 17:25:08 2023
--
-- Text encoding used: UTF-8
--


-- Table: Daylite_HARC_Mem
CREATE TABLE Daylite_HARC_Mem
(
    call_sign   TEXT,
    first_name  TEXT,
    middle_name TEXT,
    last_name   TEXT,
    nick_name   TEXT,
    mem_street  TEXT,
    mem_city    TEXT,
    mem_state   TEXT,
    mem_zipcode TEXT,
    mem_phone   TEXT,
    mem_email   TEXT,
    mem_lic_class TEXT
);

-- Table: HARC_mem_official
CREATE TABLE HARC_mem_official
(
	callsign TEXT,
	f_nam TEXT,
	m_NAM TEXT,
	l_nam TEXT,
	license TEXT,
	email TEXT,
	status TEXT
);

-- Table: qso_table_v007
CREATE TABLE qso_table_v007 ('pk' INTEGER PRIMARY KEY    ,'my_grid' TEXT     ,'my_call' TEXT     ,'my_rig' TEXT     ,'call' TEXT     ,'first_name' TEXT     ,'last_name' TEXT     ,'street' TEXT     ,'city' TEXT     ,'county' TEXT     ,'state' TEXT     ,'postal_country' TEXT     ,'zip' TEXT     ,'grid' TEXT     ,'dxcc_country' TEXT     ,'iota' TEXT     ,'sota' TEXT     ,'cq_zone' TEXT     ,'itu' TEXT     ,'ten_ten' TEXT     ,'email' TEXT     ,'url' TEXT     ,'mode' TEXT     ,'band_rx' TEXT     ,'band_tx' TEXT     ,'rst_sent' TEXT     ,'rst_received' TEXT     ,'qsl_via' TEXT     ,'qsl_sent' TEXT     ,'qsl_received' TEXT     ,'srx' TEXT     ,'stx' TEXT     ,'comments' TEXT     ,'satellite' TEXT     ,'qso_start' REAL     ,'qso_done' REAL     ,'latitude' REAL     ,'longitude' REAL     ,'tx_frequency' REAL     ,'rx_frequency' REAL     ,'azimuth' REAL     ,'elevation' REAL     ,'power' REAL    ,'srx_numeric' INTEGER     ,'stx_numeric' INTEGER     ,'dxcc_id' INTEGER    ,'contest_id' TEXT    ,'my_sota' TEXT    ,'skcc' TEXT);

-- Table: qso_table_v008
CREATE TABLE qso_table_v008 ('pk' INTEGER PRIMARY KEY    ,'my_grid' TEXT     ,'my_call' TEXT     ,'my_rig' TEXT     ,'call' TEXT     ,'first_name' TEXT     ,'last_name' TEXT     ,'street' TEXT     ,'city' TEXT     ,'county' TEXT     ,'state' TEXT     ,'postal_country' TEXT     ,'zip' TEXT     ,'grid' TEXT     ,'dxcc_country' TEXT     ,'iota' TEXT     ,'sota' TEXT     ,'cq_zone' TEXT     ,'itu' TEXT     ,'ten_ten' TEXT     ,'email' TEXT     ,'url' TEXT     ,'mode' TEXT     ,'band_rx' TEXT     ,'band_tx' TEXT     ,'rst_sent' TEXT     ,'rst_received' TEXT     ,'qsl_via' TEXT     ,'qsl_sent' TEXT     ,'qsl_received' TEXT     ,'srx' TEXT     ,'stx' TEXT     ,'comments' TEXT     ,'satellite' TEXT     ,'qso_start' REAL     ,'qso_done' REAL     ,'latitude' REAL     ,'longitude' REAL     ,'tx_frequency' REAL     ,'rx_frequency' REAL     ,'azimuth' REAL     ,'elevation' REAL     ,'power' REAL    ,'srx_numeric' INTEGER     ,'stx_numeric' INTEGER     ,'dxcc_id' INTEGER     ,'contest_id' TEXT     ,'my_sota' TEXT     ,'skcc' TEXT     ,'pota' TEXT     ,'my_pota' TEXT     ,'wwff' TEXT     ,'my_wwff' TEXT     ,'sig' TEXT     ,'my_sig' TEXT     ,'sig_info' TEXT     ,'my_sig_info' TEXT     ,'ext_val_1' TEXT     ,'ext_val_2' TEXT     ,'ext_val_3' TEXT     ,'ext_val_4' TEXT     ,'distance' REAL );

-- Table: qso_table_v008_backup2
CREATE TABLE qso_table_v008_backup2(
  pk INT,
  my_grid TEXT,
  my_call TEXT,
  my_rig TEXT,
  call TEXT,
  first_name TEXT,
  last_name TEXT,
  street TEXT,
  city TEXT,
  county TEXT,
  state TEXT,
  postal_country TEXT,
  zip TEXT,
  grid TEXT,
  dxcc_country TEXT,
  iota TEXT,
  sota TEXT,
  cq_zone TEXT,
  itu TEXT,
  ten_ten TEXT,
  email TEXT,
  url TEXT,
  mode TEXT,
  band_rx TEXT,
  band_tx TEXT,
  rst_sent TEXT,
  rst_received TEXT,
  qsl_via TEXT,
  qsl_sent TEXT,
  qsl_received TEXT,
  srx TEXT,
  stx TEXT,
  comments TEXT,
  satellite TEXT,
  qso_start REAL,
  qso_done REAL,
  latitude REAL,
  longitude REAL,
  tx_frequency REAL,
  rx_frequency REAL,
  azimuth REAL,
  elevation REAL,
  power REAL,
  srx_numeric INT,
  stx_numeric INT,
  dxcc_id INT,
  contest_id TEXT,
  my_sota TEXT,
  skcc TEXT,
  pota TEXT,
  my_pota TEXT,
  wwff TEXT,
  my_wwff TEXT,
  sig TEXT,
  my_sig TEXT,
  sig_info TEXT,
  my_sig_info TEXT,
  ext_val_1 TEXT,
  ext_val_2 TEXT,
  ext_val_3 TEXT,
  ext_val_4 TEXT,
  distance REAL
);

-- Table: t_ant_typ
CREATE TABLE t_ant_typ (
    ant_typ_cd     INTEGER PRIMARY KEY NOT NULL,
    ant_typ_desc   TEXT
);

-- Table: t_call_out_cutoff_days
CREATE TABLE t_call_out_cutoff_days (dat_est TEXT PRIMARY KEY, num_days INTEGER NOT NULL) WITHOUT ROWID;

-- Table: t_harc_add_qso_details
CREATE TABLE t_harc_add_qso_details (
    qso_table_v007_pk  		INTEGER     PRIMARY KEY NOT NULL,
    rptr_cd                 TEXT    DEFAULT 'H2'    NOT NULL,
    rad_typ_cd              INTEGER DEFAULT 1 NOT NULL,
    pwr_typ_cd              INTEGER DEFAULT 1 NOT NULL,
    ant_typ_cd              INTEGER DEFAULT 1 NOT NULL,
    qso_comment				TEXT,
	FOREIGN KEY ( qso_table_v007_pk )
        REFERENCES qso_table_v007 ( pk ),
	FOREIGN KEY ( ant_typ_cd )
        REFERENCES t_ant_typ ( ant_typ_cd ),
	FOREIGN KEY ( pwr_typ_cd )
        REFERENCES t_pwr_typ ( pwr_typ_cd ),
	FOREIGN KEY ( rad_typ_cd )
        REFERENCES t_rad_typ ( rad_typ_cd ),
	FOREIGN KEY ( rptr_cd )
        REFERENCES t_rptr ( rptr_cd )
);

-- Table: t_harc_member
CREATE TABLE t_harc_member (mem_call TEXT PRIMARY KEY NOT NULL, mem_f_nam TEXT, mem_m_nam TEXT, mem_l_nam TEXT, mem_nicknam TEXT, mem_lic_class);

-- Table: t_harc_member_allstar
CREATE TABLE t_harc_member_allstar (
    mem_call        TEXT    NOT NULL REFERENCES t_harc_member (mem_call)
  ,node_num         INTEGER NOT NULL UNIQUE
  ,node_ext         TEXT
  ,node_id          TEXT
  ,node_freq        REAL
  ,node_tone        REAL
  ,node_location    TEXT
  ,node_country     TEXT
  ,node_site_nam    TEXT
  ,node_affiliation TEXT
  ,node_eff_dat     TEXT
  ,PRIMARY KEY (mem_call,node_num)
);

-- Table: t_net_qso
CREATE TABLE t_net_qso(
  pk INT,
  call TEXT,
  contest_id TEXT,
  first_name TEXT,
  last_name TEXT,
  qso_start
);

-- Table: t_pers
CREATE TABLE t_pers
(
    pers_call    TEXT NOT NULL PRIMARY KEY,
    pers_f_nam   TEXT,
    pers_m_nam   TEXT,
    pers_l_nam   TEXT,
    pers_nicknam TEXT,
    pers_lic_class TEXT,
    pers_typ  integer,
        Foreign Key (pers_typ) References t_pers_typ(pers_typ_cd)

);

-- Table: t_pers_cpy
CREATE TABLE t_pers_cpy 
(
    pers_call      TEXT    NOT NULL
                           PRIMARY KEY,
    pers_f_nam     TEXT,
    pers_m_nam     TEXT,
    pers_l_nam     TEXT,
    pers_nicknam   TEXT,
    pers_lic_class TEXT,
    pers_typ       INTEGER,
    FOREIGN KEY
    (
        pers_typ
    )REFERENCES t_pers_typ(pers_typ_cd)
);

-- Table: t_pers_typ
CREATE TABLE t_pers_typ
(
	pers_typ_cd int default 0 not null
		constraint t_pers_typ_pk
			primary key,
	pers_typ_desc text not null
);

-- Table: t_pwr_typ
CREATE TABLE t_pwr_typ (
    pwr_typ_cd     INTEGER PRIMARY KEY NOT NULL,
    pwr_typ_desc   TEXT
);

-- Table: t_rad_typ
CREATE TABLE t_rad_typ (
    rad_typ_cd     INTEGER PRIMARY KEY NOT NULL,
    rad_typ_desc   TEXT
);

-- Table: t_rptr
CREATE TABLE t_rptr (
    rptr_cd              TEXT PRIMARY KEY NOT NULL,
    rptr_desc            TEXT,
    rptr_call            TEXT,
    rptr_tx_freq         REAL,
    rptr_rx_freq         REAL,
    rptr_ctcss           REAL,
    rptr__lat            REAL,
    rptr_long            REAL,
    rptr_allstar_node    INTEGER,
    rptr_echolink_node   INTEGER
);

-- View: v_ant_typ
CREATE VIEW v_ant_typ  AS
	select *
	from t_ant_typ;

-- View: v_call_out_cutoff_days
CREATE VIEW v_call_out_cutoff_days AS select *
from t_call_out_cutoff_days;

-- View: v_callsign_suffix
CREATE VIEW v_callsign_suffix AS select distinct call as "Call"
    ,first_name as "First_Name"
    ,last_name as "Last_Name"
    ,case cast(substr(call,2,1) as integer)
        when 0 then substr(call,4,length(call))
        else substr(call,3,length(call))
    end as "Suffix"
from v_net_qso
order by 4;

-- View: v_checkin_count
CREATE VIEW v_checkin_count AS
select date(qso_start) as "Net Date"
     , count(date(qso_start))             as "Checkins"
from v_net_qso
group by 1
order by 1;

-- View: v_current_call_out_cutoff_days
CREATE VIEW v_current_call_out_cutoff_days AS SELECT num_days as current_num_days
  FROM v_call_out_cutoff_days
 WHERE dat_est = (
                     SELECT max(dat_est) 
                       FROM v_call_out_cutoff_days
                 );

-- View: v_data_maint_required
CREATE VIEW v_data_maint_required AS select '01 - Add new member' as action_needed
     , call_sign             as callsign
     , first_name            as first_name
     , last_name             as last_name
     , 999                   as pers_typ
from daylite_harc_mem
where trim(call_sign) not in (select trim(v_pers.pers_call) from v_pers)
union
-- Next select all members (from daylite_harc_mem) who appear in
-- t_pers as non-members.  Display their call, names, and pers_typ code.
select '02 - Change from non-member to member' as action_needed
     , call_sign                               as callsign
     , first_name                              as first_name
     , last_name                               as last_name
     , t_pers.pers_typ                         as per_typ
from daylite_harc_mem
         join t_pers on call_sign = t_pers.pers_call
where pers_typ = 0
union
-- Next find all HARC members from t_pers who do not appear at
-- all in Daylite_HARC_Mem. but who do appear in t_pers.
-- They used to be members but are no longer members.
-- List the pers_typ
select '03 - Change from member to non-member' as action_needed
     , v_pers.pers_call                        as callsign
     , v_pers.pers_f_nam                       as first_name
     , v_pers.pers_l_nam                       as last_name
     , v_pers.pers_typ                         as pers_typ
from v_pers
where pers_typ = 1
  and v_pers.pers_call not in
      (select Daylite_HARC_Mem.call_sign from Daylite_HARC_Mem where Daylite_HARC_Mem.call_sign is not null)
Union
-- Find all call signs in the log file that have not been accounted for in the
-- t_pers file.  This is to keep track of callsigns, suffixes, and nicknames.
select distinct '04 - Add non-member' as action_needed
              , call                  as callsign
              , first_name            as first_name
              , last_name             as last_name
              , 0                     as pers_typ
from v_net_qso
where call not in (select v_pers.pers_call from v_pers)
Union
select '05 - Possible call sign change'
    ,pers_call
    ,pers_f_nam
    ,pers_l_nam
    ,1
from v_pers
where pers_l_nam in
      (select a.last_name
       from Daylite_HARC_Mem a
       where a.call_sign not in
             (select pers_call from v_pers))
Union
select '06 - Members with Multiple Call signs'
     , pers_call
     , pers_f_nam
     , pers_l_nam
     , pers_typ
from v_pers
where pers_typ = 1
  and pers_l_nam in
      (select pers_l_nam
       from (select v_pers.pers_l_nam || ' ' || v_pers.pers_f_nam as 'full_name'
                  , pers_f_nam
                  , pers_l_nam
                  , count(v_pers.pers_call)                       as num_call
             from v_pers
             group by 1)
       where num_call > 1)
order by action_needed
        ,pers_l_nam;

-- View: v_harc_add_qso_details
CREATE VIEW v_harc_add_qso_details  AS
	select *
	from t_harc_add_qso_details;

-- View: v_harc_member
CREATE VIEW v_harc_member as
select a.pers_call
     , a.pers_f_nam
     , a.pers_m_nam
     , a.pers_l_nam
     , a.pers_nicknam
     , a.pers_lic_class
     , pers_typ
from t_pers a
where pers_typ = 1
order by a.pers_l_nam;

-- View: v_harc_member_allstar
CREATE VIEW v_harc_member_allstar AS select 
t_harc_member_allstar.mem_call
,t_harc_member_allstar.node_num
,t_harc_member_allstar.node_ext
,t_harc_member_allstar.node_id
,t_harc_member_allstar.node_freq
,t_harc_member_allstar.node_tone
,t_harc_member_allstar.node_location
,t_harc_member_allstar.node_country
,t_harc_member_allstar.node_site_nam
,t_harc_member_allstar.node_affiliation
,t_harc_member_allstar.node_eff_dat
 from t_harc_member_allstar;

-- View: v_harc_snn_callout_roster
CREATE VIEW v_harc_snn_callout_roster AS
select distinct a.call                                                                     as 'Callsign'
              , CASE
                    when v_pers.pers_call is NULL then
                        a.first_name
                    else
                        ifnull(v_pers.pers_nicknam, v_pers.pers_f_nam)
               END                                                                         as 'First Name'
              , a.last_name                                                                as 'Last Name'
              , CASE
                    when v_pers.pers_typ = '1' then
                        'member'
                    else
                        'non-member'
               END                                                                         as 'Member'
              , '                                                                    '     as 'Comments'
              , (select current_num_days from v_current_call_out_cutoff_days)              as 'Cutoff_Days'


from v_net_qso a
         LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
/*
* Select those records that show a contest id beginning with HARC-SNN (Sunday Night Net)
* as well as those that are within the required number of days (probably 28 days).
* There may be some special cases where a call sign is always included
*/
where substr(a.contest_id, 1, 4) = 'HARC' and
      date(a.qso_start) >
      (select date('now', '-' || (select current_num_days from v_current_call_out_cutoff_days) || ' days'))
   or a.call in (
      'N6YFN' -- Lawrence Roney Net Control
    , 'K7JTC' -- Tim Collier Net Control
    , 'KF7JAF' -- Dave Le Blanc Net Control
    , 'kD7YMO' -- Gerry Grabo Net Control
    , 'N6SFX' --  Steve Farinella Net Control
    , 'K7ZEX' -- Tony Fetcho Net Control
    , 'KF4KF' --  Karol Frodsham Net Control
    , 'N7WDZ' -- Gene Heiter Net Control
    ) -- insert comma-separated call signs that will always appear in call-out list
order by 4, 3, 2;

-- View: v_harc_snn_callout_roster_random
CREATE VIEW v_harc_snn_callout_roster_random AS select callsign
    ,"first name"
    ,"last name"
    ,member
    ,comments
    ,Cutoff_Days
from (select random()
            ,callsign
            ,"first name"
            ,"last name"
            ,member
            ,comments
            ,Cutoff_Days
from (select * from v_harc_snn_callout_roster)
order by 5,1);

-- View: v_harc_snn_callout_roster_reverse
CREATE VIEW v_harc_snn_callout_roster_reverse AS
    select callsign
    ,"first name"
    ,"last name"
    ,member
    ,comments
    ,Cutoff_Days
from (select callsign
            ,"first name"
            ,"last name"
            ,member
            ,comments
            ,Cutoff_Days
from (select * from v_harc_snn_callout_roster)
order by 5,"last name" desc, "first name" desc);

-- View: v_harc_snn_callout_roster_suffix
CREATE VIEW v_harc_snn_callout_roster_suffix AS
    select callsign
 --        ,suffix
    ,"first name"
    ,"last name"
    ,member
    ,comments
    ,Cutoff_Days
from (select callsign
            ,case cast(substr(callsign,2,1) as integer)
                    when 0 then substr(callsign,4,length(callsign))
                else substr(callsign,3,length(callsign))
            end as "Suffix"
            ,"first name"
            ,"last name"
            ,member
            ,comments
            ,Cutoff_Days
from (select * from v_harc_snn_callout_roster)
order by 5,2);

-- View: v_member_qso
CREATE VIEW v_member_qso as
SELECT v_harc_member.pers_call,
           v_harc_member.pers_f_nam,
           v_harc_member.pers_m_nam,
           v_harc_member.pers_l_nam,
           v_qso_table_v008.'band_rx',
           v_qso_table_v008.'rx_frequency',
           v_qso_table_v008.'tx_frequency',
           v_qso_table_v008.'latitude',
           v_qso_table_v008'longitude',
           v_qso_table_v008.'contest_id',
           v_qso_table_v008.'qso_start',
           v_reptr.rptr_desc
      FROM v_harc_member
           INNER JOIN
           v_qso_table_v008 ON v_harc_member.pers_call = v_qso_table_v008.call
           INNER JOIN
           v_harc_add_qso_details ON v_qso_table_v00.pk = v_harc_add_qso_details.[qso_table_v008_pk]
           INNER JOIN
           v_reptr ON v_harc_add_qso_details.rptr_cd = v_reptr.rptr_cd;

-- View: v_net_qso.sql
CREATE VIEW v_net_qso as
select pk -- Primary Key from MacLoggerDX table
    ,call -- Call sign
    ,contest_id --String denoting a context (MacLoggerDX term).
                --The software looks for 'HARC-SNN' to see if user
                --   checked in the the HARC SNN
    ,first_name -- First Name
    ,last_name  -- Last Name
    ,qso_start  -- QSO Date and Time
from t_net_qso;

-- View: v_pers
CREATE VIEW v_pers as
	select * from t_pers;

-- View: v_potential_call_roster_size
CREATE VIEW v_potential_call_roster_size as
    select 7 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
            and substr(a.contest_id, 1, 4) = 'HARC'
            and date(qso_start) > (select date('now','-' || 7 || ' days'))
        order by 1
        )

union

select 14 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 14 || ' days'))
        order by 1
        )

union

select 21 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 21 || ' days'))
        order by 1
        )

union

select 28 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 28 || ' days'))
        order by 1
        )

union

select 35 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
            and substr(a.contest_id, 1, 4) = 'HARC'
            and date(qso_start) > (select date('now','-' || 35 || ' days'))
        order by 1
        )

union

select 42 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 42 || ' days'))
        order by 1
        )

union

select 49 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 49 || ' days'))
        order by 1
        )

union

select 56 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 56 || ' days'))
        order by 1
        )

union

select 63 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 63 || ' days'))
        order by 1
        )

union

select 70 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start) > (select date('now','-' || 70 || ' days'))
        order by 1
        )

union

select 'All Time'  as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
      --     and date(qso_start) > (select date('now','-' || 70 || ' days'))
        order by 1
        );

-- View: v_pwr_typ
CREATE VIEW v_pwr_typ  AS
	select *
		from t_pwr_typ;

-- View: v_qso_table_expanded
CREATE VIEW v_qso_table_expanded as
SELECT v_qso_table_v007.pk
, v_qso_table_v007.my_grid
, v_qso_table_v007.my_call
, v_qso_table_v007.my_rig
, v_qso_table_v007.call
, v_qso_table_v007.first_name
, v_qso_table_v007.last_name
, CASE when (v_pers.pers_typ = 1)
	then 'member'
	else 'non-member'
	END as 'HARC_member'
, v_qso_table_v007.street
, v_qso_table_v007.city
, v_qso_table_v007.county
, v_qso_table_v007.state
, v_qso_table_v007.postal_country
, v_qso_table_v007.zip
, v_qso_table_v007.grid
, v_qso_table_v007.dxcc_country
, v_qso_table_v007.email
, v_qso_table_v007.mode
, v_qso_table_v007.band_rx
, v_qso_table_v007.band_tx
--
--
-- ([UNIXepoch Date]/86400) + 2440587.5
-- 
,datetime((((v_qso_table_v007.qso_start)/86400)+2440587.5)) as julian_qso_start
, datetime(((v_qso_table_v007.qso_done)/86400)+2440587.5) as julian_qso_done
, v_qso_table_v007.latitude
, v_qso_table_v007.longitude
, v_qso_table_v007.tx_frequency
, v_qso_table_v007.rx_frequency
, v_qso_table_v007.azimuth
, v_qso_table_v007.elevation
, v_qso_table_v007.power
, v_qso_table_v007.dxcc_id
, v_qso_table_v007.contest_id
, v_harc_add_qso_details.qso_table_v007_pk
, v_harc_add_qso_details.rptr_cd
, v_harc_add_qso_details.rad_typ_cd
, v_harc_add_qso_details.pwr_typ_cd
, v_harc_add_qso_details.ant_typ_cd
, v_reptr.rptr_desc
, v_rad_typ.rad_typ_desc
, v_pwr_typ.pwr_typ_desc
, v_ant_typ.ant_typ_desc
, v_harc_add_qso_details.qso_comment 
FROM v_qso_table_v007 
	INNER JOIN v_harc_add_qso_details ON v_qso_table_v007.pk = v_harc_add_qso_details.qso_table_v007_pk 
	INNER JOIN v_reptr ON v_harc_add_qso_details.rptr_cd = v_reptr.rptr_cd 
	INNER JOIN v_rad_typ ON v_harc_add_qso_details.rad_typ_cd = v_rad_typ.rad_typ_cd 
	INNER JOIN v_pwr_typ ON v_harc_add_qso_details.pwr_typ_cd = v_pwr_typ.pwr_typ_cd 
	INNER JOIN v_ant_typ ON v_harc_add_qso_details.ant_typ_cd = v_ant_typ.ant_typ_cd 
	LEFT JOIN v_pers on trim(upper(call))=trim(upper(pers_call));

-- View: v_qso_table_v007
CREATE VIEW v_qso_table_v007  AS
	select *
	from qso_table_v007;

-- View: v_qso_table_v008
CREATE VIEW v_qso_table_v008 AS select * from qso_table_v008;

-- View: v_rad_typ
CREATE VIEW v_rad_typ  AS
	select *
	from t_rad_typ;

-- View: v_reptr
CREATE VIEW v_reptr  AS
	select * 
	from t_rptr;

-- View: v_snn_latest_net_checkin_count
CREATE VIEW v_snn_latest_net_checkin_count AS select count(qso_start) as 'Checkins'
        ,date(qso_start,'unixepoch') as 'Net_Date'
from v_qso_table_v008
where date(qso_start,'unixepoch') in 
            (select  date((select max(qso_start) 
            from v_qso_table_v008),'unixepoch') as 'Latest_Net_Date');


