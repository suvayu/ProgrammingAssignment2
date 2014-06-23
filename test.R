#!/usr/bin/Rscript

source("cachematrix.R")

print("Testing cache invalidation:")

m1 <- matrix(rpois(16, 5), nc = 4)
mcache <- makeCacheMatrix(m1)
m1inv <- cacheSolve(mcache)
i1 <- zapsmall(m1 %*% m1inv)

m2 <- matrix(rpois(16, 5), nc = 4)
mcache$set(m2)
m2inv <- cacheSolve(mcache)
i2 <- zapsmall(m2 %*% m2inv)

if (all(i1 == i2)) {
  print("All good")
} else {
  print("Oops! test failed")
}
