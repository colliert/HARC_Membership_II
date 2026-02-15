/**************************************************
* HARC_Call_Out_Roster                            *
* --------------------                            *
* Date:		7/16/2019                             *
* Author:	Tim Collier                           *
*                                                 *
* List of stations who have checked in at least   *
* one time in the past x number of days.          *
* x is listed in v_current_call_out_cutoff days  *
*                                                 *
**************************************************/

select distinct a.call                                                                     as 'Callsign'
              , CASE
                    when v_pers.pers_call is NULL then
                        a.first_name
                    else
                        ifnull(v_pers.pers_nicknam, v_pers.pers_f_nam)
    END                                                                                    as 'First Name'
              , a.last_name                                                                as 'Last Name'
              , CASE
                    when v_pers.pers_typ = '1' then
                        'member'
                    else
                        'non-member'
    END                                                                                    as 'Member'
              , '                                                                    '     as 'Comments'
              , (select current_num_days from v_current_call_out_cutoff_days)              as 'Cutoff_Days'


from v_net_qso a
         LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
/*
* Select those records that show a contest id beginning with HARC-SNN (Sunday Night Net)
* as well as those that are within the required number of days (probably 28 days).
* There may be some special cases where a call sign is always included
*/
where substr(a.contest_id, 1, 4) = 'HARC' and
      date(a.qso_start, 'unixepoch') >
      (select date('now', '-' || (select current_num_days from v_current_call_out_cutoff_days) || ' days'))
   or a.call in ('KI7EWQ' --Gage Calihan (monitoring) re Earl WB6AMT
    , 'KI6CCW' -- Thomas Turner Net Control
    , 'WB6AMT' -- Earl Lizardi Net Control
    , 'N6YFN' -- Lawrence Roney Net Control
    , 'K7JTC' -- Tim Collier Net Control
    , 'WJ3EP' -- Jay Frumpkin Net Control
    , 'KM7MLH' -- Mike Hargett Net Control
    ) -- insert comma-separated call signs that will always appear in call-out list
order by 4, 3, 2;