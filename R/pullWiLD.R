#' pullWiLD Function
#'
#' This function returns data from the specified tools in the WiLD Toolkit.
#' @param RawData A dataframe of the raw data
#' @param tools A character vector of tool acronyms (e.g., LUPI, CAPI, GGD)
#' @keywords WiLD, Toolkit, data, subset
#' @export
#' @examples
#' ##Returns CAPI and LUPI Data
#' pullWiLD(RawData, c("LUPI", "CAPI"))
#'
#' ##Returns Goals Going Deeper
#' pullWiLD(RawData, "GGD")

pullWiLD <- function(RawData, tools){
  #Stops the function if there's no dataframe
  stopifnot(class(RawData)=="data.frame")

  #Stops the function if tools <1
  stopifnot(length(tools)>0)

  #Creates the temporary dataFrame to work with
  tempDF <- data.frame(row.names = nrow(RawData))

  #Stores the column names into CNames vector
  CNames <- colnames(RawData)

  for (i in 1:length(tools)){ #loops through each entry in tools

    #get the number of characters for this entry of 'tools'
    n <- nchar(tools[i])

    #Create of list of column names whose prefix matches the tools entry
    SubCNames <- CNames[substr(CNames,0,n)==tools[i]]

    #Adds the SubCNames columns to tempDF
    tempDF <- data.frame(tempDF,RawData[SubCNames], row.names = NULL)
  }

  #Output tempDF and close the function
  return(tempDF)
}
