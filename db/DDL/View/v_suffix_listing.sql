CREATE VIEW v_suffix_listing AS /*
* v_suffix_listing
* ----------------
* Author:  Tim Collier
* DateL    May 4, 2024
*
* Purpose:  List callsign suffix in alphabetic order.  Helps net control operators 
*           look up call signs by the suffix.
*/
select distinct a.call           
,ifnull(b.pers_pref_nam, b.pers_f_nam) as First_Name
,b.pers_l_nam as Last_Name
 , case cast(substr(a.call, 2, 1) as integer)
     when 0 then substr(a.call, 4, length(a.call))
     else substr(a.call, 3, length(a.call))
     end as "Suffix"
      from v_net_qso a
inner join v_pers b on a.call = b.pers_call
order by 4;


