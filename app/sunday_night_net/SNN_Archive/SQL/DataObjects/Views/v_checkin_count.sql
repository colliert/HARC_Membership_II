CREATE VIEW v_checkin_count AS
select date(qso_start, 'unixepoch') as "Net Date"
     , count(qso_start)             as "Checkins"
from v_net_qso
group by 1
order by 1;

