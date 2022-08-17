
## SIMULATION AND PROFILING

# THE STR FUNCTION
# Displays the internal structure of an R object
str(str)
str(lm)
str(ls)

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(40, 10)
str(f)
summary(f)

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)
m[,1]

s <- split(airquality, airquality$Month)
str(s)

# SIMULATION - GENERATING RANDOM NUMBERS
# Normal distribution
# rnom, dnorm, pnorm, rpois
# r random, d density, p cumulative distribution, q quantile function

x <- rnorm(10)
x

x <- rnorm(10, 20, 2)
x
summary(x)

# Setting the random number seed ensures reproducibility
set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

# Poison data
rpois(10, 1)
rpois(10, 2)
rpois(10, 20)

ppois(2, 2) # Cumulative distrib
ppois(4, 2) # Pr (x <= 4)
ppois(6, 2) # Pr (x <= 6)

# SIMULATION - SIMULATING A LINEAR MODEL
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

# If x is binary
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

# Poisson model
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

# SIMULATION - RANDOM SAMPLING
# draw randomly from a specified set of (scalar) object
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)

sample(letters, 5)

sample(1:10)
sample(1:10)

sample(1:10, replace = TRUE) # sample with replacement


## PROFILER

# profiling is a systematic way to examine how much time is spent in different parts of a program
# using system.time()

system.time(readLines("http://www.jhsph.edu"))

system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})

# USING R PROF
# Rprof() keeps track of the function call stack at regularly sampled intervals and tabulates how much time is spend in each function
# summaryRprof() tabulates the R profiler output and calculates how much time is spend in which function
Rprof()
summaryRprof()

