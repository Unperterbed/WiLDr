#' Profile Personality Function
#'
#' This function returns a dataframe with the personality scores for each participant
#' @param RawDataSet The name of your raw data set that contains the desired items.
#' @keywords Personality, Big Five, Profile, IPIP
#' @export
#' @examples
#' profPersonality()


profPersonality <- function(RawDataSet){
  #Quits if the RawDataSet isn't a dataframe
  stopifnot(class(RawDataSet)=="data.frame")

  #Builds the tempDF
  tempDF <- data.frame(row.names = 1:nrow(RawDataSet))

  #Builds the outDF (which will be the function output)
  outDF <- data.frame(row.names = 1:nrow(RawDataSet))

  #List of needed variables
  ls <- c("PROF814", "PROF824", "PROF834",
          "PROF844", "PROF849", "PROF854",
          "PROF839", "PROF829", "PROF819",
          "PROF783", "PROF820", "PROF830",
          "PROF840", "PROF850", "PROF855",
          "PROF845", "PROF835", "PROF825",
          "PROF815", "PROF816", "PROF826",
          "PROF856", "PROF851", "PROF846",
          "PROF841", "PROF836", "PROF831",
          "PROF821", "PROF785", "PROF782",
          "PROF818", "PROF828", "PROF838",
          "PROF848", "PROF853", "PROF843",
          "PROF833", "PROF823", "PROF813",
          "PROF786", "PROF822", "PROF832",
          "PROF842", "PROF847", "PROF852",
          "PROF857", "PROF837", "PROF827",
          "PROF817", "PROF784")

  #Stores those variables in tempDf
  tempDF <- RawDataSet[,ls]

  #Items to reverse code
  rc <- c("PROF831", "PROF833", "PROF835",
          "PROF836", "PROF837", "PROF839",
          "PROF841", "PROF843", "PROF845",
          "PROF846", "PROF851", "PROF853",
          "PROF856", "PROF783", "PROF785",
          "PROF813", "PROF815", "PROF817",
          "PROF819", "PROF821", "PROF823",
          "PROF825", "PROF827", "PROF829")

  #Reverse scores those items
  for (i in 1:length(rc)){
    tempDF[rc[i]] <- 6 - tempDF[rc[i]]
  }

  #Create vectors and matrix of factor-level items
  lsAgree <- c("PROF814", "PROF824", "PROF834", "PROF844", "PROF849", "PROF854", "PROF839", "PROF829", "PROF819", "PROF783")
  lsConsc <-  c("PROF784", "PROF820", "PROF830", "PROF840", "PROF850", "PROF855", "PROF845", "PROF835", "PROF825","PROF815")
  lsEmoSta <-  c("PROF816", "PROF826", "PROF856", "PROF851", "PROF846", "PROF841", "PROF836", "PROF831", "PROF821","PROF785")
  lsExtra <-  c("PROF782", "PROF818", "PROF828", "PROF838", "PROF848", "PROF853", "PROF843", "PROF833", "PROF823","PROF813")
  lsIntell <-  c("PROF786", "PROF822", "PROF832", "PROF842", "PROF847", "PROF852", "PROF857", "PROF837", "PROF827","PROF817")
  pMat <- cbind("Ageeableness"=lsAgree,
                "Conscientiousness"=lsConsc,
                "Emotional Stability"=lsEmoSta,
                "Extraversion"=lsExtra,
                "Intelligence"=lsIntell)

  #Create new columns with mean values
  for (i in 1:ncol(pMat)){
    outDF[colnames(pMat)[i]] <- rowMeans(tempDF[,pMat[,i]])
  }
  profPersonality <- outDF
}
