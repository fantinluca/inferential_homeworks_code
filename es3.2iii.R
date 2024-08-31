og_sample = c(7, 4, 2, 4, 3, 2, 5, 10, 7, 7, 3, 5, 5, 5, 4, 3, 7, 3, 6, 4)

lambda = seq(0, 15, length.out=1000)
L_alpha <- function(lambda) {
  result = numeric()
  for (l in lambda)
    result = append(result, prod(dpois(sample,lambda=l)))
  return(result)
}
l_alpha <- function(lambda) {
  return(log(L_alpha(lambda)))
}

maxima = numeric()

n_it = 1000
for (i in 1:n_it) {
  sample = sample(og_sample, 20, replace=TRUE)
  maxima = append(maxima, optimize(l_alpha, c(0,15), maximum=TRUE)$objective)
}

hist(maxima,freq=FALSE,breaks=50)