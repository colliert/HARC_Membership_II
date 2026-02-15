CREATE VIEW "v_check-ins_for_web_display" AS /*
* v_checkins_for_website
* ----------------------
*
* Author:  Tim Collier
*   Date:  September 20, 2024
*
* Purpose: Create a list of checkins for the Sunday Night Net.  This list will
*          be used by the webmaster to populate a table on the website showing
*          who has checked in.  The list should be members, only , and show
*          the checkins for the current quarter of the current year.
*/

   SELECT a.call                                 AS 'Callsign'
       ,ifnull(b.pers_pref_nam, b.pers_f_nam) AS 'First_Name'
       ,a.l_nam                               AS 'Last_Name'
       ,a.qso_date                            AS 'Checkin_Date(UTC)'
  FROM v_net_qso a
       JOIN v_pers b ON a.call = b.pers_call
 WHERE b.pers_typ_cd = 1                                       -- HARC members 
   AND trunc(((strftime('%m', a.qso_date) -1 )/3))+1 =         -- Yearly Quarter of check-in date
       trunc(((strftime('%m', date('now')) -1 )/3))+1          -- Yearly Quarter of todays date
   AND strftime('%Y',a.qso_date) = strftime('%Y', date('now')) -- The same year
 ORDER BY 3,2,4;


