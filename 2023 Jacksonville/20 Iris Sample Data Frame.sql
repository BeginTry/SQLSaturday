EXEC sp_execute_external_script 
	@language = N'R',
	@script = N'
OutputDataSet <- iris'
WITH RESULT SETS (
	(  
		[Sepal.Length] NUMERIC(10,1), 
		[Sepal.Width] NUMERIC(10,1), 
		[Petal.Length] NUMERIC(10,1), 
		[Petal.Width] NUMERIC(10,1), 
		[Species] VARCHAR(128)
	)
)


