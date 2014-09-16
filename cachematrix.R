## The following two functions create a special object which stores a matrix and then solves inverse of the matrix

## In the first function, a matrix is create using makeCacheMatrix function, which has list containing function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
  	set <- function(y){
  	        x <<- y
  		m <<- NULL
	}
	get <- function() x
	setmatrix <- function(solve) m <<- solve
	getmatrix <- function() m
	list(set=set, get=get,
   	setmatrix=setmatrix,
   	getmatrix=getmatrix)
}


## the second function calculates the inverse of the matrix created using the first function. But doing so it first checks that
## whether the inverse has already been computed. If so, it gets the inverse from the cache and doesnt do the computation again.
## If not, then it computes the inverse and sets the inverse in the cache using the setmatrix function.

cacheSolve <- function(x, ...) {
        m <- x$getmatrix()
   	if(!is.null(m)){
      	        message("Getting Cached Data")
      		return(m)
    	}
    	matrix <- x$get()
    	m <- solve(matrix, ...)
    	x$setmatrix(m)
    	m
}
