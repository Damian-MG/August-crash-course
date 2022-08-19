
## PRINCIPLES OF ANALYTIC GRAPHIC

## EXPLORATORY GRAPHS

# 1 DIMENSIONAL SUMMARIES
getwd()
pollution <- read.csv("Exploratory-Data-Analysis/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)
summary(pollution$pm25)
boxplot(pollution$pm25, col = "blue")
hist(pollution$pm25, col = "green")
rug(pollution$pm25)
hist(pollution$pm25, col = "green", breaks = 100)

# Overlaying features
boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of counties in each region")

# X DIMENSIONAL SUMMARIES
boxplot(pm25 ~ region, data = pollution, col = "red")
# Multiple histograms
par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")
# Scatterplot
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty =2)
# Multiple Scatterplots
par(mfrow = c (1,2), mar = c(5,4,2,1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))


## PLOTTING

# PLOTTING SYSTEMS IN R
# BASE plotting system
library(datasets)
data(cars)
with(cars, plot(speed, dist))
# LATTICE plot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))
# GGPLOT2 plot
install.packages("ggplot2")
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

# BASE PLOTTING
library(datasets)
# histogram
hist(airquality$Ozone)
# scatterplot
with(airquality, plot(Wind, Ozone))
# boxplot
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# Annotation
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in NYC")
# or
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))
# with regression line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)
# Multiple base plots
par(mfrow = c(1,2))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})
# Multiple base plots
par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
        plot(Temp, Ozone, main = "Ozone and Temperature")
        mtext("Ozone and Weather in NYC", outer = TRUE)
})

# PLOTTING DEMO 

## GRAPHIC DEVICES IN R

