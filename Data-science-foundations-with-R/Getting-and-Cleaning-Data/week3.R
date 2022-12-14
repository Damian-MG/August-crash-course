
## SUBSETTING AND SORTING

# SUBSETTING
set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X

# Subsetting a column
X[,1]
X[,"var1"]
# Subset of columns and rows at the same time
X[1:2,"var2"]
# Logical subsetting
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]
# Dealing with missing values
X[which(X$var2 > 8),]

# SORTING
sort(X$var1)
sort(X$var1, decreasing = TRUE)
# puts the na at the end
sort(X$var2, na.last = TRUE)
# sort the dataframe by variable
X[order(X$var1),]
X[order(X$var1,X$var3),]

# Ordering with PLYR
install.packages("plyr")
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))

# Adding rows and columns
X$var4 <- rnorm(5)
X
Y <- cbind(X,rnorm(5))
Y


## SUMMARIZING DATA
# Getting data from the web
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "restaurants.csv", method = "curl")
restData <- read.csv("restaurants.csv")
head(restData,n=3)
tail(restData, n=3)
summary(restData)
str(restData)
# quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)
# make a table
table(restData$zipCode,useNA="ifany") # if missing values adds columns
table(restData$councilDistrict,restData$zipCode)
# Check for missing values
sum(is.na(restData$councilDistrict))
# Row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

# Values with specific characteristics
table(restData$zipCode %in% c("21212"))

# CROSS TABS
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

# FLAT TABLES
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data = warpbreaks)
xt
ftable(xt)

# SIZE OF A DATASET
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")

## CREATING NEW VARIABLES
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "restaurants.csv", method = "curl")
restData <- read.csv("restaurants.csv")
# Creating SEQUENCES
s1 <- seq(1,10,by=2) ; s1
s2 <- seq(1,10,length=3) ; s2
x <- c(1,3,8,25,100); seq(along = x)

# Easier cutting
install.packages("Hmisc")
library(Hmisc)

## RESHAPING DATA
install.packages("reshape2")
library(reshape2)
head(mtcars)
# Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars =c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)
# casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# Average values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
# or split
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns

sprCount = lapply(spIns,sum)
sprCount

unlist(sprCount)
sapply(spIns,sum)

# CREATING A NEW VARIABLE
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)

## MANAGING DATA FRAMES WITH DPLYR
install.packages("dplyr")
library(dplyr)

## MERGING DATA
# merging datasets with one column (common name), we tell merge the variable
mergedData = merge(ds1,ds2,by.x="variable",by.y="variable",all=TRUE)
