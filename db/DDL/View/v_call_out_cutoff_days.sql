CREATE VIEW v_call_out_cutoff_days(dat_est, num_days) AS
    /*
    * v_call_out_cutoff_days
    * ----------------------
    *
    * Author  Tim Collier
    * Date: November 15, 2024
    *
    * Purpose:  Report on what the number of cutoff days has been over time.
    */
    SELECT
    dat_est
   , num_days
 FROM 
    t_call_out_cutoff_days;


