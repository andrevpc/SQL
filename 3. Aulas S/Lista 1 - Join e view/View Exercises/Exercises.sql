USE [Exercises]
GO

/* Ex. 1 */
SELECT [ID], [FirstName], [MiddleName], [Wage]
FROM Employees

/* Ex. 2 */
SELECT *
FROM Employees
ORDER BY [City], [CodeDepartment]

/* Ex. 3 */
SELECT [FirstName], [MiddleName], [Wage], [CodeDepartment]
FROM Employees
WHERE Wage > 3000
ORDER BY [FirstName] + [MiddleName] ASC

/* Ex. 4 */
SELECT [BirthDay], [FirstName]
FROM Employees
ORDER BY [BirthDay] DESC

/* Ex. 5 */
SELECT [FirstName] + ' ' + [MiddleName] + ' ' + [LastName], [PhoneNumber], [City]
FROM Employees
ORDER BY [FirstName] + [MiddleName] + [LastName]

/* Ex. 06 */ 
CREATE VIEW [Payroll] AS
SELECT SUM([Wage]) AS [Payroll]
FROM [dbo].[Employees]
GO

SELECT * FROM [Payroll]
GO

/* Ex. 07 */
CREATE VIEW [Employees names and cod] AS
SELECT
	ltrim(
		coalesce(' ' + FirstName, '') +
		coalesce(' ' + MiddleName, '') +
        coalesce(' ' + LastName, '')
    ) as FullName,
	CodeDepartment AS Code
FROM [dbo].[Employees]
GO

SELECT * FROM [Employees names and cod]
GO

/* Ex. 08 */
CREATE VIEW [Employees wage less than 2000] AS
SELECT
	TOP 100 PERCENT 
	ltrim(
		coalesce(' ' + FirstName, '') +
		coalesce(' ' + MiddleName, '') +
        coalesce(' ' + LastName, '')
    ) as FullName,
		Wage,
		CodeDepartment AS Code
FROM [dbo].[Employees]
WHERE Wage < 2000
ORDER BY FullName
GO

SELECT * FROM [Employees wage less than 2000]
GO

/* Ex. 09 */
CREATE VIEW [Payroll by Department] AS
SELECT d.Code, Sum(Wage) AS Payroll
FROM [dbo].[Departments] AS d
JOIN [dbo].[Employees] AS e
	ON d.Code = e.CodeDepartment
GROUP BY d.Code
GO

SELECT * FROM [Payroll by Department]
GO

/* Ex. 10 */
CREATE VIEW [Departments with more than 1 employee] AS
SELECT * FROM
	(
		SELECT d.Code, Count(*) AS TotalEmployees
		FROM [dbo].[Departments] AS d
		JOIN [dbo].[Employees] AS e
			ON d.Code = e.CodeDepartment
		GROUP BY d.Code
	) AS Result
WHERE TotalEmployees > 1
GO

SELECT * FROM [Departments with more than 1 employee]
GO

/* Ex. 11 */
CREATE VIEW [Total employees] AS
SELECT COUNT(*) AS Total
FROM [dbo].[Employees]
GO

SELECT * FROM [Total employees]
GO

/* Ex. 12 */
CREATE VIEW [Avarage Wage] AS
SELECT AVG(Wage) AS AvarageWage
FROM [dbo].[Employees]
GO

SELECT * FROM [Avarage Wage]
GO

/* Ex. 13 */
CREATE VIEW [Lower Wage by Department] AS
SELECT
	d.Code,
	MIN(Wage) AS LowerWage
FROM [dbo].[Departments] AS d
JOIN [dbo].[Employees] AS e
	ON d.Code = e.CodeDepartment
GROUP BY d.Code
GO

SELECT * FROM [Lower Wage by Department]
GO

/* Ex. 14 */
CREATE VIEW [All employees without middle name] AS
SELECT 
	ltrim(
		coalesce(' ' + FirstName, '') +
        coalesce(' ' + LastName, '')
    ) as FullName
FROM [dbo].[Employees]
WHERE MiddleName IS NULL
GO

SELECT * FROM [All employees without middle name]
GO

/* Ex. 15 */
CREATE TRIGGER Delete_Employee_Trigger
ON [dbo].[Employees]
AFTER INSERT, UPDATE
AS
DECLARE
	@wage DECIMAL = (select i.Wage from inserted i),
	@id BIGINT = (select i.ID from inserted i)
BEGIN
	IF (@wage < 2100)
		DELETE FROM [dbo].[Employees]
		WHERE ID = @id
END