CREATE VIEW v_potential_callout_roster_size AS
/*
 * v_potential_callout_roster_size
 * --------------------------------
 *
 * Author:  Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  Report on how large the callout roster would be if various lengths of callout days were used.  Checks
 *           on the number of weeks from 1 to 10.
 *
 */
    select 7 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
            and substr(a.net_id, 1, 4) = 'HARC'
            and qso_date > (select date('now','-' || 7 || ' days'))
        order by 1
        )
        
union

select 14 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 14 || ' days'))
        order by 1
        )
                
union

select 21 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 21 || ' days'))
        order by 1
        )
        
union

select 28 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 28 || ' days'))
        order by 1
        )
       
union

select 35 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
            and substr(a.net_id, 1, 4) = 'HARC'
            and qso_date > (select date('now','-' || 35 || ' days'))
        order by 1
        )
        
union

select 42 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 42 || ' days'))
        order by 1
        )
        
union

select 49 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 49 || ' days'))
        order by 1
        )
        
union

select 56 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 56 || ' days'))
        order by 1
        )
        
union

select 63 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 63 || ' days'))
        order by 1
        )
        
union

select 70 as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1)
             and substr(a.net_id, 1, 4) = 'HARC'
             and qso_date > (select date('now','-' || 70 || ' days'))
        order by 1
        )
        
union

select 'All Time'  as Days_since_last_checkin
        ,count(call) as "Potential_number_of_callouts"
from    (
        select distinct call from v_net_qso a
        LEFT JOIN v_pers on trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
        where (pers_typ_cd = 0 or pers_typ_cd = 1) 
             and substr(a.net_id, 1, 4) = 'HARC'
      --     and qso_date > (select date('now','-' || 70 || ' days'))
        order by 1
        );


