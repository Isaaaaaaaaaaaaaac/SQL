1)Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT SUM(CT.POPULATION)
    FROM CITY AS CT
    JOIN COUNTRY AS CY
    ON CT.COUNTRYCODE = CY.CODE
    WHERE CONTINENT = 'Asia';
    
2)Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.


SELECT CT.NAME
    FROM CITY AS CT
    JOIN COUNTRY AS CY
    ON CT.COUNTRYCODE = CY.CODE
    WHERE CONTINENT = 'AFRICA';
    
3)Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
and their respective average city populations (CITY.Population) rounded down to the nearest integer.

SELECT CY.CONTINENT , FLOOR(AVG(CT.POPULATION))
 FROM COUNTRY AS CY
 INNER JOIN CITY AS CT
 ON CY.CODE = CT.COUNTRYCODE
 GROUP BY CY.CONTINENT;
 
4)Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark.
 Ketty doesnt want the NAMES of those students who received a grade lower than 8.
 The report must be in descending order by grade -- i.e. higher grades are entered first.
 If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically.
 Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order.
 If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
 
 SELECT 
CASE WHEN grd.grade < 8 THEN NULL 
WHEN grd.grade >= 8 THEN std.name END,
grd.grade, std.marks FROM students std, grades grd
WHERE std.marks BETWEEN grd.min_mark AND grd.max_mark
ORDER BY grd.grade DESC, std.name ASC;

5)Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
 Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
 If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
 
 SELECT S.hacker_id, name
    FROM SUBMISSIONS AS S
        JOIN HACKERS AS H 
                 ON S.hacker_id = H.hacker_id
        JOIN Challenges AS C
                 ON S.challenge_id = C.challenge_id
        JOIN Difficulty AS D
                 ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score
GROUP BY name, S.hacker_id
HAVING count(S.challenge_id) > 1
ORDER BY count(S.challenge_id) DESC, S.hacker_id

6)Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
 Write a query to print the id, age, coins_needed, and power of the wands that Rons interested in, sorted in order of descending power.
 If more than one wand has same power, sort the result in order of descending age.
 
 SELECT aa.id, bb.age, aa.coins_needed, aa.power
FROM WANDS AS aa
JOIN WANDS_PROPERTY AS bb ON aa.CODE = bb.CODE
JOIN (SELECT age AS AG, MIN(coins_needed) AS MCN, power AS PW
FROM WANDS AS A
JOIN WANDS_PROPERTY AS B ON A.CODE = B.CODE
WHERE IS_EVIL = 0
GROUP BY power, age) AS Q ON bb.age = AG AND aa.coins_needed = MCN AND aa.power = PW
ORDER BY aa.power DESC, bb.age DESC


You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

7)The total score of a hacker is the sum of their maximum scores for all of the challenges.
 Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
 If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of  from your result

SELECT temp1.hacker_id, temp1.name, SUM(temp1.score) AS total_score
FROM
   (SELECT Hackers.hacker_id, Hackers.name, Submissions.challenge_id, MAX(score) AS score
    FROM Hackers INNER JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
    GROUP BY Hackers.name, Hackers.hacker_id, Submissions.challenge_id) AS temp1
WHERE temp1.hacker_id NOT IN
   (SELECT Hackers.hacker_id
    FROM Hackers INNER JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
    GROUP BY Hackers.hacker_id
    HAVING SUM(Submissions.score) = 0)
GROUP BY temp1.hacker_id, temp1.name
ORDER BY total_score DESC, temp1.hacker_id ASC;