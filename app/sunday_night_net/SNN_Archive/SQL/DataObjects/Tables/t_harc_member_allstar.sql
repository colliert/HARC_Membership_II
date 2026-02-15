create table t_harc_member_allstar
(
	mem_call TEXT not null
		references t_harc_member,
	node_num INTEGER not null
		unique,
	node_ext TEXT,
	node_id TEXT,
	node_freq REAL,
	node_tone REAL,
	node_location TEXT,
	node_country TEXT,
	node_site_nam TEXT,
	node_affiliation TEXT,
	node_eff_dat TEXT,
	primary key (mem_call, node_num)
);

