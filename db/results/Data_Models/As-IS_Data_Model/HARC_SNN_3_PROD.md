classDiagram
direction BT
class qso_table_v008 {
   text my_grid
   text my_call
   text my_rig
   text call
   text first_name
   text last_name
   text street
   text city
   text county
   text state
   text postal_country
   text zip
   text grid
   text dxcc_country
   text iota
   text sota
   text cq_zone
   text itu
   text ten_ten
   text email
   text url
   text mode
   text band_rx
   text band_tx
   text rst_sent
   text rst_received
   text qsl_via
   text qsl_sent
   text qsl_received
   text srx
   text stx
   text comments
   text satellite
   real qso_start
   real qso_done
   real latitude
   real longitude
   real tx_frequency
   real rx_frequency
   real azimuth
   real elevation
   real power
   integer srx_numeric
   integer stx_numeric
   integer dxcc_id
   text contest_id
   text my_sota
   text skcc
   text pota
   text my_pota
   text wwff
   text my_wwff
   text sig
   text my_sig
   text sig_info
   text my_sig_info
   text ext_val_1
   text ext_val_2
   text ext_val_3
   text ext_val_4
   real distance
   integer pk
}
class qso_table_v008_backup {
   int pk
   text my_grid
   text my_call
   text my_rig
   text call
   text first_name
   text last_name
   text street
   text city
   text county
   text state
   text postal_country
   text zip
   text grid
   text dxcc_country
   text iota
   text sota
   text cq_zone
   text itu
   text ten_ten
   text email
   text url
   text mode
   text band_rx
   text band_tx
   text rst_sent
   text rst_received
   text qsl_via
   text qsl_sent
   text qsl_received
   text srx
   text stx
   text comments
   text satellite
   real qso_start
   real qso_done
   real latitude
   real longitude
   real tx_frequency
   real rx_frequency
   real azimuth
   real elevation
   real power
   int srx_numeric
   int stx_numeric
   int dxcc_id
   text contest_id
   text my_sota
   text skcc
   text pota
   text my_pota
   text wwff
   text my_wwff
   text sig
   text my_sig
   text sig_info
   text my_sig_info
   text ext_val_1
   text ext_val_2
   text ext_val_3
   text ext_val_4
   real distance
}
class sqlite_master {
   text type
   text name
   text tbl_name
   int rootpage
   text sql
}
class t_call_out_cutoff_days {
   integer num_days
   text dat_est
}
class t_hcol_export {
   numeric mem_num
   text roster
   text f_nam
   text pref_nam
   text l_nam
   text call
   text lic_cls
   text lic_exp_dat
   text lic_num
   text lic_agncy
   text street
   text city
   text st
   text zip
   text country_cd
   numeric lat
   numeric lon
   numeric elev
   text hcol_emal
   text hcol_email_stat
   text club_email
   text club_email_stat
   text phone_pri
   text phone_pri_typ
   text phone_pri_pub
   text phone_alt
   text phone_alt_typ
   text phone_alt_pub
   text emer_cntct
   text join_dat
   text left_dat
   text club_rank
   text club_pos
   text dele
   text mem_typ
   text mem_exp_dat
   numeric club_bal
   text dob
   numeric priv_mem
   text tz
   text lst_login
   numeric role_cnt
}
class t_net_qso {
   text call
   text net_id
   text f_nam
   text l_nam
   text qso_date
   text qso_time
   numeric qso_key
}
class t_pers {
   text pers_f_nam
   text pers_m_nam
   text pers_l_nam
   text pers_pref_nam
   number pers_typ_cd
   text pers_call
}
class t_pers_typ {
   text pers_typ_desc
   numeric pers_typ_cd
}
class v_call_out_cutoff_days {
   text dat_est
   integer num_days
}
class node8 {
   text Callsign
   unknown First_Name
   text Last_Name
   Checkin_Date(UTC) text
}
class v_checkins_most_recent_net {
   text call
   text first_name
   text last_name
   text UTC_Checkin_Date
   text UTC_Time
   number Member_Status
}
class v_count_qso_by_date {
   text qso_date
   count(qso_date) unknown
}
class v_current_call_out_cutoff_days {
   integer current_num_days
}
class v_harc_snn_callout_roster {
   text Callsign
   unknown First Name
   text Last Name
   unknown Member
   unknown Comments
   integer Cutoff_Days
}
class v_harc_snn_callout_roster_random {
   text callsign
   unknown first name
   text last name
   unknown member
   unknown comments
   integer Cutoff_Days
}
class v_harc_snn_callout_roster_reverse {
   text callsign
   unknown first name
   text last name
   unknown member
   unknown comments
   integer Cutoff_Days
}
class v_harc_snn_callout_roster_suffix {
   text callsign
   unknown first name
   text last name
   unknown member
   unknown comments
   integer Cutoff_Days
}
class v_hcol_export {
   numeric mem_num
   text roster
   text f_nam
   text pref_nam
   text l_nam
   text call
   text lic_cls
   text lic_exp_dat
   text lic_num
   text lic_agncy
   text street
   text city
   text st
   text zip
   text country_cd
   numeric lat
   numeric lon
   numeric elev
   text hcol_emal
   text hcol_email_stat
   text club_email
   text club_email_stat
   text phone_pri
   text phone_pri_typ
   text phone_pri_pub
   text phone_alt
   text phone_alt_typ
   text phone_alt_pub
   text emer_cntct
   text join_dat
   text left_dat
   text club_rank
   text club_pos
   text dele
   text mem_typ
   text mem_exp_dat
   numeric club_bal
   text dob
   numeric priv_mem
   text tz
   text lst_login
   numeric role_cnt
}
class v_maint_add_as_mem {
   text call
   text f_nam
   text l_nam
   text roster
}
class v_maint_add_person_to_pers {
   text call
   text net_id
   text f_nam
   text l_nam
   text qso_date
}
class v_maint_cha_nonmember_to_member {
   text call
   text f_nam
   text l_nam
   text roster
}
class v_maint_latest_hcol_join_date {
   text call
   text First_Name
   text Last_Name
   unknown Latest_Join_Date
}
class v_maint_remove_as_member {
   text pers_call
   text pers_f_nam
   text pers_l_nam
}
class v_maint_show_dupes {
   blob item_checked
   unknown dupe_type
   unknown num_found
}
class v_net_qso {
   numeric QSO_Key
   text call
   text net_id
   text f_nam
   text l_nam
   text qso_date
   text qso_time
}
class v_pers {
   text pers_call
   text pers_f_nam
   text pers_m_nam
   text pers_l_nam
   text pers_pref_nam
   number pers_typ_cd
}
class v_pers_typ {
   numeric pers_typ_cd
   text pers_typ_desc
}
class v_potential_callout_roster_size {
   unknown Days_since_last_checkin
   unknown Potential_number_of_callouts
}
class v_qso_table_v008 {
   integer pk
   text my_grid
   text my_call
   text my_rig
   text call
   text first_name
   text last_name
   text street
   text city
   text county
   text state
   text postal_country
   text zip
   text grid
   text dxcc_country
   text iota
   text sota
   text cq_zone
   text itu
   text ten_ten
   text email
   text url
   text mode
   text band_rx
   text band_tx
   text rst_sent
   text rst_received
   text qsl_via
   text qsl_sent
   text qsl_received
   text srx
   text stx
   text comments
   text satellite
   real qso_start
   real qso_done
   real latitude
   real longitude
   real tx_frequency
   real rx_frequency
   real azimuth
   real elevation
   real power
   integer srx_numeric
   integer stx_numeric
   integer dxcc_id
   text contest_id
   text my_sota
   text skcc
   text pota
   text my_pota
   text wwff
   text my_wwff
   text sig
   text my_sig
   text sig_info
   text my_sig_info
   text ext_val_1
   text ext_val_2
   text ext_val_3
   text ext_val_4
   real distance
}
class v_suffix_listing {
   text call
   unknown First_Name
   text Last_Name
   unknown Suffix
}

t_pers  -->  t_pers_typ : pers_typ_cd
