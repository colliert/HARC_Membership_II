/*q_harc_member_voting_status.sql
  *
  * Author:  Tim Collier
  * Date:  November 19, 2025
  *
  * Purpose:  List the members and their current voting status.
  *
  *           Using HamClubOnline, navigate to Manage Elections, and select the appropriate election.
  *           There will be a listing of those callsigns who have registered votes ("Have  Voted").  Copy that list
  *           and edit it to include single quotes around each callsign and then create a list of those
  *           callsigns separated by commas.  Paste that list into the select CASE statement.
  *           The query will then go through the list of members in v_hcol_export.  If the member's call sign
  *           appears in the list of those who have voted, their voting status will be set to 'E'.  Otherwise,
  *           the member's voting status will be blank and they would be allowed to have a paper ballot.
*/
select distinct CASE
                    WHEN a.call in (
                                    'AB7M', 'AD7J', 'AI6HU', 'AI7OK', 'AI7XG', 'AJ7DF', 'AK7I', 'K0EJO', 'K3JRJ', 'K4BL',
'K7JTC', 'K7KSG', 'K7LPK', 'K7MLG', 'K7NOR', 'K7NVT', 'K7SMD', 'K7USR', 'K7ZEX', 'KA7MDY',
'KA8VIR', 'KB7FAB', 'KC0NMZ', 'KC8OWL', 'KC8UOK', 'KD2CTJ', 'KD7MMM', 'KE6BXT', 'KE7TE', 'KF7JAF',
'KF7PSM', 'KG6ETI', 'KG7NEP', 'KG7OFF', 'KG7QWH', 'KG7RUS', 'KG7XD', 'KI7EUF', 'KI7ZOI', 'KJ6WCS',
'KJ7ABK', 'KJ7BBA', 'KJ7FKQ', 'KJ7LOO', 'KJ7MHB', 'KJ7OWF', 'KJ7PAR', 'KJ7QMU', 'KJ7QVB', 'KJ7RFN',
'KJ7RNB', 'KJ7WBK', 'KK6DZ', 'KK7BUA', 'KK7COZ', 'KK7DKF', 'KK7DKJ', 'KK7DMT', 'KK7GPH', 'KK7HGW',
'KK7IMD', 'KK7JNR', 'KK7NWE', 'KK7NYE', 'KK7OFT', 'KK7PCE', 'KK7PTU', 'KK7PUJ', 'KK7RMJ', 'KK7UKT',
'KK7UWD', 'KK7VCP', 'KK7VDT', 'KK7VEU', 'KK7WFV', 'KK7YAI', 'KM6VF', 'KM7BPD', 'KN6ZDH', 'KO7CAV',
'KP4UZ', 'KR6RK', 'KT5LA', 'N1RSJ', 'N2NJB', 'N2RGU', 'N2THO', 'N4NJJ', 'N5GOP', 'N6NMB',
'N6XON', 'N6YFN', 'N7BTH', 'N7DWG', 'N7GLF', 'N7HWM', 'N7TNH', 'N7VGK', 'N7VJK', 'N7WDZ',
'N7XO', 'N7ZEV', 'W0ULD', 'W3JMD', 'W6AJB', 'W6GLW', 'W6MW', 'W7DGU', 'W7GPS', 'W7JCK',
'W7KZ', 'W7NVS', 'W7OBW', 'W7SWA', 'W7WDJ', 'W7XM', 'W9AYK', 'W9CSO', 'WA2KXE', 'WA6NGU',
'WA7GIV', 'WA7MD', 'WB6NAH', 'WD6FXK', 'WV3V'
                        ) then 'E'
                    ELSE ' '
    END                            as 'Voting_Status'

              , b.pers_l_nam       as Last_Name
              , CASE
                    WHEN b.pers_pref_nam IS NOT NULL THEN b.pers_f_nam || ' (' || b.pers_pref_nam || ')'
                    ELSE b.pers_f_nam
    END                            as First_Name
              , a.call             as 'Callsign'
              , a.club_rank
              , a.roster           as "Roster Status"

              , '2025-11-24 19:05' as As_of
from v_hcol_export a
         join v_pers b on b.pers_call = a.call
where a.roster = 'Active'
  and a.club_rank in ('Voting Member', 'Officer')
order by b.pers_l_nam
