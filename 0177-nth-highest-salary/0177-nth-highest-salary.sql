CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
DECLARE @Result INT;
WITH CTE AS
        (
            SELECT ID,
                   Salary,
                   DENSE_RANK() OVER(ORDER BY Salary DESC) AS Rank
            FROM Employee 
        )
        SELECT @Result = IIF(COUNT(Salary)=0,NULL,MAX(Salary))
        FROM CTE
        WHERE Rank = @N
RETURN @Result
END