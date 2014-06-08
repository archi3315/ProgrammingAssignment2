## These are util functions to cache the inverse matrix calculation 
## of an invertible matrix

## Auxiliar function to create a cacheable matrix

makeCacheMatrix <- function(originalmatrix = matrix()) {
        solvedinverse <- NULL
        set <- function(data) {
                originalmatrix <<- data
                solvedinverse <<- NULL
        }
        get <- function() {
                ## Returns the original matrix
                originalmatrix       
        }
        setinverse <- function(inverse) {
                ## Sets the inversed matrix
                solvedinverse <<- inverse       
        }
        getinverse <- function() {
                ## Gets the inversed matrix
                solvedinverse       
        }
        ## Returns the list of functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Calculates the inversed matrix of the given cachematrix
## It returns the cached inversed matrix if exists

cacheSolve <- function(cachematrix) {
        ## Check for a cached solution
        solvedinverse <- cachematrix$getinverse()
        if(!is.null(solvedinverse)) {
                message("getting cached inversed matrix")
                return(solvedinverse)
        }
        
        ## No cached solution. Solve and put it in the cache
        data <- cachematrix$get()
        solvedinverse <- solve(data)
        cachematrix$setinverse(solvedinverse)
        ## Return the solved inverse matrix of 'cachematrix'
        solvedinverse
}
