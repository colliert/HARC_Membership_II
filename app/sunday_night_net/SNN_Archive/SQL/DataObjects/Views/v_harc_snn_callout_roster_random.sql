CREATE VIEW v_harc_snn_callout_roster_random AS select callsign
    ,"first name"
    ,"last name"
    ,member
    ,comments
from (select random()
            ,callsign
            ,"first name"
            ,"last name"
            ,member
            ,comments
from (select * from v_harc_snn_callout_roster)
order by 5,1);

