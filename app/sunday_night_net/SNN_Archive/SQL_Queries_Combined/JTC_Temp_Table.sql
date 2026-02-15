--
-- File generated with SQLiteStudio v3.2.1 on Sat Apr 18 15:16:13 2020
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: JTC_Temp_Table
DROP TABLE IF EXISTS JTC_Temp_Table;
CREATE TABLE "JTC_Temp_Table" (
	"Callsign"	TEXT NOT NULL,
	"First_Name"	TEXT NOT NULL,
	"Last_Name"	TEXT,
	"qso_date"	TEXT
);