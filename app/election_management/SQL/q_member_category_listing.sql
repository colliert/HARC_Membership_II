select a.mem_num as Member_Number
     , a.roster as Roster_Status
     , a.mem_typ as Member_Type
     , a.f_nam as First_Name
     , a.l_nam  as Last_Name
     , coalesce(nullif(a.call, ''), '(none)') as 'Call'
,club_rank
from v_hcol_export a
where substr(call, 1, 1) not in ('A', 'K', 'N', 'W')
  and club_rank in ('Voting Member', 'Officer')
  and roster = 'Active'

select  a.mem_num as Member_Number
     , a.roster as Roster_Status
     , a.mem_typ as Member_Type
     , a.f_nam as First_Name
     , a.l_nam  as Last_Name
     , coalesce(nullif(a.call, ''), '(none)') as 'Call'
,club_rank
from v_hcol_export a
where roster_status = 'Deceased (SK)'

