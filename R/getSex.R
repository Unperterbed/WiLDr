#' Get Sex Function
#'
#' This function returns a factored dataframe with the Sex of each participant
#' @param RawDataSet The name of your raw data set that contains the desired items.
#' @keywords Sex, Gender, Male, Female
#' @export
#' @examples
#' getSex()


getSex <- function(RawDataSet){
  #Quits if the RawDataSet isn't a dataframe
  stopifnot(class(RawDataSet)=="data.frame")

  #Builds the tempDF
  tempDF <- data.frame(row.names = 1:nrow(RawDataSet))
  tempDF["Sex"] <- RawDataSet$PROF201
  tempDF$Sex <- factor(tempDF$Sex,
                       levels=c(1,2),
                       labels = c("Male", "Female"))

  #Outputs the results
  getSex <- tempDF
}
