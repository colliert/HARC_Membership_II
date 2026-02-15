/*
----------------------------------------------------------------------------
    Query:  q_potential_call_roster_size
    ------------------------------------
    
    Author:    Tim Collier
    Date:      April 3, 2023
    
    Purpose:  Show what the call roster would be given various cutoff dates
----------------------------------------------------------------------------    
*/

select 7 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
            and substr(a.contest_id, 1, 4) = 'HARC'
            and date(qso_start,'unixepoch') >= (select date('now','-' || 7 || ' days'))
        order by 1
        )
        
union

select 14 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 14 || ' days'))
        order by 1
        )
                
union

select 21 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 21 || ' days'))
        order by 1
        )
        
union

select 28 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 28 || ' days'))
        order by 1
        )
       
union

select 35 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
            and substr(a.contest_id, 1, 4) = 'HARC'
            and date(qso_start,'unixepoch') >= (select date('now','-' || 35 || ' days'))
        order by 1
        )
        
union

select 42 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 42 || ' days'))
        order by 1
        )
        
union

select 49 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 49 || ' days'))
        order by 1
        )
        
union

select 56 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 56 || ' days'))
        order by 1
        )
        
union

select 63 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') > (select date('now','-' || 63 || ' days'))
        order by 1
        )
        
union

select 70 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1)
             and substr(a.contest_id, 1, 4) = 'HARC'
             and date(qso_start,'unixepoch') >= (select date('now','-' || 70 || ' days'))
        order by 1
        )
        
union

select 'All Time'  as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ = 0 or pers_typ = 1) 
             and substr(a.contest_id, 1, 4) = 'HARC'
      --     and date(qso_start,'unixepoch') >= (select date('now','-' || 70 || ' days'))
        order by 1
        )