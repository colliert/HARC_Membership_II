/*
t_call_out_cutoff_days.sql
==========================
Author: J. Timothy Collier
Created: 2/15/26
Last Updated: 2/15/26
==========================
Purpose:  The Club was trying to keep the number of call-outs each week to a number
          such that there could be 10 minutes of QSTs, followed by a number of
          callouts that would have the Sunday Night Net conclude before 8PM, at
          which time, the HARC Tek-Net would start.  That number was less than or equal
          to 100 call-outs,
          To fairly limit the number of callouts, we changed the length of time since
          a participant's last checkin.  If a participant had checked in at least
          one time during that period of time (usually either 3 or 4 weeks) their name
          would appear on that week's callout list.
          If we wanted to have fewer callouts (keep it less than or equal to 100)
          we would pick 4 weeks.  If we could include more members, we would change
          the length of time to four weeks.
          The length of time is expressed in days (4 weeks = 28 days).

*/

create table t_call_out_cutoff_days
(
    dat_est  TEXT    not null
        primary key,
    num_days INTEGER not null
)
    without rowid;


