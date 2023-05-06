DECLARE @RScript NVARCHAR(MAX) = N'
library(generator)
total_people <- 20
#Email addresses.
People <- as.data.frame(generator::r_full_names(total_people))
names(People) <- c("FullName")
';

EXEC sp_execute_external_script  
	@language = N'R',
	@script = @RScript,
	@output_data_1_name = N'People'
WITH RESULT SETS 
(
	(
		FullName NVARCHAR(255)
	)
);
GO

DECLARE @RScript NVARCHAR(MAX) = N'  
library(generator)
total_people <- 20
#Email addresses.
People <- as.data.frame(generator::r_email_addresses(total_people))
names(People) <- c("EmailAddress")
';

EXEC sp_execute_external_script  
	@language = N'R',
	@script = @RScript,
	@output_data_1_name = N'People'
WITH RESULT SETS 
(
	(
		EmailAddress NVARCHAR(255)
	)
);

