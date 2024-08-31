sample = c(7, 4, 2, 4, 3, 2, 5, 10, 7, 7, 3, 5, 5, 5, 4, 3, 7, 3, 6, 4)

alpha = seq(0, 15, length.out=1000)
L_alpha <- function(lambda) {
  result = numeric()
  for (l in lambda)
    result = append(result, prod(dpois(sample,lambda=l)))
  return(result)
}
l_alpha <- function(lambda) {
  return(log(L_alpha(lambda)))
}

plot_name = capture.output(cat('Sample:',sample))
plot_name = strwrap(plot_name,width=60)
plot_name = paste(plot_name,collapse='\n')
plot(alpha, l_alpha(alpha), type='l', col='steelblue', lwd=2, main=plot_name, ylab='log-likelihood')

max = optimize(l_alpha, c(0,15), maximum=TRUE)

print(paste("The log-likelihood maximum is located in ", max$maximum, " and has value ", max$objective, sep=""))