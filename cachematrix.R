## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## This function creates a special "matrix" object 
##that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize the inverse of the matrix
  s <- NULL

  ## step 1, define "set" function to get the matrix
  set <- function(y){
          x <<- y
          s <<- NULL
  }
  
  ## step 2 define "get" function to get the matrix
  get <- function () {
    x
  }
  ## step 3 define "setsolve" function to use solve() 
  ##calculating the inverse of the matrix
  setsolve <- function(solve) {
    s <<- solve
  }
  ## step 4 define "get" function to get the result 
  getsolve <-function () {
    s
  }
  
  ## return a list of these four steps of functions
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}





## Write a short comment describing this function
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  ##If found the result in Cache, return it
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  ## if not found in Cache, get data,calculate and save it in Cache
  data <- x$get()
  s <- solve(data)
  x$setsolve(s)
  ## return result
  s
}
