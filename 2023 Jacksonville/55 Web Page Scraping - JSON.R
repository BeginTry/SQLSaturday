library(RCurl)
library(XML)
library(jsonlite)

#type.convert - sets appropriate class for each data frame variable/column.
TypeConvertDataFrameList <- function(lsDataFrame) {
  lapply(lsDataFrame, type.convert, as.is = TRUE)
}

url <- "https://www.basketball-reference.com/teams/BOS/2017.html"
html = RCurl::getURL(url)

dfHtmlTableData <- XML::readHTMLTable(html, header = TRUE,
                                      as.data.frame = TRUE,
                                      stringsAsFactors = FALSE)
#remove null elements from list.
dfHtmlTableData <- dfHtmlTableData[!sapply(dfHtmlTableData, is.null)]

#convert data frame variables to appropriate classes.
dfHtmlTableData <- lapply(dfHtmlTableData, TypeConvertDataFrameList)

dfTables <- data.frame(url = rep(c(url), each = length(dfHtmlTableData)))

#Empty vector for JSON string data.
jsonStringsFactor <- rep(c(""), each = length(dfHtmlTableData))

if (length(dfHtmlTableData) > 0) {
  #Convert each HTML table to JSON.
  for (i in 1:length(dfHtmlTableData)) {
    jsonStringsFactor[i] <- jsonlite::toJSON(
      as.data.frame(dfHtmlTableData[[i]]), auto_unbox = TRUE)
  }
}

dfTables$HtmlTableAsJson <- jsonStringsFactor
dfTables