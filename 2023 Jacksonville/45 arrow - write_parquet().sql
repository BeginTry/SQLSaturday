DECLARE @Query NVARCHAR(MAX) = N'SELECT  
	InvoiceID, CustomerID, BillToCustomerID, OrderID, DeliveryMethodID, ContactPersonID, AccountsPersonID
	, SalespersonPersonID, PackedByPersonID, InvoiceDate, CustomerPurchaseOrderNumber, IsCreditNote
	, CreditNoteReason, Comments, DeliveryInstructions, InternalComments, TotalDryItems, TotalChillerItems
	, DeliveryRun, RunPosition, ReturnedDeliveryData
	, CAST(ConfirmedDeliveryTime AS DATETIME) ConfirmedDeliveryTime
	, ConfirmedReceivedBy, LastEditedBy
	, CAST(LastEditedWhen AS DATETIME) LastEditedWhen
FROM WideWorldImporters.Sales.Invoices';

--Create parquet file from query.
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
library(arrow)
write_parquet(x = InputDataSet, 
	sink = "C:\\Users\\Dave\\Documents\\SQL Server - Misc\\SQL Sat\\My Presentations\\Jacksonville 2023-05-06\\WideWorldImporters.Sales.Invoices.parquet")
',
	@input_data_1 = @Query;

--Create csv file from query.
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
write.csv(x = InputDataSet, 
	file = "C:\\Users\\Dave\\Documents\\SQL Server - Misc\\SQL Sat\\My Presentations\\Jacksonville 2023-05-06\\WideWorldImporters.Sales.Invoices.csv")
',
	@input_data_1 = @Query;


--Read data from parquet file.
EXEC sp_execute_external_script  
	@language = N'R',
	@script = N' 
library(arrow)
x<-read_parquet(file = "C:\\Users\\Dave\\Documents\\SQL Server - Misc\\SQL Sat\\My Presentations\\Jacksonville 2023-05-06\\WideWorldImporters.Sales.Invoices.parquet")
',
	@output_data_1_name = N'x';
