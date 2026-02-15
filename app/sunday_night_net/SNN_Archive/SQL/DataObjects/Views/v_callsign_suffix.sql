CREATE VIEW v_callsign_suffix AS select distinct call as "Call"
    ,first_name as "First_Name"
    ,last_name as "Last_Name"
    ,case cast(substr(call,2,1) as integer)
        when 0 then substr(call,4,length(call))
        else substr(call,3,length(call))
    end as "Suffix"
from v_net_qso
order by 4;

