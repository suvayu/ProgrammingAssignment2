## Put comments here that give an overall description of what your
## functions do

## return a "matrix" with inverse caching using a list

makeCacheMatrix <- function(mat = matrix()) {
  inv <- NULL
  set <- function(val) {
    mat <<- val
    inv <- NULL
  }
  get <- function() mat
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## retrieve cached inverse or calculate and update cache and return

cacheSolve <- function(mat, ...) {
  inv <- mat$getinv()
  if(!is.null(i)) {
    message("Using cached data")
    return(inv)
  }
  data <- mat$get()
  inv <- solve(data, ...)
  mat$setinv(inv)
  inv
}
