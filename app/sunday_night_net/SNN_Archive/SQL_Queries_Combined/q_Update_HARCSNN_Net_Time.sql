/**********************************************************
* HARC_SNN_QSO_LIST.sql                                   *
* ----------------------                                  *
* Date:  July 16, 2019                                    *
* Author:  Tim Collier                                    *
*                                                         *
* Set the qso_start to the actual net time.               *
*                                                         *
* UNIXepoch date = ([Julian Date] - 2440587.5 ) * 86400   *
*                                                         *
* Usually, the roll call starts at 19:15 Local time       *
* 19:15 PDT = 0200 UTC, 19:15 PST = 0300 UTC              *
**********************************************************/
update qso_table_v007
set
	 qso_start =  (julianday('2021-08-16 T02:08:00') -2440587.5) * 86400
	,qso_done =   (julianday('2021-08-16 T02:40:00') -2440587.5) * 86400
    ,tx_frequency=444.925
    ,rx_frequency=449.925
    ,band_rx='70cm'
	,band_tx='70cm'
	,mode='FM'
	,power=50
   ,contest_id='HARC-SNN'
--  ,my_rig='Yaesu FT-991'
--where datetime(qso_start,'unixepoch') between '2019-07-21' and '2019-07-21';
 where pk between 6109 and 6164;


