CREATE VIEW v_net_qso
  ( QSO_Key
   , call
   , net_id
   , f_nam
   , l_nam
   , qso_date
   , qso_time )
 AS
 /*
  * v_net_qso
  * ---------
  *
  * Author:  Tim Collier
  * Date:  November 15, 2024
  *
  * Purpose:  Provide a view into table t_net_qso.  This should be considered the QSO listing of record.  Future
  *           implementations of the system will use t_net_qso which captures the Sunday Night Net QSO information.
  *
  */
    SELECT
    QSO_Key
   , call
   , net_id
   , f_nam
   , l_nam
   , qso_date
   , qso_time
 FROM
    t_net_qso;


