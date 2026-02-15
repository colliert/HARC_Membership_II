/***********************************************************************
* HARC_SNN_Participation_RPT.sql                                       *
* ------------------------------                                       *
*                                                                      *
* Date:		7/16/2019                                                  *
* Author:	Tim Collier                                                *
* List HARC Sunday Night Net Participation for a particular date range *
*                                                                      *
***********************************************************************/
select pk
	,julian_qso_start as QSO_Date
	,call 			as 'Call'
	,first_name 	as 'First Name'
	,last_name 		as 'Last Name'
	,HARC_member as 'Member Status'
	,rptr_cd 		as 'Repeater Code'
	,rptr_desc 		as 'Repeater Desc.'
	,rad_typ_desc 	as 'Radio'
	,pwr_typ_desc 	as 'Power Type'
	,ant_typ_desc	as 'Antenna'
	,qso_comment 	as 'Comment'
from v_qso_table_expanded
where julian_qso_start between '2019-07-14' and '2019-07-16'