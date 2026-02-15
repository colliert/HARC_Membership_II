# Election Management Subsystem

## Objective
Provide a means of tracking whether someone has voted electronically.  
This becomes important when both electronic and paper ballots are needed. 

The Henderson Amateur Radio Club, Inc., currently 
uses [HamClubOnline](www.hamclubonline.com) and its Electronic Voting feature.

Usually, the electronic voting will be open the week before the actual 
General Election Meeting.  There will be members, who, for wone reason
or another, will not vote on-line, but will want to vote at the scheduled 
General Membership Meeting.

## Procedure
Query **_q_harc_member_voting_status.sql_** is designed to list all members
and show whether they voted electronically or not.

The query works by suplying it a list of all of those who have voted
electronically.  The list of candidates who voted may be obtained 
from HamClubOnline, using the Manage Elections feature.  A table
of those memebers who have voted, along with a separate table of who
has not voted, is listed.  It is a fairly straightforward series of steps
to cut and paste the list of those who have voted, and paste that into
so sort of text editor ([BBedit](www.barebones.com) is used curently).

Edit the call signs in the text editor:
1. Change all tabs (\t) to ',' (quote comma quote).
2. Change all returns (\n) tp ',\n' (quote comma \n quote).
3. The very first callsign will probably need an opening quote.
4. The very last callsign may need a closing quote.

Copy the edited block of callsings into the appropriate 
spot in **_q_harc_member_voting_status.sql_**.

```SQL
select distinct CASE
                    WHEN a.call in (
                    'I N S E R T    C A L L S I G N S    H E R E'                
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

              , '2025-11-20 17:12' as As_of
from v_hcol_export a
         join v_pers b on b.pers_call = a.call
where a.roster = 'Active'
  and a.club_rank in ('Voting Member', 'Officer')
order by b.pers_l_nam
```
A table will be printed of all current club members and their voting 
status.

The program gets the next call sign from the membership list and 
compares that to the list of callsigns that have already voted in the
HamClubOnline Electronic Voting system.  If it finds the membership
callsign in the list, _Voting_Status_ is set to 'E'.

If the person has voted electronically, a letter 'E' will appear'
under the Voting Status column.  Otherwisde the space will be blank.

The list of club members is obtained from HamClubOnine by 
the Python program **_Update_HCOL_and_Tpers.py_**).  It uses a cURL
command to query the current values in HamClubOnline.  HARC has 
decided to use HamClubOnline as the _"System Source"_ or the _"Source of
Truth"_ about HARC memberships.
