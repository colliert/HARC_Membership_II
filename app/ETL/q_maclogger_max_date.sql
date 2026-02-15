/*
* q_maclogger_max_date.sql
* ------------------------
*
* Author:  Tim Collier
* Date:    October 5, 2025
*
* Purppose:  Find the maximum QSO_Stqrt date in qso_table_v008 and print out all who have that date.  This
*            is used to be sure the log file has been properly synchronized before starting processing.
*/
SELECT pk
     ,date(qso_start,'unixepoch') as qso_date
     ,call
     ,first_name
     ,last_name
FROM qso_table_v008
WHERE date(qso_start,'unixepoch') =
      (
        SELECT MAX(date(qso_start,'unixepoch'))
        FROM qso_table_v008
      );