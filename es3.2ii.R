sample = c(7, 4, 2, 4, 3, 2, 5, 10, 7, 7, 3, 5, 5, 5, 4, 3, 7, 3, 6, 4)

lambda = seq(0.1, 15, length.out=1000)
L_alpha <- function(lambda, sample) {
  result = numeric()
  for (l in lambda)
    result = append(result, prod(dpois(sample,lambda=l)))
  return(result)
}
l_alpha <- function(lambda, sample) {
  return(log(L_alpha(lambda, sample)))
}

plot_name = capture.output(cat('New sample:',sample2))
plot_name = strwrap(plot_name,width=60)
plot_name = paste(plot_name,collapse='\n')
plot(lambda, l_alpha(lambda, sample), type='l', col='steelblue', lwd=2, main=plot_name, ylab='log-likelihood')

sample2 = sample(sample, 20, replace=TRUE)
lines(lambda, l_alpha(lambda, sample2), type='l', col='red', lwd=2)