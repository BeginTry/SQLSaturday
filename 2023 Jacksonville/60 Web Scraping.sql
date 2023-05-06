EXEC sp_execute_external_script 
	@language = N'R',
	@script = N'library(RCurl)
library(XML)
url <- "https://www.basketball-reference.com/teams/BOS/2017.html"
html = RCurl::getURL(url);
tables <- XML::readHTMLTable(html, header = TRUE, as.data.frame = TRUE, stringsAsFactors = FALSE);
OutputDataSet <- tables[[1]]';

EXEC sp_execute_external_script 
	@language = N'R',
	@script = N'library(RCurl)
library(XML)
url <- "https://www.basketball-reference.com/teams/BOS/2017.html"
html = RCurl::getURL(url);
tables <- XML::readHTMLTable(html, header = TRUE, as.data.frame = TRUE, stringsAsFactors = FALSE);
OutputDataSet <- tables[[1]]'
WITH RESULT SETS (
 (
	JerseyNumber VARCHAR(4),
	PlayerName VARCHAR(128),
	Position VARCHAR(4),
	Height VARCHAR(8),
	Weight SMALLINT,
	BirthDate DATE,
	[Nationality?] VARCHAR(32),
	YearsExperience VARCHAR(2),
	College VARCHAR(128)
 )
);

--Save to table, if desired.
USE tempdb;
GO

DROP TABLE IF EXISTS #Roster;

CREATE TABLE #Roster (
	JerseyNumber VARCHAR(4),
	PlayerName VARCHAR(128),
	Position VARCHAR(4),
	Height VARCHAR(8),
	Weight SMALLINT,
	BirthDate DATE,
	Nationality VARCHAR(32),
	YearsExperience VARCHAR(2),
	College VARCHAR(128)
);

INSERT INTO #Roster
EXEC sp_execute_external_script 
	@language = N'R',
	@script = N'library(RCurl)
library(XML)
url <- "https://www.basketball-reference.com/teams/BOS/2017.html"
html = RCurl::getURL(url);
tables <- XML::readHTMLTable(html, header = TRUE, as.data.frame = TRUE, stringsAsFactors = FALSE);
OutputDataSet <- tables[[1]]';

SELECT *
FROM #Roster;

/***************************************************************/


/***************************************************************/

EXEC JustElectrons.dbo.SelectFromWebPage
	@Url = 'https://www.basketball-reference.com/teams/BOS/2017.html'