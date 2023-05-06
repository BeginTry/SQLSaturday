DROP TABLE IF EXISTS tempdb.guest.ImaginaryPeople;
CREATE TABLE tempdb.guest.ImaginaryPeople(
	name VARCHAR(255),
	phone VARCHAR(32),
	DOB DATE,
	email VARCHAR(255),
	SSN VARCHAR(16),
	job VARCHAR(255),
	company VARCHAR(255)
)

--Run BCP to load table from file.

SELECT *
FROM tempdb.guest.ImaginaryPeople


TRUNCATE TABLE tempdb.guest.ImaginaryPeople;
INSERT INTO tempdb.guest.ImaginaryPeople
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N'  
csvFile <- read.csv(file = "C:\\Users\\Dave\\Documents\\SQL Server - Misc\\SQL Sat\\My Presentations\\Jacksonville 2023-05-06\\ImaginaryPeople.csv", 
                    sep = ",", 
                    header = TRUE,
                    numerals = "no.loss")
csvFile$phone <- as.character(csvFile$phone)',
 @output_data_1_name = N'csvFile';

SELECT *
FROM tempdb.guest.ImaginaryPeople

