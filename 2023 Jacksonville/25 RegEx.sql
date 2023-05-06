USE WideWorldImporters;

EXEC sp_execute_external_script 
	@language = N'R',
	@script = N'OutputDataSet <- InputDataSet[!grepl("^[[:alnum:].-_]+@[[:alnum:].-]+$", InputDataSet), ];',
	@input_data_1 = N'SELECT PersonID, FULLName, EmailAddress FROM Application.People'
WITH RESULT SETS (
	(
		[PersonID] INT, 
		[FullName] NVARCHAR(50), 
		[EmailAddress] NVARCHAR(256)
	)
)