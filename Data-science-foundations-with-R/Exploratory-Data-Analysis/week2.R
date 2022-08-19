
## LATTICE PLOTTING SYSTEM
library(lattice)
library(datasets)

xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

# Panel functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))

xyplot(y ~ x | f, panel = function(x,y,...) {
        panel.xyplot(x,y,...)
        panel.abline(h = median(y), lty = 2)
})

xyplot(y ~ x | f, panel = function(x,y,...) {
        panel.xyplot(x,y,...)
        panel.lmline(x, y, col= 2)
})


## GGPLOT2
library(ggplot2)
str(mpg)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, geom = c("point","smooth"))
qplot(hwy, data = mpg, fill = drv)
qplot(displ, hwy, data = mpg, facets = .~drv)

# Axis limit
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x=x,y=y))
g + geom_line()
g + geom_line() + ylim(-3,3)
g + geom_line() + coord_cartesian(ylim = c(-3,3))
