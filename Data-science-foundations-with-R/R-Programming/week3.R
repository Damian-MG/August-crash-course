
## LOOP FUNCTIONS

# LAPPLY
# Loop over a list and evaluate a function on each element
# always returns a list
x <- list(a = 1:5, b = rnorm(10))
x
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
x
lapply(x, mean)

x <- 1:4
lapply(x, runif)
lapply(x, runif, min=0, max=10)

#LAPPLY and friends make heavy use of anonymous functions
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[,1])

#SAPPLY will try to simplify the result of lapply if possible
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean)


# APPLY
# is used to evaluate a function over the margins of an array
str(apply)
x <- matrix(rnorm(200), 20, 10)
x
apply(x, 2, mean)
apply(x, 1, sum)

# For sums and means of matrix dimensions, we hace shortcuts
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)


# MAPPLY
# multivariate apply of sorts which applies a function in parallel over a set of arguments
str(mapply)

# The followinf is tedious to type
# list (rep(1,4), rep(2,3), rep(3,2), rep(4,1))
# Instead we do
mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {
        rnorm(n, mean, sd)
}
noise(5,1,2)
noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)


# TAPPLY
# is used to apply a function over subsets of a vector
str(tapply)
# take group means
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)


# SPLIT
# takes a vector or other objects and splits into groups determined by a factor (or a list of factors)
str(split)

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

lapply(split(x,f), mean)

# to split a dataframe
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
s
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

# splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)

str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))


## DEBUGGING TOOLS

# DIAGNOSING THE PROBLEM
log(-1)

# BASIC TOOLS
# clean rm(list = ls())
rm(list = ls())
# Traceback, debug, browser, trace, recover
# Traceback
mean(x)
traceback()
lm(y - x)
traceback()

# Debug
debug(lm)
lm(y - x)

# Recover
options(error = recover)
read.csv("filenotexisting")
