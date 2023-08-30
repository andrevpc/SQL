USE [Exercises]
GO


INSERT INTO [Departments]
VALUES
	('100AA', 'Super A'),
	('100BB', 'Super B')

INSERT INTO [Employees]
	(FirstName, MiddleName, LastName, BirthDay, CPF, RG, Address, CEP, City, PhoneNumber, CodeDepartment, Wage)
VALUES
	('Thiago', 'Sla', 'da Silva', '01-01-2000', '12345678910', '12345678910', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100AA', 5000)

INSERT INTO [Employees]
	(FirstName, LastName, BirthDay, CPF, RG, Address, CEP, City, PhoneNumber, CodeDepartment, Wage)
VALUES
	('Thiago', '2', '01-01-2000', '12345678911', '12345678911', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100AA', 5000),
	('Thigas', '2', '01-01-2000', '12345678915', '12345678915', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100BB', 10000)


INSERT INTO [Employees]
	(FirstName, BirthDay, CPF, RG, Address, CEP, City, PhoneNumber, CodeDepartment, Wage)
VALUES
	('Thiago', '01-01-2000', '12345678912', '12345678912', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100AA', 5000),
	('Thiago4', '01-01-2000', '12345678913', '12345678913', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100AA', 1500),
	('aaa', '01-01-2000', '12345678914', '12345678914', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100AA', 1500),
	('Deletado', '01-01-2000', '12345678916', '12345678916', 'Nemsei, 2100', '80045900', 'Curitiba', '5541912341234', '100AA', 1500)