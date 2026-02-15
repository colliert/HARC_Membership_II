-- View: v_harc_member_allstar_listing
DROP VIEW IF EXISTS v_harc_member_allstar_listing;
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