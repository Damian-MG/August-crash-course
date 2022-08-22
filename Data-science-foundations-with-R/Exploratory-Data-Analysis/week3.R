
## HIERARCHICAL CLUSTERING

library(ggplot2)
set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each=4), sd = 0.2)
x <- rnorm(12, mean = rep(c(1,2,1), each=4), sd = 0.2)
plot(x ,y ,col = "blue", pch = 19, cex = 2)
text(x + 0.05, y +0.05, labels = as.character(1:12)) 

# Hierarchical clustering - dist
dataFrame <- data.frame(x=x, y=y)
dist(dataFrame)

# Hierarchical clustering - hclust
dataFrame <- data.frame(x=x, y=y)
distxy(dataFrame)
hCLustering <- hclust(distxy)
plot(hClustering)

# Prettier dendrograms

# Merging points

# HEATMAP()
dataFrame <- data.frame(x=x, y=y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)


## K-MEANS CLUSTERING & DIMENSION REDUCTION

# K-MEANS CLUSTERING
set.seed((1234))
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x,y, col = "blue", pch = 19, cex =2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))
# Starting centroids - assign to closest centroid -recalculate centroid

# kmeans()
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
kmeansObj$cluster

par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 12)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd =3)

# Kmeans with heatmaps
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers =3)
par(mfrow = c(1,2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

# DIMENSION REDUCTION
par(mar = rep(0.2,4))
heatmap(dataMatrix)
# if we add a pattern (coinflip) it splits into 2 clusters

## PLOTTING AND COLOR IN R
