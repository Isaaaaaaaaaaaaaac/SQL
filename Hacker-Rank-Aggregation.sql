1)Query a count of the number of cities in CITY having a Population larger than 100,000.

SELECT COUNT(*)
    FROM CITY
    WHERE POPULATION >100000;
    
2)Query the total population of all cities in CITY where District is California

SELECT SUM(POPULATION)
    FROM CITY
    WHERE DISTRICT = 'CALIFORNIA';
    
3)Query the average population of all cities in CITY where District is California.

SELECT AVG(POPULATION)
    FROM CITY
    WHERE DISTRICT = 'CALIFORNIA';
    
4)Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT FLOOR(AVG(POPULATION))
    FROM CITY
;

5)Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(POPULATION)
    FROM CITY
    WHERE COUNTRYCODE ='JPN';
    
6)Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(POPULATION) - MIN(POPULATION)
        FROM CITY;
        
7)Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboards 0 key was broken until after completing the calculation.
 She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
 
 SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, '0', '')))
			FROM employees;
            
8)We define an employees total earnings to be their monthly  worked,
 and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
 Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
 
  SELECT MAX(salary*months), COUNT(*) 
   FROM Employee
    WHERE (salary * months) >= (select MAX(salary * months) from employee);
    
9)Query the following two values from the STATION table:

1 The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2 The sum of all values in LONG_W rounded to a scale of 2 decimal places.


SELECT ROUND(SUM(LAT_N),2),
       ROUND(SUM(LONG_W),2)
    FROM STATION;
    
10)Query the sum of Northern Latitudes (LAT_N) from STATION having values greater  than 38.7880 and less than  137.2345.
 Truncate your answer to 4 decimal places.
 
 SELECT ROUND(SUM(LAT_N),4)
    FROM STATION
    WHERE LAT_N BETWEEN 38.7880 AND 137.2345;
    
11)Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 . 
Truncate your answer to 4 decimal places

 SELECT ROUND(MAX(LAT_N),4)
    FROM STATION
    WHERE LAT_N < 137.2345;
    
12)Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 .
 Round your answer to 4 decimal places
 
 SELECT ROUND(LONG_W, 4) 
FROM STATION 
WHERE LAT_N < 137.2345 
ORDER BY LAT_N DESC 
LIMIT 1;

13)Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880. 
Round your answer to 4 decimal places.

SELECT ROUND(MIN(LAT_N),4)
    FROM STATION
    WHERE LAT_N > 38.7780
   ;
   
14)Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880 . 
Round your answer to 4 decimal places.

SELECT ROUND(LONG_W,4)
    FROM STATION
    WHERE LAT_N > 38.7880
    ORDER BY LAT_N ASC
    LIMIT 1
    ;
    
15)Consider  and  to be two points on a 2D plane.

 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.


SELECT ROUND((MAX(LAT_N) - MIN(LAT_N) + MAX(LONG_W) - MIN(LONG_W)), 4) AS D
FROM STATION;

16)Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.


SELECT ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N),2) + POW(MAX(LONG_W)-MIN(LONG_W),2)), 4)
FROM station;

17)A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

Select round(St.LAT_N,4) mediam
from station St 
where (select count(Lat_N) 
       from station where
       Lat_N < St.LAT_N ) = (select count(Lat_N)
                             from station where Lat_N > St.LAT_N)