library(numDeriv)

sample = c(5.1, 7.4, 10.9, 21.3, 12.3, 15.4, 25.4, 18.2, 17.4, 22.5)

l_alpha_beta <- function(alpha_beta) {
  a = alpha_beta[1]
  b = alpha_beta[2]
  return(log(prod(dweibull(sample,shape=a,scale=b))))
}

ab = c(1,12)
ab = optim(ab,l_alpha_beta,method='BFGS',control=list(fnscale=-2))

print(paste("Result of optim method on log-likelihood: (",paste(ab$par, collapse=' '),")",sep=''))