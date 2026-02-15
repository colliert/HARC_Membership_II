/* NetLogger Contact Layout (CSV format) is:
Date,
Time,
Callsign,
Frequency,
Mode,
Band,
DXCC,
His_RST,
My_RST,
Name,
City,
State,
County,
Grid,
QSL_S,
QSL_R,
Remarks,
Address,
Net Name,
Operator,
QSL Info,
QSL Message
*/
Select strftime('%Y/%m/%d',a.qso_start,'unixepoch') as "date"
 ,strftime('%H:%M:%S',a.qso_start,'unixepoch') as "time"
    ,a.call as "Callsign"
    ,a.rx_frequency as "Frequency"
    ,a.mode as "Mode"
    ,a.band_rx  as "Band"
    ,a.dxcc_id as "DXCC"
    ,' ' as "Hist_RST"
    ,' ' as "My_RST"
    ,b.pers_pref_nam as "App_netlogger_Preferred Name"
    ,a.first_name || ' ' || a.last_name as "Name"
    ,a. city as "city"
    ,a.state as "State"
    ,a.county as "County"
    ,a.grid as "Grid"
    ,' ' as "QSL_S"
    ,' ' as "QSL_R"
    ,' ' as "Remarks"
    ,a.street as "Address"
    ,'HARC Sunday Night Net' as "Net_Name"
    ,a.my_call as "Operator"
    ,' ' as "QSL_Info"
    ,' ' as "QSL Message"
from qso_table_v008 a
join v_pers b on b.pers_call = a.call
order by a.qso_start,a.call
limit 25000
