update qso_table_v007
set qso_start=(julianday(datetime('2021-07-05 16:33:54'))-2440587.5)*86400,
set qso_end=(julianday(datetime('2019-07-14 16:33:54'))-2440587.5)*86400,
set mode='FM',
set band_rx= '70 cm',
set band_tx = '70 cm',
set rx_frequency  = 447.925,
set tx_frequency = 442.925,
set power = 15
where datetime(qso_start,'unixepoch') between '2019-07-14' and '2019-07-15';