#' Get Age Function
#'
#' This function returns a  dataframe with the Age (in years) of each participant
#' @param RawDataSet The name of your raw data set that contains the desired items.
#' @keywords Age, Years, WiLD
#' @export
#' @importFrom lubridate today
#' @examples
#' getAge()


getAge <- function(RawDataSet){
  #Quits if the RawDataSet isn't a dataframe
  stopifnot(class(RawDataSet)=="data.frame")

  #builds tempDf
  tempDF <- data.frame(row.names = 1:nrow(RawDataSet))

  #loads values
  tempDF <- data.frame("Age"=round((as.integer(lubridate::today())-
                                   as.integer(as.Date(paste(Raw.Data[,"PROF202"], "/1/1", sep=""))))/365, 2))

  #Outputs results
  getAge <- tempDF
}
