## CONTROL STRUCTURES

# CONROL STRUCTURES - IF-ELSE
if(x > 3) {
  y <- 10
} else  {
  y <- 0
}
#or
y <- if(x > 3) {
  10
} else {
  0
}

# CONTROL STRUCTURES - FOR LOOPS
for (i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")
for (i in 1:4) { print(x[i])}
for (i in seq_along(x)) {print(x[i])}
for (letter in x) {print(letter)}
for (i in 1:4) print(x[i])

x <- matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

# CONTROL STRUCTURES - WHILE LOOPS
count <- 0
while (count < 10) {
  print(count)
  count <- count + 1
}

z<-5
while (z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if (coin == 1) { ##  Random walk
    z <- z + 1
  } else {
    z <- z -1
  }
}

# CONTROL STRUCTURES - REPEAT, NEXT, BREAK
x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate()
  if (abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

for (i in 1:100) {
  if (i <= 90) {
    ## Skip the first 90 iterations
    next
  }
  print(i)
}


## FUNCTIONS

# FIRST R FUNCTION
add2 <- function(x, y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

columnmean <- function(x, removeNA = TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(x[, i], na.rm = removeNA)
  }
  means
}

# FUNCTIONS - 1
# R Function arguments can be matched positionally or by name
# Argument matching:
# Check for exact match for a named argument
# Check for a partial match
# Check for a positional match

# FUNCTIONS - 2
# The "..." argument: indicates a variable number of arguments that are usually passed on to the other functions
# often used when extending another function (copying the arguments of the original function)
myplot <- function(x,y,type="1", ...) {
  plot(x,y,type=type, ...)
}
# generic functions use ... so that extra arguments can be passed to methods
mean
# the ... argument is also necessary when the number of arguments passed to the function cannot be known in advance
args(paste)
# after ... on the argument list, arguments must be name explicitly and cannot be partially matched
paste("a","b",sep=":")
paste("a","b",se=":")

## SCOPING RULES

# SYMBOL BINDING
# lexical scoping
f <- function(x,y) {
  x^2 + y /z # z not asigned
}
f(1,2)
# R scoping rules
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)
# the values are taken from the environment
ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))

# Lexical scoping vs dynamic scoping
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}
f(3)
# Lexical scoping y = 10
# dynamic scoping y = 2


## DATES AND TIMES IN R
# Dates are represented by the Date class
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
x <- Sys.time()
x
p <- as.POSIXlt(x)
p
names(unclass(p))
p$sec

p <- as.POSIXct(x)
p
p$sec # error
p <- as.POSIXlt(p)
p$sec

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y, %H:%M")
x
class(x)

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
x <- as.POSIXlt(x)
x-y
