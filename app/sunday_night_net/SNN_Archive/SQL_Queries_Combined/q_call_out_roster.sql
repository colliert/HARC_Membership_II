/**************************************************
* q_Call_Out_Roster                            *
* --------------------                            *
* Date:		7/16/2019                             *
* Author:	Tim Collier                           *
*                                                 *
* List of stations who have checked in at least   *
* one time in the past x number of days.          *
* x is listed in v_current_call_out_cuttoff days  *
* (see also v_harc_callout_roster                 *
*                                                 *
**************************************************/
select distinct v_qso_table_v008.call as 'Callsign'
	,first_name as 'First Name'
	,last_name as 'Last Name'
	,CASE
			when ifnull(v_harc_member.pers_call,'0') = '0' then 'non-member'
			else 'member'
			END as 'HARC_member'
			,'                                                                    ' as qso_comment
from v_qso_table_v008
LEFT JOIN v_harc_member on trim(upper(Call))=trim(upper(v_harc_member.pers_call))
where 	contest_id  like 'HARC-SNN%' and
		datetime(qso_start,'unixepoch') > (select date('now','-' || (select current_num_days from v_current_call_out_cutoff_days) || ' days'))
order by harc_member, last_name, first_name