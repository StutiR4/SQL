/* Write your T-SQL query statement below */

SELECT DISTINCT P.FirstName,
                P.LastName,
                A.City,
                A.State
FROM Person P
LEFT JOIN Address A
    ON P.PersonID = A.PersonID