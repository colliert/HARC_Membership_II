select date(qso_start,'unixepoch'), count(date(qso_start,'unixepoch'))
from qso_table_v008
where contest_id like '%HARC-SNN%'
group by date(qso_start,'unixepoch')