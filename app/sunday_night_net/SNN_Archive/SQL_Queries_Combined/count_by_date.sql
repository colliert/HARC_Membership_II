--select date(qso_start) as "Net Date"
select date(qso_start) as "Net Date"
,count(qso_start)as "Checkins"
from v_qso_table_v008
group by 1
order by 1