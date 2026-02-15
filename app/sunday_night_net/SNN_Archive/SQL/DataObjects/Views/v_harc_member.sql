CREATE VIEW v_harc_member as
select a.pers_call
     , a.pers_f_nam
     , a.pers_m_nam
     , a.pers_l_nam
     , a.pers_nicknam
     , a.pers_lic_class
     , pers_typ
from t_pers a
where pers_typ = 1
order by a.pers_l_nam;

