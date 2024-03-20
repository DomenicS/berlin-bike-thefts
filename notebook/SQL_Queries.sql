USE berlin_accident;

SELECT *
FROM bike_thefts bt;

SELECT *
FROM bike_thefts
WHERE YEAR(ANGELEGT_AM) = 2023;

SELECT bt.LOR, PLR_NAME, Bezirk, SUM(SCHADENSHOEHE) AS SUM_Schadenshoehe, AVG(SCHADENSHOEHE) AS AVG_Schadenshoehe, COUNT(DELIKT) AS COUNT_Delikte, MIN(bp.total_population) AS total_population, ROUND((COUNT(DELIKT) / MIN(bp.total_population)) * 1000,0) AS pro1000Personen

FROM bike_thefts bt
LEFT JOIN berlin_population_2023 bp ON bp.lor = bt.LOR
WHERE YEAR(ANGELEGT_AM) = 2023
GROUP BY bt.LOR, PLR_NAME, Bezirk
ORDER BY SUM_Schadenshoehe DESC;

SELECT * 
FROM berlin_population_2023 pop;


