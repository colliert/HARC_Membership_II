select distinct ifnull(b.pers_pref_nam, b.pers_f_nam) || ' (' || a.pers_call || ')' as NCO
       ,count(Net_date) as 'Number_of_dates'
from t_nco_avail a
join v_pers b on b.pers_call = a.pers_call
group by 1
order by 1