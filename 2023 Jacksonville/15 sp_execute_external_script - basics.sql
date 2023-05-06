USE [AdventureWorks];

EXEC sp_execute_external_script 
	@language = N'R',
	@script = N'InputDataSet$NewVacationHours <- InputDataSet$VacationHours + 8;
OutputDataSet <- InputDataSet',
	@input_data_1 = N'SELECT [BusinessEntityID], [NationalIDNumber], [VacationHours]
FROM [HumanResources].[Employee]',
	@output_data_1_name = N'OutputDataSet'
--WITH RESULT SETS (
--	(
--		BusinessEntityID INT, 
--		NationalIDNumber NVARCHAR(30), 
--		VacationHours SMALLINT,
--		NewVacationHours SMALLINT
--	)
--)