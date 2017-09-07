#Parsing the xlsx files from to get the loads-------------

library("xlsx")

# rm(list = ls())

startTime <- proc.time()[3]

xlsFiles <-
  list.files(
    path = "IPTO",
    pattern = "xlsx",
    all.files = FALSE,
    full.names = TRUE,
    recursive = FALSE,
    ignore.case = FALSE,
    include.dirs = FALSE,
    no.. = FALSE
  )


size <- length(xlsFiles)
test <- vector()
for (i in 1:size) {
  df <- read.xlsx(xlsFiles[i], sheetIndex = 1, colIndex = (1:5))
  
  test <- rbind(test, df)
}

test <- test[-c(1,2)]
myLoads = test
#myLoads <- test[!test$HOUR == 25, ]
##myLoads =  myLoads[complete.cases(myLoads),]

names(myLoads)[3] <- "Loads"
backUp.Loads = myLoads
rm("test", "df", size, i)




cat("elapsed time in minutes: ", (proc.time()[3] - startTime) / 60)
#elapsed time in minutes:  4.295167