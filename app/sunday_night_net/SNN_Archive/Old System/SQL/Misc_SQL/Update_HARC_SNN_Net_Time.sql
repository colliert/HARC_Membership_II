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
**********************************************************/
update qso_table_v007
set
	 qso_start =  (julianday('2022-02-14 T02:15:00') -2440587.5) * 86400
	,qso_done =   (julianday('2022-02-14 T02:50:00') -2440587.5) * 86400
          ,tx_frequency=442.925
          ,rx_frequency=447.925
          ,band_rx='70cm'
	,band_tx='70cm'
	,mode='FM'
	,power=15
          ,contest_id='HARC-SNN'
--where datetime(qso_start,'unixepoch') between '2019-07-21' and '2019-07-21';
where pk between 7584 and 7642;
