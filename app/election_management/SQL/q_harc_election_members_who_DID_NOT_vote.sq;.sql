/*q_harc_election_members_who_DID_NOT_vote.sql
  *
  * Author:  Tim Collier
  * Date:  November 17, 2025
  *
  * Purpose:  List the members who did not vote in the electronic HARC election
  *
  *           Using HamClubOnline, navigate to Manage Elections, and select the appropriate election.
  *           There will be a listing of those callsigns who have registered votes ("Have NOT Voted").  Copy that list
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
       'AB7M', 'AB8TN', 'AD7J', 'AI7KM', 'AI7XG',
       'AJ6CU', 'AJ7DF', 'AK6RM', 'AK7I', 'AK7LV', 'K0EJO', 'K2STC', 'K4HD',
       'K5GRA', 'K6MIB', 'K7DGF', 'K7EMG', 'K7HOT', 'K7KWF', 'K7LLG', 'K7MLG',
       'K7OFO', 'K7USR', 'K7ZEX', 'KA6CPR', 'KA7AFG', 'KB3S', 'KB6CMO', 'KB6JET',
       'KB7HTA', 'KB7TII', 'KB8GYQ', 'KC0NMZ', 'KC6WYD', 'KC7EO', 'KC7RVK', 'KC8OWL',
       'KC9WTF', 'KD2CTJ', 'KD6BWI', 'KD6CWI', 'KD7BNP', 'KD7YMO', 'KE6BXT', 'KE7VXZ',
       'KF4KF', 'KF7GRP', 'KG0Q', 'KG7HKH', 'KG7NEP', 'KG7OFF', 'KG7UYS', 'KI7LKB',
       'KI7VLP', 'KJ7ABN', 'KJ7ANM', 'KJ7CZI', 'KJ7ETZ', 'KJ7FKR', 'KJ7IYC', 'KJ7KJV',
       'KJ7LOO', 'KJ7MFI', 'KJ7MHB', 'KJ7MNE', 'KJ7MNF', 'KJ7OEN', 'KJ7OWF', 'KJ7PAR',
       'KJ7QMU', 'KJ7RFN', 'KJ7SBK', 'KJ7UCS', 'KJ7WGH', 'KK6AKH', 'KK7BUD', 'KK7COZ',
       'KK7CTC', 'KK7DKC', 'KK7DKF', 'KK7DKJ', 'KK7DMT', 'KK7EXK', 'KK7FYO', 'KK7GPH',
       'KK7HGX', 'KK7HIA', 'KK7HQP', 'KK7HSC', 'KK7IMD', 'KK7NLM', 'KK7NML', 'KK7NST',
       'KK7NUF', 'KK7NYE', 'KK7OSA', 'KK7OUG', 'KK7PCE', 'KK7PDC', 'KK7QEA', 'KK7UKS',
       'KK7ULH', 'KK7ULI', 'KK7VET', 'KK7VEU', 'KK7VRI', 'KK7VWR', 'KK7WGI', 'KK7YJF',
       'KK7YLD', 'KK7YQS', 'KM4QBA', 'KM6LEE', 'KM6VF', 'KM7BUE', 'KM7MLH', 'KN6QIX',
       'KN6SYA', 'KN6ZDH', 'KO6FJT', 'KO6HUQ', 'KP4UZ', 'KR6RK', 'N0EKO', 'N0GIH',
       'N0GSP', 'N0URB', 'N2CLN', 'N2DKI', 'N2JNR', 'N2RGU', 'N3JU', 'N6NMB',
       'N6SFX', 'N6XON', 'N6YKE', 'N7DWG', 'N7JPG', 'N7TGS', 'N7TNH', 'N7UPX',
       'N7VGK', 'N7XO', 'N8HC', 'N9BAT', 'NQ7RD', 'W0ULD', 'W1EVN', 'W1HJW',
       'W3QQQ', 'W6AJB', 'W6CAH', 'W6GLW', 'W6PSY', 'W7EHB', 'W7IVK', 'W7UVO',
       'W8FRT', 'WA7GIV', 'WB1CQW', 'WN7CTS', 'WS7R'
          )
order by a.pers_l_nam