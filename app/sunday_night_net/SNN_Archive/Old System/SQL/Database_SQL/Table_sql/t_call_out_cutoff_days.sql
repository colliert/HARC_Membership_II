-- Table: t_call_out_cutoff_days
DROP TABLE IF EXISTS t_call_out_cutoff_days;
CREATE TABLE t_call_out_cutoff_days (dat_est TEXT PRIMARY KEY, num_days INTEGER NOT NULL) WITHOUT ROWID;
