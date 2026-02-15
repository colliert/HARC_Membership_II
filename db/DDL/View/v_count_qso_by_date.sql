CREATE VIEW v_count_qso_by_date AS
/*
* v_count_qso_by_date
* ------------------==
*
* Author:  Tim Collier
* Date: November 15, 2024
*
* Purpose:  Report on the total number of check-ins (QSOs) for each date.
*/
select
    qso_date
    ,count(qso_date)
from v_net_qso
group by qso_date
order by 1;


