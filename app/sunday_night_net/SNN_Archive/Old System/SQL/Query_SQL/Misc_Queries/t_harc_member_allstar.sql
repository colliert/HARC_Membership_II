--drop table t_harc_member_allstar;
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