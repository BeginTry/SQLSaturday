--\arrow - AzureStor\00 Azure Access Keys.png
--\arrow - AzureStor\01 ADLSGen2 files.png



/****************************************************************************************
	Read a csv file from Azure Data Lake
****************************************************************************************/
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
library(AzureStor)
dataLakeEndpoint <- storage_endpoint("https://mystorage.blob.core.windows.net", 
	key="hAsWXQPOYWpTHVdeq273L8JvhuPmnYDRNBCuvQ5YqUj4PYpLjN")
cont <- storage_container(dataLakeEndpoint, "testing-davem")
x<-storage_read_csv(container = cont, file = "my-files/iris.csv")
',
	@output_data_1_name = N'x';

--\arrow - AzureStor\02 storage_read_csv() iris.csv



/****************************************************************************************
	Read a parquet file from Azure Data Lake
****************************************************************************************/

EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
library(AzureStor)
library(arrow)
dataLakeEndpoint <- storage_endpoint("https://mystorage.blob.core.windows.net", 
	key="hAsWXQPOYWpTHVdeq273L8JvhuPmnYDRNBCuvQ5YqUj4PYpLjN")
cont <- storage_container(dataLakeEndpoint, "testing-davem")
rawVector <- storage_download(cont, src="my-files/mtcars.parquet", dest=NULL)
x<-read_parquet(rawVector)
',
	@output_data_1_name = N'x';

--\arrow - AzureStor\03 read_parquet mtcars.parquet.png



/****************************************************************************************
	Write files to Azure Data Lake
****************************************************************************************/
--#Write csv file to Data Lake 
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
#Write to Data Lake
library(AzureStor)
dataLakeEndpoint <- storage_endpoint("https://mystorage.blob.core.windows.net", 
	key="hAsWXQPOYWpTHVdeq273L8JvhuPmnYDRNBCuvQ5YqUj4PYpLjN")
cont <- storage_container(dataLakeEndpoint, "testing-davem")

newFile <- tempfile(fileext = ".csv")
write.csv(advWorks, newFile)
storage_upload(cont, src = newFile, dest = "my-files/advWorks.csv")

if (file.exists(newFile)) {
	file.remove(newFile)
}
',
	@input_data_1 = N'
SELECT p.BusinessEntityID, p.FirstName, p.MiddleName, p.LastName, pp.PhoneNumber
FROM AdventureWorks.Person.Person p
JOIN AdventureWorks.Person.PersonPhone pp
	ON pp.BusinessEntityID = p.BusinessEntityID',
	@input_data_1_name = N'advWorks';
GO

--#Write parquet file to Data Lake
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
#Write to Data Lake
library(AzureStor)
library(arrow)
dataLakeEndpoint <- storage_endpoint("https://mystorage.blob.core.windows.net", 
	key="hAsWXQPOYWpTHVdeq273L8JvhuPmnYDRNBCuvQ5YqUj4PYpLjN")
cont <- storage_container(dataLakeEndpoint, "testing-davem")

newFile <- tempfile(fileext = ".parquet")
write_parquet(advWorks,	newFile)
storage_upload(cont, src = newFile, dest = "my-files/advWorks.parquet")

if (file.exists(newFile)) {
	file.remove(newFile)
}
',
	@input_data_1 = N'
SELECT p.BusinessEntityID, p.FirstName, p.MiddleName, p.LastName, pp.PhoneNumber
FROM AdventureWorks.Person.Person p
JOIN AdventureWorks.Person.PersonPhone pp
	ON pp.BusinessEntityID = p.BusinessEntityID',
	@input_data_1_name = N'advWorks';
GO

--\arrow - AzureStor\04 ADLSGen2 new files.png