select a.pers_call as 'Callsign'
   ,CASE
   WHEN a.pers_pref_nam IS NOT NULL THEN a.pers_f_nam || ' (' || a.pers_pref_nam || ')'
           ELSE a.pers_f_nam
    END                       as first_name
,pers_l_nam as last_name
from v_pers a
where a.pers_call in
      ('TDCX', 'AD7J', 'AI6HU', 'AI7OK', 'AK7I', 'K4BL', 'K6MIB', 'K7JTC', 'K7KSG', 'K7LPK', 'K7MLG', 'K7NVT',
       'K7USR', 'KA7MDY', 'KA8VIR', 'KC7RVK', 'KC8UOK', 'KD2CTJ', 'KD6CWI', 'KD7MMM', 'KF7JAF', 'KF7PSM', 'KG6ETI',
       'KG7HKH', 'KG7NEP', 'KG7QWH', 'KG7RUS', 'KG7XD', 'KI7EUF', 'KJ7MHB', 'KJ7OWF', 'KJ7PAR', 'KJ7QMU', 'KJ7QVB',
       'KJ7RNB', 'KJ7WBK', 'KK6DZ', 'KK7HGW', 'KK7JNR', 'KK7NWE', 'KK7NYE', 'KK7OFT', 'KK7PTU', 'KK7PUJ', 'KK7RMJ',
       'KK7UKT', 'KK7VCP', 'KK7VDT', 'KK7WFV', 'KM6VF', 'N2DKI', 'N2NJB', 'N2RGU', 'N4NJJ', 'N5GOP', 'N6YFN', 'N7BTH',
       'N7GLF', 'N7WDZ', 'N7ZEV', 'W3QQQ', 'W6GLW', 'W6MW', 'W7DGU', 'W7GPS', 'W7JCK', 'W7KZ', 'W7NVS', 'W7OBW',
       'W7SWA', 'W7UVO', 'W7WDJ', 'W9CSO', 'WB6NAH', 'WD6FXK')
order by a.pers_l_nam