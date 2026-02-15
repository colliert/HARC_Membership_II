/*q_harc_election_members_who_voted.sql
  *
  * Author:  Tim Collier
  * Date:  November 17, 2025
  *
  * Purpose:  List the members who voted in the electronic HARC election
  *
  *           Using HamClubOnline, navigate to Manage Elections, and select the appropriate election.
  *           There will be a listing of those callsigns who have registered votes ("Have Voted").  Copy that list
  *           and edit it to include single quotes around each callsign and then create a list of those
  *           callsigns separated by commas.  Paste that list into the WHERE clause below.
*/
select a.pers_call                  as 'Callsign'
     , CASE
           WHEN a.pers_pref_nam IS NOT NULL THEN a.pers_f_nam || ' (' || a.pers_pref_nam || ')'
           ELSE a.pers_f_nam
    END                             as first_name
     , pers_l_nam                   as last_name
     , datetime('now', 'localtime') as As_of
from v_pers a
where a.pers_call in
      (
       'AI6HU', 'AI7OK', 'K3JRJ', 'K4BL', 'K7JTC', 'K7KSG', 'K7LPK', 'K7NOR', 'K7NVT', 'K7SMD',
       'KA7MDY', 'KA8VIR', 'KB7FAB', 'KC8UOK', 'KD7MMM', 'KE7TE', 'KF7JAF', 'KF7PSM', 'KG6ETI', 'KG7QWH',
       'KG7RUS', 'KG7XD', 'KI7EUF', 'KI7ZOI', 'KJ6WCS', 'KJ7ABK', 'KJ7BBA', 'KJ7FKQ', 'KJ7QVB', 'KJ7RNB',
       'KJ7WBK', 'KK6DZ', 'KK7BUA', 'KK7HGW', 'KK7JNR', 'KK7NWE', 'KK7OFT', 'KK7PTU', 'KK7PUJ', 'KK7RMJ',
       'KK7UKT', 'KK7UWD', 'KK7VCP', 'KK7VDT', 'KK7WFV', 'KK7YAI', 'KM7BPD', 'KO7CAV', 'KT5LA', 'N1RSJ',
       'N2NJB', 'N2THO', 'N4NJJ', 'N5GOP', 'N6YFN', 'N7BTH', 'N7GLF', 'N7HWM', 'N7VJK', 'N7WDZ',
       'N7ZEV', 'W3JMD', 'W6MW', 'W7DGU', 'W7GPS', 'W7JCK', 'W7KZ', 'W7NVS', 'W7OBW', 'W7SWA',
       'W7WDJ', 'W7XM', 'W9AYK', 'W9CSO', 'WA2KXE', 'WA6NGU', 'WA7MD', 'WB6NAH', 'WD6FXK', 'WV3V'
          )
order by a.pers_l_nam