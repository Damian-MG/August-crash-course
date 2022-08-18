
## OBTAINING DATA MOTIVATION
# https://data.baltimorecity.gov/

# GOAL OF THE COURSE
# RAW DATA -> PROCESSING SCRIPT -> TIDY DATA -> data analysis -> data communication

# DATA = values of qualitative or quantitative variables, belonging to a set of items
# RAW DATA vs PROCESSED DATA

# COMPONENTS OF TIDY DATA
# each variable in one column
# each different observation in a different row
# one table for each kind of variable
# multiple tables -> include a column that allows them to be linked
# CODE BOOK
# info about the variables (units etc...)
# info about the summary choices made
# info about the experimental study design
# INSTRUCTION LIST (script, no parameters: raw data -> tidy data)

# DOWNLOADING FILES IN R
file.exists("checksifdirectoryexists/directotyname")
dir.create("checksifdirectoryexistsifitdoesnotcreatesit/directotyname")
# download a file from the web
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = 'cameras.csv', method = "curl")
list.files()
dateDownloaded <- date()
dateDownloaded

# READING LOCAL FILES IN R
cameraData <- read.table("cameras.csv") # error
head(cameraData) # error

cameraData <- read.table("cameras.csv", sep = ",", header = TRUE)
head(cameraData)
cameraData <- read.csv("cameras.csv")
head(cameraData)

# READING EXCEL FILES
fielUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl ,destfile = "cameras.xlsx", method = "curl")
dateDownloaded <- date()

install.packages("xlsx")
library(xlsx)
?xlsx
cameraData <- read.xlsx("cameras.xlsx")
head(cameraData)

# READING XML
install.packages("XML")
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
xmlSApply(rootNode, xmlValue)

xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)


# READING JSON
install.packages("jsonlite")
install.packages("curl")
library(jsonlite)
?jsonlite
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)

# THE data.table PACKAGE
# Create data tables just like data frames
install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

tables()
DT[2,]
DT[DT$y=="a",]
DT[c(2,3)]
DT[,c(2,3)]

DT[,list(mean(x),sum(z))]
DT[,table(y)]

# Add new column
DT[,w:=z^2]

# Multiple operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

# Special variables
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

# KEYS
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

# Joins
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)
