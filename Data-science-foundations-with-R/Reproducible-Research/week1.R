
## REPRODUCIBLE RESEARCH

# SCRIPTING YOUR ANALYSIS

# The dataset may depend on the goal
# Descriptive - a whole population
# Exploratory - a random sample with many variables measured
# Inferential - the right population, randomly sampled
# Predictive - a training and test data set from the same population
# Causal - data from a randomized study
# Mechanistic -data about all components if the system

# STRUCTURE OF DATA ANALYSIS
install.packages("kernlab")
library(kernlab)
data(spam)
str(spam[, 1:5])

# subsampling dataset: test and training set
set.seed(3435)
trainIndicator = rbinom(4501, size = 1, prob = 0.5)
table(trainIndicator)
trainSpam = spam[trainIndicator == 1,]
testSpam = spam[trainIndicator == 0,]

names(trainSpam)
head(trainSpam)
table(trainSpam$type)
plot(trainSpam$capitalAve ~ trainSpam$type)

plot(log10(trainSpam[, 1:4] + 1))

hCluster = hclust(dist(t(trainSpam[, 1:57])))
plot(hCluster)

hClusterUpdated = hclust(dist(t(log10(trainSpam[, 1:55] + 1))))
plot(hClusterUpdated)

# STATISTICAL PREDICTION / MODELING
trainSpam$numType = as.numeric(trainSpam$type) - 1
costFunction = function(x, y) sum(x != (y > 0.5))
cvError = rep(NA, 55)
library(boot)
for (i in 1:55) {
        lmFormula = reformulate(names(trainSpam)[i], response = "numType")
        glmFit = glm(lmFormula, family = "binomial", data = trainSpam)
        cvError[i] = cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}
## Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]

# GET A MEASURE OF UNCERTAINTY
## Use the best model from the group
predictionModel = glm(numType ~ charDollar, family = "binomial", data = trainSpam)
## Get predictions on the test set
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nonspam", dim(testSpam)[1])
## Classify as `spam' for those with prob > 0.5
predictedSpam[predictionModel$fitted > 0.5] = "spam"
## Classification table
table(predictedSpam, testSpam$type)
## Error rate
(61 + 458)/(1346 + 458 + 61 + 449)

