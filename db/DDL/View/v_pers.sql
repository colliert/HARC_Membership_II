CREATE VIEW v_pers(pers_call, pers_f_nam, pers_m_nam, pers_l_nam, pers_pref_nam, pers_typ_cd) AS
 /*
 * v_pers
 * ------
 *
 * Author:  Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  Provide a view into the table t_pers
 *
 */
    SELECT
    pers_call
   , pers_f_nam
   , pers_m_nam
   , pers_l_nam
   , pers_pref_nam
   , pers_typ_cd
 FROM 
    t_pers;


