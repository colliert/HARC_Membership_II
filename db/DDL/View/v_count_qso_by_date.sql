/*
v_count_qso_by_date.sql
==========================
Author: J. Timothy Collier
Created: 2/15/26
Last Updated: 2/15/26
==========================
Purpose: Count the number of check-ins by date

*/
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


