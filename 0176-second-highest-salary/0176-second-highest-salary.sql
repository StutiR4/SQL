/* Write your T-SQL query statement below */

WITH CTE
AS(
SELECT ID,
       SALARY,
       DENSE_RANK() OVER(ORDER BY Salary DESC) AS Rank
FROM Employee
)
SELECT IIF(COUNT(Salary) = 0, NULL, MAX(Salary)) AS SecondHighestSalary
FROM CTE
WHERE Rank = 2