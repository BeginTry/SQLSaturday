library(RCurl)
library(XML)

#Pull html from web page.
url <- "https://www.basketball-reference.com/teams/BOS/2017.html"
html = RCurl::getURL(url);

#Pull html from web page saved locally to disk.
#url <- "C:\\Users\\Dave\\Documents\\SQL Server - Misc\\SQL Sat\\My Presentations\\Jacksonville 2023-05-06\\2016-17 Boston Celtics Roster and Stats.htm"
#html <- readr::read_file(url)

tables <- XML::readHTMLTable(html, header = TRUE,
                             as.data.frame = TRUE,
                             stringsAsFactors = FALSE);
length(tables)
names(tables[[1]])
tables[1]
tables[2]
tables[3]
tables[4]
tables[5]
tables[6]
tables[7]



#Pull html from web page.
url <- "https://www.basketball-reference.com/teams/BOS/2023.html"
html = RCurl::getURL(url);

#Pull html from web page saved locally to disk.
#url <- "C:\\Users\\Dave\\Documents\\SQL Server - Misc\\SQL Sat\\My Presentations\\Jacksonville 2023-05-06\\2022-23 Boston Celtics Roster and Stats.htm"
#html <- readr::read_file(url)