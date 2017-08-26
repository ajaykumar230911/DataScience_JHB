# make Cache Matrix function:

##This function creates a special "matrix" object that can cache its inverse
## define the argument with default mode of "matrix"
makeCacheMatrix <- function(x = matrix()) {
## initialize inv as NULL; will hold value of matrix inverse 
   inversa <- NULL
## define the set function to assign new   
   set <- function(y) {
## value of matrix in parent environment
     x <<- y
## if there is a new matrix, reset inv to NULL
     inversa <<- NULL
   }
## define the get fucntion - returns value of the matrix argument   
   get <- function() x
## assigns value of inv in parent environment
   setInverse <- function(inverse) inversa <<- inverse
## gets the value of inv where called   
   getInverse <- function() inversa
## you need this in order to refer to the functions with the $ operator   
   list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function

# Cache Solve function:

cacheSolve <- function(x, ...) {
 inversa <- x$getInverse()
 if(!is.null(inversa)) {
     message("getting cached data")
     return(inversa)
   }
   data <- x$get()
   inversa <- solve(data, ...)
   x$setInverse(inversa)
  inversa
}
