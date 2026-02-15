/**********************************************************************
 q_membership_maintenance
 ------------------------

 Author:  Tim Collier
 Date:  July 12, 2021

 Purpose:  Identify HARC Members who need their information
 updated in t_pers.  Table t_pers contains information about operators
 who have checked into the Sunday Night Net.  In addition to their call
 signs, names, and license class, is an indication of whether the operator
 is a HARC member (pers_typ=1 for members, pers_typ=0 for non-members).  There
 are other indicators, as well (pers_typ = 2 is a member but the call sign is an old one,
 pers_typ = 3 is a member with no call sign -- an associate member).

 Daylite_HARC_Mem is a table generated from the Daylite system.  It contains
 the call_sign, first and last name of the members.  It is imported from
 a CSV file (tab delimited) that contains the most recent listing of member
 information.

 If a member from daylite_harc_mem cannot be found in t_pers, and, therefore,
 must be added, their  pers_typ is set to 999.
 **********************************************************************/

-- First find all members from daylite_harc_mem who do not appear at
-- all in t_pers.  These are members who have not been added
-- to t_pers.  Give them a pers_typ of 999
select '01 - Add new member' as action_needed
     , call_sign
     , first_name
     , last_name
     , 999                   as pers_typ
from daylite_harc_mem
where call_sign not in (select v_pers.pers_call from v_pers)
union
-- Next select all members (from daylite_harc_mem) who appear in
-- t_pers as non-members.  Display their call, names, and pers_typ code.
select '02 - Change from non-member to member' as action_needed
     , call_sign
     , first_name
     , last_name
     , t_pers.pers_typ
from daylite_harc_mem
         join t_pers on call_sign = t_pers.pers_call
where pers_typ = 0
union
-- Next find all HARC members from t_pers who do not appear at
-- all in Daylite_HARC_Mem. but who do appear in t_pers.
-- They used to be members but are no longer members.
-- List the pers_typ
select '03 - Change from member to non-member' as action_needed
     , v_pers.pers_call
     , v_pers.pers_f_nam
     , v_pers.pers_l_nam
     , v_pers.pers_typ
from v_pers
where pers_typ = 1
  and v_pers.pers_call not in
      (select Daylite_HARC_Mem.call_sign from Daylite_HARC_Mem where Daylite_HARC_Mem.call_sign is not null)
Union
-- Find all call signs in the log file that have not been accounted for in the
-- t_pers file.  This is to keep track of callsigns, suffixes, and nicknames.
select distinct '04 - Add non-member' as action_needed
     , call
     , first_name
     , last_name
     , 0                   as pers_typ
from v_net_qso
where call not in (select v_pers.pers_call from v_pers)
