library(numDeriv)

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

# uniroot
b = uniroot(f=l_1_alpha,lower=0.1,upper=10)$root

# comparison
print(paste("Comparison; Newton-Raphson: ",a,"; uniroot: ",b,sep=""))