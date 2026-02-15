from typing import List

from sqlalchemy import Column, Float, ForeignKey, Integer, LargeBinary, Numeric, Table, Text
from sqlalchemy.orm import declarative_base, mapped_column, relationship
from sqlalchemy.orm.base import Mapped
from sqlalchemy.sql.sqltypes import NullType

Base = declarative_base()
metadata = Base.metadata


class QsoTableV008(Base):
	__tablename__ = 'qso_table_v008'

	pk = mapped_column(Integer, primary_key=True)
	my_grid = mapped_column(Text)
	my_call = mapped_column(Text)
	my_rig = mapped_column(Text)
	call = mapped_column(Text)
	first_name = mapped_column(Text)
	last_name = mapped_column(Text)
	street = mapped_column(Text)
	city = mapped_column(Text)
	county = mapped_column(Text)
	state = mapped_column(Text)
	postal_country = mapped_column(Text)
	zip = mapped_column(Text)
	grid = mapped_column(Text)
	dxcc_country = mapped_column(Text)
	iota = mapped_column(Text)
	sota = mapped_column(Text)
	cq_zone = mapped_column(Text)
	itu = mapped_column(Text)
	ten_ten = mapped_column(Text)
	email = mapped_column(Text)
	url = mapped_column(Text)
	mode = mapped_column(Text)
	band_rx = mapped_column(Text)
	band_tx = mapped_column(Text)
	rst_sent = mapped_column(Text)
	rst_received = mapped_column(Text)
	qsl_via = mapped_column(Text)
	qsl_sent = mapped_column(Text)
	qsl_received = mapped_column(Text)
	srx = mapped_column(Text)
	stx = mapped_column(Text)
	comments = mapped_column(Text)
	satellite = mapped_column(Text)
	qso_start = mapped_column(Float)
	qso_done = mapped_column(Float)
	latitude = mapped_column(Float)
	longitude = mapped_column(Float)
	tx_frequency = mapped_column(Float)
	rx_frequency = mapped_column(Float)
	azimuth = mapped_column(Float)
	elevation = mapped_column(Float)
	power = mapped_column(Float)
	srx_numeric = mapped_column(Integer)
	stx_numeric = mapped_column(Integer)
	dxcc_id = mapped_column(Integer)
	contest_id = mapped_column(Text)
	my_sota = mapped_column(Text)
	skcc = mapped_column(Text)
	pota = mapped_column(Text)
	my_pota = mapped_column(Text)
	wwff = mapped_column(Text)
	my_wwff = mapped_column(Text)
	sig = mapped_column(Text)
	my_sig = mapped_column(Text)
	sig_info = mapped_column(Text)
	my_sig_info = mapped_column(Text)
	ext_val_1 = mapped_column(Text)
	ext_val_2 = mapped_column(Text)
	ext_val_3 = mapped_column(Text)
	ext_val_4 = mapped_column(Text)
	distance = mapped_column(Float)


t_qso_table_v008_backup = Table(
	'qso_table_v008_backup', metadata,
	Column('pk', Integer),
	Column('my_grid', Text),
	Column('my_call', Text),
	Column('my_rig', Text),
	Column('call', Text),
	Column('first_name', Text),
	Column('last_name', Text),
	Column('street', Text),
	Column('city', Text),
	Column('county', Text),
	Column('state', Text),
	Column('postal_country', Text),
	Column('zip', Text),
	Column('grid', Text),
	Column('dxcc_country', Text),
	Column('iota', Text),
	Column('sota', Text),
	Column('cq_zone', Text),
	Column('itu', Text),
	Column('ten_ten', Text),
	Column('email', Text),
	Column('url', Text),
	Column('mode', Text),
	Column('band_rx', Text),
	Column('band_tx', Text),
	Column('rst_sent', Text),
	Column('rst_received', Text),
	Column('qsl_via', Text),
	Column('qsl_sent', Text),
	Column('qsl_received', Text),
	Column('srx', Text),
	Column('stx', Text),
	Column('comments', Text),
	Column('satellite', Text),
	Column('qso_start', Float),
	Column('qso_done', Float),
	Column('latitude', Float),
	Column('longitude', Float),
	Column('tx_frequency', Float),
	Column('rx_frequency', Float),
	Column('azimuth', Float),
	Column('elevation', Float),
	Column('power', Float),
	Column('srx_numeric', Integer),
	Column('stx_numeric', Integer),
	Column('dxcc_id', Integer),
	Column('contest_id', Text),
	Column('my_sota', Text),
	Column('skcc', Text),
	Column('pota', Text),
	Column('my_pota', Text),
	Column('wwff', Text),
	Column('my_wwff', Text),
	Column('sig', Text),
	Column('my_sig', Text),
	Column('sig_info', Text),
	Column('my_sig_info', Text),
	Column('ext_val_1', Text),
	Column('ext_val_2', Text),
	Column('ext_val_3', Text),
	Column('ext_val_4', Text),
	Column('distance', Float)
)


class TCallOutCutoffDays(Base):
	__tablename__ = 't_call_out_cutoff_days'

	dat_est = mapped_column(Text, primary_key=True)
	num_days = mapped_column(Integer, nullable=False)


class THcolExport(Base):
	__tablename__ = 't_hcol_export'

	mem_num = mapped_column(Numeric, primary_key=True)
	roster = mapped_column(Text)
	f_nam = mapped_column(Text)
	pref_nam = mapped_column(Text)
	l_nam = mapped_column(Text)
	call = mapped_column(Text)
	lic_cls = mapped_column(Text)
	lic_exp_dat = mapped_column(Text)
	lic_num = mapped_column(Text)
	lic_agncy = mapped_column(Text)
	street = mapped_column(Text)
	city = mapped_column(Text)
	st = mapped_column(Text)
	zip = mapped_column(Text)
	country_cd = mapped_column(Text)
	lat = mapped_column(Numeric)
	lon = mapped_column(Numeric)
	elev = mapped_column(Numeric)
	hcol_email = mapped_column(Text)
	hcol_email_stat = mapped_column(Text)
	club_email = mapped_column(Text)
	club_email_stat = mapped_column(Text)
	phone_pri = mapped_column(Text)
	phone_pri_typ = mapped_column(Text)
	phone_pri_pub = mapped_column(Text)
	phone_alt = mapped_column(Text)
	phone_alt_typ = mapped_column(Text)
	phone_alt_pub = mapped_column(Text)
	emer_cntct = mapped_column(Text)
	join_dat = mapped_column(Text)
	left_dat = mapped_column(Text)
	club_rank = mapped_column(Text)
	club_pos = mapped_column(Text)
	dele = mapped_column(Text)
	mem_typ = mapped_column(Text)
	mem_exp_dat = mapped_column(Text)
	club_bal = mapped_column(Numeric)
	dob = mapped_column(Text)
	priv_mem = mapped_column(Numeric)
	tz = mapped_column(Text)
	lst_login = mapped_column(Text)
	role_cnt = mapped_column(Numeric)


class TNetQso(Base):
	__tablename__ = 't_net_qso'

	qso_key = mapped_column(Numeric, primary_key=True)
	call = mapped_column(Text)
	net_id = mapped_column(Text)
	f_nam = mapped_column(Text)
	l_nam = mapped_column(Text)
	qso_date = mapped_column(Text)
	qso_time = mapped_column(Text)


class TPersTyp(Base):
	__tablename__ = 't_pers_typ'

	pers_typ_cd = mapped_column(Numeric, primary_key=True)
	pers_typ_desc = mapped_column(Text, nullable=False)

	t_pers: Mapped[List['TPers']] = relationship('TPers', uselist=True, back_populates='t_pers_typ')


t_v_call_out_cutoff_days = Table(
	'v_call_out_cutoff_days', metadata,
	Column('dat_est', Text),
	Column('num_days', Integer)
)

t_v_check_ins_for_web_display = Table(
	'v_check-ins_for_web_display', metadata,
	Column('Callsign', Text),
	Column('First_Name', NullType),
	Column('Last_Name', Text),
	Column('Checkin_Date(UTC)', Text)
)

t_v_checkins_most_recent_net = Table(
	'v_checkins_most_recent_net', metadata,
	Column('call', Text),
	Column('first_name', NullType),
	Column('last_name', Text),
	Column('UTC_Checkin_Date', Text),
	Column('UTC_Time', Text),
	Column('Member_Status', Numeric)
)

t_v_count_qso_by_date = Table(
	'v_count_qso_by_date', metadata,
	Column('qso_date', Text),
	Column('count(qso_date)', NullType)
)

t_v_current_call_out_cutoff_days = Table(
	'v_current_call_out_cutoff_days', metadata,
	Column('current_num_days', Integer)
)

t_v_harc_snn_callout_roster = Table(
	'v_harc_snn_callout_roster', metadata,
	Column('Callsign', Text),
	Column('First Name', NullType),
	Column('Last Name', Text),
	Column('Member', NullType),
	Column('Comments', NullType),
	Column('Cutoff_Days', Integer)
)

t_v_harc_snn_callout_roster_random = Table(
	'v_harc_snn_callout_roster_random', metadata,
	Column('callsign', Text),
	Column('first name', NullType),
	Column('last name', Text),
	Column('member', NullType),
	Column('comments', NullType),
	Column('Cutoff_Days', Integer)
)

t_v_harc_snn_callout_roster_reverse = Table(
	'v_harc_snn_callout_roster_reverse', metadata,
	Column('callsign', Text),
	Column('first name', NullType),
	Column('last name', Text),
	Column('member', NullType),
	Column('comments', NullType),
	Column('Cutoff_Days', Integer)
)

t_v_harc_snn_callout_roster_suffix = Table(
	'v_harc_snn_callout_roster_suffix', metadata,
	Column('callsign', Text),
	Column('first name', NullType),
	Column('last name', Text),
	Column('member', NullType),
	Column('comments', NullType),
	Column('Cutoff_Days', Integer)
)

t_v_hcol_export = Table(
	'v_hcol_export', metadata,
	Column('mem_num', Numeric),
	Column('roster', Text),
	Column('f_nam', Text),
	Column('pref_nam', Text),
	Column('l_nam', Text),
	Column('call', Text),
	Column('lic_cls', Text),
	Column('lic_exp_dat', Text),
	Column('lic_num', Text),
	Column('lic_agncy', Text),
	Column('street', Text),
	Column('city', Text),
	Column('st', Text),
	Column('zip', Text),
	Column('country_cd', Text),
	Column('lat', Numeric),
	Column('lon', Numeric),
	Column('elev', Numeric),
	Column('hcol_emal', Text),
	Column('hcol_email_stat', Text),
	Column('club_email', Text),
	Column('club_email_stat', Text),
	Column('phone_pri', Text),
	Column('phone_pri_typ', Text),
	Column('phone_pri_pub', Text),
	Column('phone_alt', Text),
	Column('phone_alt_typ', Text),
	Column('phone_alt_pub', Text),
	Column('emer_cntct', Text),
	Column('join_dat', Text),
	Column('left_dat', Text),
	Column('club_rank', Text),
	Column('club_pos', Text),
	Column('dele', Text),
	Column('mem_typ', Text),
	Column('mem_exp_dat', Text),
	Column('club_bal', Numeric),
	Column('dob', Text),
	Column('priv_mem', Numeric),
	Column('tz', Text),
	Column('lst_login', Text),
	Column('role_cnt', Numeric)
)

t_v_maint_add_as_mem = Table(
	'v_maint_add_as_mem', metadata,
	Column('call', Text),
	Column('f_nam', Text),
	Column('m_nam', NullType),
	Column('l_nam', Text),
	Column('pref_nam', Text),
	Column('person_typ', NullType)
)

t_v_maint_add_person_to_pers = Table(
	'v_maint_add_person_to_pers', metadata,
	Column('call', Text),
	Column('f_nam', Text),
	Column('m_nam', NullType),
	Column('l_nam', Text),
	Column('Preferred_nam', NullType),
	Column('person_type', NullType)
)

t_v_maint_cha_nonmember_to_member = Table(
	'v_maint_cha_nonmember_to_member', metadata,
	Column('call', Text),
	Column('f_nam', Text),
	Column('l_nam', Text),
	Column('roster', Text)
)

t_v_maint_latest_hcol_join_date = Table(
	'v_maint_latest_hcol_join_date', metadata,
	Column('call', Text),
	Column('l_nam', Text),
	Column('f_nam', Text),
	Column('join_dat', Text)
)

t_v_maint_remove_as_member = Table(
	'v_maint_remove_as_member', metadata,
	Column('pers_call', Text),
	Column('pers_f_nam', Text),
	Column('pers_l_nam', Text)
)

t_v_maint_show_dupes = Table(
	'v_maint_show_dupes', metadata,
	Column('item_checked', LargeBinary),
	Column('dupe_type', NullType),
	Column('num_found', NullType)
)

t_v_net_qso = Table(
	'v_net_qso', metadata,
	Column('QSO_Key', Numeric),
	Column('call', Text),
	Column('net_id', Text),
	Column('f_nam', Text),
	Column('l_nam', Text),
	Column('qso_date', Text),
	Column('qso_time', Text)
)

t_v_pers = Table(
	'v_pers', metadata,
	Column('pers_call', Text),
	Column('pers_f_nam', Text),
	Column('pers_m_nam', Text),
	Column('pers_l_nam', Text),
	Column('pers_pref_nam', Text),
	Column('pers_typ_cd', Numeric)
)

t_v_pers_typ = Table(
	'v_pers_typ', metadata,
	Column('pers_typ_cd', Numeric),
	Column('pers_typ_desc', Text)
)

t_v_potential_callout_roster_size = Table(
	'v_potential_callout_roster_size', metadata,
	Column('Days_since_last_checkin', NullType),
	Column('Potential_number_of_callouts', NullType)
)

t_v_qso_table_v008 = Table(
	'v_qso_table_v008', metadata,
	Column('pk', Integer),
	Column('my_grid', Text),
	Column('my_call', Text),
	Column('my_rig', Text),
	Column('call', Text),
	Column('first_name', Text),
	Column('last_name', Text),
	Column('street', Text),
	Column('city', Text),
	Column('county', Text),
	Column('state', Text),
	Column('postal_country', Text),
	Column('zip', Text),
	Column('grid', Text),
	Column('dxcc_country', Text),
	Column('iota', Text),
	Column('sota', Text),
	Column('cq_zone', Text),
	Column('itu', Text),
	Column('ten_ten', Text),
	Column('email', Text),
	Column('url', Text),
	Column('mode', Text),
	Column('band_rx', Text),
	Column('band_tx', Text),
	Column('rst_sent', Text),
	Column('rst_received', Text),
	Column('qsl_via', Text),
	Column('qsl_sent', Text),
	Column('qsl_received', Text),
	Column('srx', Text),
	Column('stx', Text),
	Column('comments', Text),
	Column('satellite', Text),
	Column('qso_start', Float),
	Column('qso_done', Float),
	Column('latitude', Float),
	Column('longitude', Float),
	Column('tx_frequency', Float),
	Column('rx_frequency', Float),
	Column('azimuth', Float),
	Column('elevation', Float),
	Column('power', Float),
	Column('srx_numeric', Integer),
	Column('stx_numeric', Integer),
	Column('dxcc_id', Integer),
	Column('contest_id', Text),
	Column('my_sota', Text),
	Column('skcc', Text),
	Column('pota', Text),
	Column('my_pota', Text),
	Column('wwff', Text),
	Column('my_wwff', Text),
	Column('sig', Text),
	Column('my_sig', Text),
	Column('sig_info', Text),
	Column('my_sig_info', Text),
	Column('ext_val_1', Text),
	Column('ext_val_2', Text),
	Column('ext_val_3', Text),
	Column('ext_val_4', Text),
	Column('distance', Float)
)

t_v_suffix_listing = Table(
	'v_suffix_listing', metadata,
	Column('call', Text),
	Column('First_Name', NullType),
	Column('Last_Name', Text),
	Column('Suffix', NullType)
)


class TPers(Base):
	__tablename__ = 't_pers'

	pers_call = mapped_column(Text, primary_key=True)
	pers_typ_cd = mapped_column(ForeignKey('t_pers_typ.pers_typ_cd'), nullable=False)
	pers_f_nam = mapped_column(Text)
	pers_m_nam = mapped_column(Text)
	pers_l_nam = mapped_column(Text)
	pers_pref_nam = mapped_column(Text)

	t_pers_typ: Mapped['TPersTyp'] = relationship('TPersTyp', back_populates='t_pers')
