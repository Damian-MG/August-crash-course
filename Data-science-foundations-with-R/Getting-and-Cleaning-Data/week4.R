
## EDITING TEXT VARIABLES

# Fixing character vectors

# tolower(), toupper()
cameraData <- read.csv("cameras.csv")
names(cameraData)
tolower(names(cameraData))

# strsplit()
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

# LISTS
mylist <- list(letters = c("A","b","c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

# sapply()

# sub()
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

# Finding values grep() grepl()
grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
grep("Alameda",cameraData$intersection,value=TRUE)

# More useful string functions
install.packages("stringr")
library(stringr)
nchar("Damian Maleno")
substr("Damian Maleno",1,7)
paste("Damian","Maleno")
paste0("Damian","Maleno")
str_trim("Damian      ")


## REGULAR EXPRESSIONS

# Metacharacters 1
# start of a line: ^i think, will match the line "i think i am pretty"
# end of a line: morning$, will match the line "they had something this morning"
# set of characters to match: [Bb][Uu][Ss][Hh], will match the line "BBQ and bushwalking"
# Example of combination:
# ^[Ii] am
# ^[0-9][a-zA-Z]
# [^?.]$ -> any line not ending in period or question mark

# Metacharacters 2
# . refers to any character: 9.11 -> "9-11","9/11","123.169.114.66"
# | (or): flood|fire|hurricane|coldfire -> "not a whole lot of hurricanes in the Artic"
# ^[Gg]ood | [Bb]ad -> starting with good or containing bad
# ^([Gg]ood | [Bb]ad) -> starting with good or bad
# ? = the indicated expression is optional
# \ means the following is a special character
# [Gg]eorge( [WW]\.)? [Bb]ush
# * = repeat any character, including none
# + = repeat any character, at least one oh them
# (.*) -> between parenthesis any string of characters including none
# {and} = interval of quantifiers -> [Bb]ush( +[^ ]+ +){1,5} debate
# = Bush followed by at least one space, followed by at least something that s not a space, followed by at least another space (all of that between 1 and 5 times)
# \Number -> reffers to a previous expression
# +([a-zA-Z]+) +\1 + -> "night night twitter!" or "blah blah blah blah"
# * is greedy matches the longest possible string
# ^s(.*)s -> "sitting at starbucks" or "setting up mysql and rails"
# greediness can be turned of with ?
# ^s(.*?)s$


## WORKING WITH DATES
d1 = date()
d1
class(d1)
d2 = Sys.Date()
d2
class(d2)

# FORMATING DATES
format(d2, "%a %b %d")

# Creating dates
x = c("1jan1960","2jan1960"); z = as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1]-z[2])

weekdays(d2)
months(d2)
julian(d2)

install.packages("lubridate")
library(lubridate); ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz="Pacific/Auckland")
?Sys.timezone

# DATA RESOURCES

