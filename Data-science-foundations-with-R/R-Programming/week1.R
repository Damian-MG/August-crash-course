x <- 2
print(x)
x
msg <- "hello"
msg
x <- 1:20
x

## DATA TYPES

# VECTOR objects
# c stands for concatenate
x <- c(0.5,0.6)
x
x <- c(TRUE,FALSE)
x <- c(T,F)
x <- c("a","b","c")
x <- 9:29
x
x <- c(1+0i, 2+4i)
# Or using the vector function
x <- vector("numeric", length = 10)
x

# If we mix types it creates it through coercion (converting a type)
y <- c(1.7, "a")
y
# converting number to string
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
x <- c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)

# LISTS
x <- list(1, "a", TRUE, 1+4i)
x

# MATRICES (vectors with dimensions)
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

m <- matrix(1:6,nrow = 2, ncol = 3)
m

m <- 1:10
m
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

# FACTORS
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)

x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))

# MISSING VALUES (NA or NaN)
x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)

x <- c(1, 2, NaN, NA, 3)
is.na(x)
is.nan(x)

# DATA FRAMES
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)

# NAMES ATTRIBUTES
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a","b"), c("c","d"))
m


## READING DATA

# READING TABULAR DATA
# read.table, read.csv, readLines, source, dget, load, unserialize
data <- read.table("foo.txt")

# READING LARGE TABLES
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes)

# TEXTUAL DATA FORMATS
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y,file = "y.R")
new.y <- dget("y.R")
new.y

# CONNECTIONS: INTERFACES TO THE OUTSIDE WORLD
str(file)

con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)

con <- gzfile("words.gz")
x <- readLines(con, 10)

con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)


## SUBSETTING 

# SUBSETTING - BASICS
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]

# SUBSETTING LISTS
x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]

x$bar
x[["bar"]]
x["bar"]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]
x$name # element name does not exist
x$foo

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]

# SUBSETTING MATRICES
x <- matrix(1:6, 2, 3)
x[1, 2]
x[2, 1]
x[1, ]
x[, 2]

x[1, 2, drop = FALSE]
x[1, , drop = FALSE]

# SUBSETTING PARCIAL MATCHING
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]

# SUBSETTING REMOVING MISSING VALUES
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
bad
x[!bad]

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

## VECTORIZED OPERATIONS
x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
y == 8
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y # Element-wise multiplication
x / y
x %*% y # True matrix multiplication
