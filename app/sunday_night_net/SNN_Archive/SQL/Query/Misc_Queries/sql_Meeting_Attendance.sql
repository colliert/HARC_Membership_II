SELECT call as 'Call Sign'
       ,first_name as 'First Name'
       ,last_name as 'Last Name'
       ,contest_id AS 'Meeting'
       ,date(qso_start, 'unixepoch') AS 'Meeting Date'
        FROM v_qso_table_v007
 WHERE contest_id = "HARC-GENMEM" AND 
       date(qso_start, 'unixepoch') > '2020-06-24'
 ORDER BY last_name;
