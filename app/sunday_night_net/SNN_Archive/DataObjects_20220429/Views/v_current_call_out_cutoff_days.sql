CREATE VIEW v_current_call_out_cutoff_days AS SELECT num_days as current_num_days
  FROM v_call_out_cutoff_days
 WHERE dat_est = (
                     SELECT max(dat_est) 
                       FROM v_call_out_cutoff_days
                 );

