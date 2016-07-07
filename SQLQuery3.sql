--Care este intervalul orar cu cei mai multi utilizatori ai parcarii (cand sunt cele mai multe masini)
-- Varianta cu interval orar pe zi impartit in 3 zone (dimineata, pranz, seara)
SELECT V.MasinaID,
CASE
	WHEN DATEPART(HOUR,V.DataSosire)<=11 THEN 'Dimineata'
	WHEN DATEPART(HOUR,V.DataSosire)>11 AND DATEPART(HOUR,V.DataSosire)<=17 THEN 'Pranz'
	ELSE  'Seara' END AS [Interval Orar]
INTO #Temp1
FROM Masini AS M,Vizite AS V
WHERE M.ID=V.MasinaID

SELECT T1.[Interval Orar],COUNT(v.MasinaID) AS [Numar masini]
INTO #Temp2
FROM #Temp1 AS T1,Vizite AS V
WHERE V.MasinaID=T1.MasinaID
GROUP BY T1.[Interval Orar]

SELECT T2.[Interval Orar],MAX(T2.[Numar Masini]) AS [Masini Maxim]
FROM #Temp2 AS T2
WHERE T2.[Numar masini]=(SELECT MAX(T2.[Numar masini])
						FROM #Temp2 AS T2)
GROUP BY T2.[Interval Orar]


--Varianta cu interval orar impartit pe ore
DROP TABLE #Temp1
DROP TABLE #Temp2
DROP TABLE #Temp3
DROP TABLE #Temp4
DROP TABLE #Temp5
DROP TABLE #Temp6
SELECT V.MasinaID,
CASE
	WHEN DATEPART(HOUR,V.DataSosire)<1 THEN '00:00:00-00:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<2 THEN '01:00:00-01:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<3 THEN '02:00:00-02:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<4 THEN '03:00:00-03:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<5 THEN '04:00:00-04:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<6 THEN '05:00:00-05:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<7 THEN '06:00:00-06:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<8 THEN '07:00:00-07:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<9 THEN '08:00:00-08:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<10 THEN '09:00:00-09:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<11 THEN '10:00:00-10:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<12 THEN '11:00:00-11:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<13 THEN '12:00:00-12:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<14 THEN '13:00:00-13:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<15 THEN '14:00:00-14:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<16 THEN '15:00:00-15:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<17 THEN '16:00:00-16:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<18 THEN '17:00:00-17:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<19 THEN '18:00:00-18:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<20 THEN '19:00:00-19:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<21 THEN '20:00:00-20:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<22 THEN '21:00:00-21:59:59'
	WHEN DATEPART(HOUR,V.DataSosire)<23 THEN '22:00:00-22:59:59'
	ELSE '23:00:00-23:59:59' 
END AS [Interval Orar]
INTO #Temp3
FROM Masini AS M,Vizite AS V
WHERE M.ID=V.MasinaID

SELECT T3.[Interval Orar],COUNT(V.MasinaID) AS [Numar masini]
INTO #Temp4
FROM #Temp3 AS T3,Vizite AS V
WHERE V.MasinaID=T3.MasinaID
GROUP BY T3.[Interval Orar]

SELECT T4.[Interval Orar],MAX(T4.[Numar masini]) AS [Numar Maxim Masini]
FROM #Temp4 AS T4
WHERE T4.[Numar masini]= (SELECT MAX(T4.[Numar masini])
							FROM #Temp4 AS T4)
GROUP BY T4.[Interval Orar]


-- Care este a fost cea mai aglomerata zi din an in ceea ce priveste parcarea
SELECT  DATEPART(DAY,V.DataSosire) AS Ziua,COUNT(V.MasinaID) AS [Numar Masini]
INTO #Temp5
FROM Vizite AS V
GROUP BY DATEPART(DAY,V.DataSosire)

SELECT T5.Ziua,MAX(T5.[Numar Masini]) AS [Numar Maxim Masini]
FROM #Temp5 AS T5
WHERE T5.[Numar Masini]= (SELECT MAX(T5.[Numar masini]) FROM #Temp5 AS T5)
GROUP BY T5.Ziua


--- Care este cel mai fidel client (cine utilizeaza cel mai mult parcarea)
SELECT M.Numar AS [Numar inmatriculare],V.Durata
FROM Masini AS M,Vizite AS V
WHERE M.ID=V.MasinaID AND V.Durata=(SELECT MAX(V.Durata) FROM Vizite AS V)

--- Care este este intervalul mediu petrecut de clienti in parcare  (cat stationeaza in parcare in medie un utilizator al parcarii)

SELECT AVG(V.Durata) AS [Timp mediu (minute)]
FROM Vizite AS V

--- Care este cea mai plina zi din saptamana (L, M, M)
SELECT DATENAME(DW,V.DataSosire) AS Ziua,COUNT(V.MasinaID) AS [Numar Masini]
INTO #Temp6
FROM Vizite AS V
GROUP BY DATENAME(DW,V.DataSosire)

SELECT T6.Ziua,MAX(T6.[Numar Masini]) AS [Numar Maxim Masini]
FROM #Temp6 AS T6
WHERE T6.[Numar Masini]= (SELECT MAX(T6.[Numar masini]) FROM #Temp6 AS T6)
GROUP BY T6.Ziua
