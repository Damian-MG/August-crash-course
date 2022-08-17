##Calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors.
##Given a vector monitor ID numbers,
##'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument 
##and returns the mean of the pollutant across all of the monitors,
## ignoring any missing values coded as NA.


setwd("/home/damien/August-crash-course/Data-science-foundations-with-R")

pollutantmean <- function(directory, pollutant, id = 1:332) {
        count <- 0
        sum <- 0
        for (i in id) {
                nr <- str_pad(i, 3, pad="0")
                monitor <- read.csv(paste(directory, "/", nr, ".csv", sep=""))
                data <- monitor[pollutant]
                
                count <- count + colSums(!is.na(data))
                sum <- sum + colSums(data, na.rm=T)
        }
        sum/count
}
