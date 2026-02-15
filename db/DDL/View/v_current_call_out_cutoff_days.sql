 /*
 * v_current_call_out_cutoff_days
 * ------------------------------
 *
 * Author:  Tim Collier
 * Date:  November 15, 2024
 *
 * Purpose:  Show the current number of cutoff days (must have checked in within the
            number of cutoff days to appear on the callout roster).
 */
CREATE VIEW v_current_call_out_cutoff_days AS
     SELECT num_days AS current_num_days
      FROM v_call_out_cutoff_days
     WHERE dat_est = (
                         SELECT max(dat_est) 
                           FROM v_call_out_cutoff_days
                     );


