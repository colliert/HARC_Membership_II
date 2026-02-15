/*
* t_call_out_cutoff_days
* ----------------------
*
* Author:  Tim Collier
* Date:  November 15, 2024
*
* Purpose:  Store a history of cutoff days.  Cutoff days represent the number of days in the past an operator
*           must have checked in to be included on the roster.  For example, if the cutoff days is 28 days, the
*           operator must have checked in at least one time during the past 28 days in order to be included
*           on the existing callout roster.
*/
create table t_call_out_cutoff_days
(
    dat_est  TEXT    not null
        primary key,
    num_days INTEGER not null
)
    without rowid;


