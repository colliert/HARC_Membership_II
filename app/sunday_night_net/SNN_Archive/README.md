# Sunday Night Net
### Database to support HARC Sunday Night Net
### Author:  Tim Collier
### Date:  April 29, 2022

The purpose of the database is to keep track of who has checked into the Sunday Night Net each week.  A callsign will be added to the call out roster if the station has checked in at least one time during a specific timeframe.  The length of the timeframe can be changed. 

Information is based on MacLoggerDX (Dog Park Software - [https://dogparksoftware.com]()) which uses a SQLite database.

Keeping the main MacLoggerDX table (`qso_table_v007`) intact, additional tables and views were added to the SQLite structure to facilitate the recording of Net Check-ins as well as the generation of the Roster for the Net. 

While the system is currently in SQLite, an attempt has been made to keep the DDL and other SQL  “standard”.  This is to allow the system to be ported to another relational database for others to use.

Consistent with past coding practice, each table (t_) has a corresponding view (v_). For the most part, the information necessary to properly run the Sunday Night Net is contained in `v_pers` and `v_net_qso`.


There is no fancy Graphical User Interface (GUI) in use for this system; everything is sql-driven.  The Roster output is copied to an MS Excel spreadsheet for subsequent printing.













