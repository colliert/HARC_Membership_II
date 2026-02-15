create table t_harc_add_qso_details
(
	qso_table_v007_pk INTEGER not null
		primary key
		references qso_table_v007,
	rptr_cd TEXT default 'H2' not null
		references t_rptr,
	rad_typ_cd INTEGER default 1 not null
		references t_rad_typ,
	pwr_typ_cd INTEGER default 1 not null
		references t_pwr_typ,
	ant_typ_cd INTEGER default 1 not null
		references t_ant_typ,
	qso_comment TEXT
);

