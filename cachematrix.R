## This function caches the inverse of a matrix and stores it for use

## The makeCahceMatrix function takes a matrix and will return a list of functions
## These functions will allow to set the matrix, retrieve the matrix, find the inverse, and 
## finally return the inverse.  I will use Roger Peng's code from the example of a vector and
## have the same variable names

makeCacheMatrix <- function(x = matrix()) {
# m will be the inverse, we initially set it to null so we can determine if it has been stored
    m <- NULL
# The set function set the global values of x and m if I want to change them from previously 
# stored version
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
# This function retrives the stored matrix
    get <- function() x
# This finds the inverse and stores or caches it
    setinv <- function(inverse) m <<- inverse
# This retrieves the stored inverse 
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## This functions finds the inverse of the matrix.  If the matrix is stored it will retrieve it
## if the matrix is new, it will store the matrix and its inverse.  The x in this call to the
## function is a list generated from makeCacheMatrix

cacheSolve <- function(x, ...) {
# Checking if inverse is in cache
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
# Must find inverse, so get data first
    data <- x$get()
# Find inverse
    m <- solve(data, ...)
# Return inverse
x$setinv(m)
    m
}
