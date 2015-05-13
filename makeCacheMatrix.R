#    Purpose:  Creates a list of functions for use with the cacheSolve
#    function. Please see cacheSolve.R for usage instructions and further
#    explanation.
#
#    This function should be executed and return values stored
#    (at least once) before running cachesolve.
#
#    Note: the argument x must be an invertible square matrix.
#    If no argument is given, then a 1 x 1 matrix, data = NA is created.
#
#    ### prepped by WhitefishDontJump (aka J Raphael), 2014 & 2015
#    repeating course as CTA
#######################################################################

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {                    # set updates data
        x <<- y                             # and resets the cache
        i <<- NULL
    }
    get <- function() x                     # put the matrix in get
    setinv <- function(solve) i <<- solve   # put the result in parent env.
    getinv <- function() i                  # checks for cached inverse
    list(set = set, get = get,              # returns the list
         setinv = setinv,                   # of functions to parent env.
         getinv = getinv)
}
