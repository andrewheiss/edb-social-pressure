# Calculate clustered robust standard errors
robust_clusterify <- function(model, dat, cluster) {
  attach(dat, warn.conflicts = FALSE)
  not <- attr(model$model, "na.action")
  
  cluster <- dat[[cluster]]
  
  if(!is.null(not)) {  # only drop the NA values if there are any left
    cluster <- cluster[-not]
    dat <- dat[-not,]
  }
  
  with(dat, {
    M <- length(unique(cluster))
    N <- length(cluster)
    K <- model$rank
    dfc <- (M / (M - 1)) * ((N - 1) / (N - K))
    uj <- apply(sandwich::estfun(model), 2, function(x) tapply(x, cluster, sum))
    vcovCL <- dfc * sandwich::sandwich(model, meat = crossprod(uj) / N)
    coefs <- lmtest::coeftest(model, vcovCL, type = "HC1")  # HC1 or HC0 are close to Stata
    return(list(clcov = vcovCL, coefs = coefs))
  })
}

# Add significance stars (necessary because robust_clusterify() wipes out R's built-in stars)
p_stars <- function(p) {
  out <- symnum(p, corr = FALSE,
                cutpoints = c(0, 0.01, 0.05, 0.1, 1),
                symbols = c("***", "**", "*", " "))
  as.character(out)
}
