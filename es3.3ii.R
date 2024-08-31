library(matlib)
library(numDeriv)

sample = c(5.1, 7.4, 10.9, 21.3, 12.3, 15.4, 25.4, 18.2, 17.4, 22.5)

l_alpha_beta <- function(alpha_beta) {
  a = alpha_beta[1]
  b = alpha_beta[2]
  return(log(prod(dweibull(sample,shape=a,scale=b))))
}
l_1_alpha_beta <- function(alpha_beta) {
  return(jacobian(l_alpha_beta, alpha_beta))
}
J_alpha_beta <- function(alpha_beta) {
  return(-hessian(l_alpha_beta, alpha_beta))
}

ab = c(1,12)
for (i in 1:10)
  ab = ab + t(inv(J_alpha_beta(ab))%*%t(l_1_alpha_beta(ab)))

print(paste("Result of Newton-Raphson multivariate method after 10 iterations: (",paste(ab,collapse=' '),")",sep=''))