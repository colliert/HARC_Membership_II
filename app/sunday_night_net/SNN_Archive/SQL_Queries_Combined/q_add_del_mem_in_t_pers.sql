select 1 as Action_Code
    ,"Add new member" as Action
    ,"call sign" as callsign
    ,"first name" as first_name
    ,"last name"  as last_name
from t_HCOL_Mem
where "roster status" <> 'Inactive'
        and callsign not in
        (select a.callsign from t_pers a
        where pers_type =1)
union
select 2 as Action_Code
    ,"Remove as member" as Action
    ,a.callsign as callsign
    ,a.first_name as first_name
    ,a.last_name as last_name
from t_pers a
where a.pers_type = 1
      and
      a.callsign not in
      (select b."Call Sign"
      from t_HCOL_Mem b)