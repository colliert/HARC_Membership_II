/****************************************
* HARC_SNN_QSO_LIST.sql                 *
* ---------------------                 *
*                                       *
* Date:  	7/16/2019                   *
* Author:	Tim Collier                 *
*                                       *
* List the HARC Sunday Night Net        *
* participant list.  The PK is used     *
* if additional details are to be added *
* to the t_add_qso_detail table.        *
****************************************/

select pk
	,call
	,first_name,last_name
	,datetime(qso_start,'unixepoch') as QSO_Start
	,datetime(qso_done,'unixepoch') as QSO_Done
from qso_table_v007
where datetime(qso_start,'unixepoch') between '2019-08-04' and '2019-08-06';