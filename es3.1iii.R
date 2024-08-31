library(numDeriv)
library(shiny)

max_sample = 10
sample_size = 10

# draw sample from gamma distribution
sample = sort(runif(sample_size, max=max_sample))

L_alpha <- function(alpha) {
  result = numeric()
  for (a in alpha)
    result = append(result, prod(dgamma(sample,shape=a,scale=1)))
  return(result)
}
l_alpha <- function(alpha) {
  return(log(L_alpha(alpha)))
}
l_1_alpha <- function(alpha) {
  return(grad(l_alpha,alpha))
}
J_alpha <- function(alpha) {
  return(-grad(function(alpha)grad(l_alpha,alpha),alpha))
}

# Newton-Raphson
a = 1.0
for (i in 1:10) a = a + l_1_alpha(a)/J_alpha(a)

# observed information
print(paste("Observed information for maximum likelihood estimate ",a,": ", J_alpha(a),sep=""))