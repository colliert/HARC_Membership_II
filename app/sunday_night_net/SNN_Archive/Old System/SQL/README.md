# HARC Sunday Night Net

### HARC Sunday Night Net Check-in info

### Author: Tim Collier

The purpose of the database is to keep track of who has checked into the Sunday Night Net each week.  Based on an arbitrary cutoff time, a roster for the call out will be generated if the station has checked in at least one time during that time frame.
 
Information is based on MacLoggerDX (DogParkSoftware.com) which uses a SQLite database.

The base table is qso_table_v007.  This Table is used by the _MacLoggerDX_ logging program to store its information.

Consistent with past coding practice, each table (_t__) has a corresponding view (_v__).  For the most part, the information necessary to properly run the Sunday Night Net is contained in _v_pers_ and _v_net_qso_.

Other tables have been added to that schema.