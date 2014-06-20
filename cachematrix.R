## Programming assignment 2


## return a "matrix" with inverse caching using a list

makeCacheMatrix <- function(mat = matrix()) {
  ## initialise inverse to NULL
  inv <- NULL

  ## setter function
  set <- function(value) {
    mat <<- value
    ## reset inverse, since not valid any more
    inv <- NULL
  }
  ## getter function
  get <- function() mat

  ## setter function for inverse
  setinv <- function(inverse) inv <<- inverse
  ## getter function for inverse
  getinv <- function() inv

  ## return "matrix" with caching
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## retrieve cached inverse or calculate and update cache and return

cacheSolve <- function(mat, ...) {
  ## get inverse
  inv <- mat$getinv()
  ## return cache if inverse is valid
  if(!is.null(inv)) {
    message("Using cached data")
    return(inv)
  }

  ## calculate inverse otherwise
  data <- mat$get()
  inv <- solve(data, ...)
  mat$setinv(inv)
  inv
}
