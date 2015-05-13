# Purpose: Retrieves the inverse "i" of a square matrix, 
# if the inverse is already cached, else it solves the inverse
# and caches the result in an existing list. This list is
# located in the parent environment from which cacheSolve was called.
# 
# Note: cacheSolve.R and makeCacheMatrix.R work together; both
# must be sourced into the parent environment to achieve the purpose.
#
# The other source, makeCacheMatrix.R, defines the function
# makeCacheMatricx() and a list of functions in the parent
# enviroment which are called by cacheSolve.
#
# To achieve the purpose, the user should:
#
# 1) initialize the list of functions with myCacheMatrix :
#
#       yourCM <- makeCacheMartix(yourmatrix)  
#
# 2) Solve for the inverse:
#
#       cacheSolve(yourCM)
#
# On subsequent calls of cacheSolve(yourCM), "getting cached inverse"
# is displayed, until data in yourCM is changed or removed.
#        yourCM$set(yourNewMatrix) will update data, clear cache.
# 
#  Note: these functions assume a valid invertible matrix is used.
#
#  Prepared May 2015 by WhiteFishDontJump
#######################################################################

cacheSolve <- function(x, ...) {
    i <- x$getinv()                        # is the inverse cached?
    if(!is.null(i)) {                      # if cached, then message
        message ("getting cached inverse") # and
          return(i)                        # exit, ouput cached result
    }                                      
    data <- x$get()                        # implicit 'else', get data
    i <- solve(data, ...)                  # solve for inverse
    x$setinv(i)                            # store result in parent
    i                                      # output result
}
