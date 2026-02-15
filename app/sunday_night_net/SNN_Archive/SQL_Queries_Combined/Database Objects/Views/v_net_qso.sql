DROP VIEW IF EXISTS v_net_qso;
CREATE VIEW v_net_qso as
select pk -- Primary Key from MacLoggerDX table
    ,call -- Call sign
    ,contest_id --String denoting a context (MacLoggerDX term).
                --The software looks for 'HARC-SNN' to see if user
                --   checked in the the HARC SNN
    ,first_name -- First Name
    ,last_name  -- Last Name
    ,qso_start  -- QSO Date and Time
from t_net_qso;

