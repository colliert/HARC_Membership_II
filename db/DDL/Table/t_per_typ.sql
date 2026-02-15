/*
* t_pers_typ
* ----------
*
* Author:  Tim Collier
* Date:  November 18, 2024
*
* Purpose:  Store types of persons that exist in the t_pers table.  Current values are:
*           0 = Non-member
*           1 = Club member
*           2 = Club member - Old Callsign
*           3 = Silent Key
*           4 = Non-member - Old Callsign
*/
CREATE TABLE t_pers (
    pers_call     TEXT   PRIMARY KEY
                         NOT NULL,
    pers_f_nam    TEXT,
    pers_m_nam    TEXT,
    pers_l_nam    TEXT,
    pers_pref_nam TEXT,
    pers_typ_cd   NUMBER NOT NULL
    
    CONSTRAINT pers_typ_FK REFERENCES t_pers_typ (pers_typ_cd) 
);