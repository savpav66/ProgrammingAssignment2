# Inverse of Matrix with caching
# by Savvas Pavlidis

# makeCacheMatrix creates a special matrix
# which is really a list containing a function to
# set the value of the matrix,
# get the value of the matrix,
# set the value of the inverse matrix,
# get the value of the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set function(y) {
x <<- y
m <<- NULL
}
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get,
setinverse=setinverse,
getinverse=getinverse)
}


# This function calculates the inverse of the function
# it first checks to see if the result is already cached!
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if (!is.null(m)) {
message("getting cached data")
return(m)
}
data<-x$get()
m<-solve(data,...)
x$setinverse(m)
m
}