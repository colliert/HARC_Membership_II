select distinct call as "Call"
    ,first_name as "First Name"
    ,last_name as "Last Name"
    ,case cast(substr(call,2,1) as integer)
        when 0 then substr(call,4,length(call))
        else substr(call,3,length(call))
    end as "Suffix"
from v_qso_table_v007
order by 4

