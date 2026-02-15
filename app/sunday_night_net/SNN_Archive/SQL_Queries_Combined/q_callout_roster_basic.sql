SELECT DISTINCT a.call                                                                 AS Callsign,
                CASE
                    WHEN v_pers.pers_call IS NULL THEN a.f_nam
                    ELSE ifnull(v_pers.pers_pref_nam, v_pers.pers_f_nam) END           AS [First Name],
                v_pers.pers_l_nam                                                      AS [Last Name],
                CASE WHEN v_pers.pers_typ_cd = '1' THEN 'member' ELSE 'non-member' END AS Member,
                '                                                                    ' AS Comments,
                (SELECT current_num_days
                 FROM v_current_call_out_cutoff_days)
                                                                                       AS Cutoff_Days
FROM v_net_qso a
         LEFT JOIN
     v_pers ON trim(upper(a.Call)) = trim(upper(v_pers.pers_call))
/* * Select those records that show a contest id beginning with HARC-SNN (Sunday Night Net)
* as well as those that are within the required number of days (probably 28 days).
* There may be some special cases where a call sign is always included */
/* Selection Criteria
------------------
pers_typ - 0 or 1 (non-member or member, excludes duplicate callsign informatoin
contest_id must contain 'HARC' (usually it will be HARC-SNN)
qso_start date must be within the call_out_cutoff_days (v_current_call_out_cutoff_days)
callsign (call) does not appear in the Silent Key List
callsign (call) does appear in the mandatory call list */
WHERE (pers_typ_cd = 0 OR
       pers_typ_cd = 1) AND
      substr(a.net_id, 1, 4) = 'HARC' AND
      a.qso_date > (SELECT date('now', '-' ||
                                       (SELECT current_num_days
                                        FROM v_current_call_out_cutoff_days)
          || ' days'))
    AND
      a.call NOT IN (
                      'WB6MIE'/* Tony Dinkel */
                    , 'WB6AMT'/* Earl Lizardi */
                    , 'W7DVU'/* Doug Smith */
          )/* Silent Key List, comma separated */
   OR a.call IN (
                  'N6YFN'/* Lawrence Roney Net Control Operator */
                , 'K7JTC'/* Tim Collier Net Control Operator */
                , 'KF7JAF'/* Dave Le Blanc Net Control Operator */
                , 'KD7YMO'/* Gerry Grabo Net Control Operator */
                , 'KF4KF'/* Karol Frodsham Net Control Operator */
                , 'KG7XD'/* Gene McAvoy Net Control Operator */
                , 'N7WDZ'/* Gene Heiter New Call Sign. */
                , 'K7ZEX'/* Tony Fetcho Net Control Operator */
                 )-- insert comma-separated call signs that will always appear in call-out list
ORDER BY 4,
         3,
         2