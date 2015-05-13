cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message ("getting cached data")
          return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

#    ### prepped by WhitefishDontJump (aka J Raphael), 2014 & 2015
#    repeating course as CTA