--
-- q_net_control_list.sql
--
-- Author:  Tim Collier
-- Date:  October 21, 2025
--
-- Purpose:  List all who have participated as net control operators for the HARC Sunday Night Net
--
select CASE
           WHEN b.pers_pref_nam IS NOT NULL THEN b.pers_f_nam || ' (' || b.pers_pref_nam || ')'
           ELSE b.pers_f_nam
    END                       as first_name
     , b.pers_l_nam           as last_name
     , a.pers_call as callsign
from t_nco_operator a
         join t_pers b on a.pers_call = b.pers_call
order by last_name