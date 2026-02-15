DROP VIEW IF EXISTS v_checkin_count;
CREATE VIEW v_checkin_count AS
select date(qso_start) as "Net Date"
     , count(date(qso_start))             as "Checkins"
from v_net_qso
group by 1
order by 1;

