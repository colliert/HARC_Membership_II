DROP VIEW IF EXISTS v_member_qso;
CREATE VIEW v_member_qso AS
SELECT v_harc_member.pers_call,
           v_harc_member.pers_f_nam,
           v_harc_member.pers_m_nam,
           v_harc_member.pers_l_nam,
           v_qso_table_v007.'band_rx',
           v_qso_table_v007.'rx_frequency',
           v_qso_table_v007.'tx_frequency',
           v_qso_table_v007.'latitude',
           v_qso_table_v007.'longitude',
           v_qso_table_v007.'contest_id',
           v_qso_table_v007.'qso_start',
           v_reptr.rptr_desc
      FROM v_harc_member
           INNER JOIN
           v_qso_table_v007 ON v_harc_member.pers_call = v_qso_table_v007.call
           INNER JOIN
           v_harc_add_qso_details ON v_qso_table_v007.pk = v_harc_add_qso_details.[qso_table_v007_pk]
           INNER JOIN
           v_reptr ON v_harc_add_qso_details.rptr_cd = v_reptr.rptr_cd;