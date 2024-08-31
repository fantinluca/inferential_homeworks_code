library(numDeriv)
library(rootSolve)

max_sample = 10
sample_size = 10

# draw sample from gamma distribution
sample = sort(runif(sample_size, max=max_sample))

# define likelihood
alpha = seq(0.2, 10, length.out=1000)
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
l_a = l_alpha(a)

# define target function
target_func <- function(alpha) {
  return(-2*(l_alpha(alpha)-l_a))
}

# chi distribution
chi = qchisq(0.95, 1)

# find bounds
tmp_func <- function(alpha) {
  return(target_func(alpha)-chi)
}
bounds = uniroot.all(tmp_func,interval=c(0.2,10))
print(paste("Lower and upper bounds of alpha such that target_func =< chi: {",paste(bounds,collapse=', '),"}",sep=''))

plot_name = capture.output(cat('Sample:',sample))
plot_name = strwrap(plot_name,width=60)
plot_name = paste(plot_name,collapse='\n')
plot(alpha, target_func(alpha), type='l', col='steelblue', lwd=2, main=plot_name, ylab='target function')
abline(h=chi, lwd=1.5, lty=2)
segments(bounds[1],-100,bounds[1],target_func(bounds[1]),lwd=1.5, lty=2)
segments(bounds[2],-100,bounds[2],target_func(bounds[2]),lwd=1.5, lty=2)
mtext(format(round(bounds[1],3),nsmall=3), side=1,at=bounds[1])
mtext(format(round(bounds[2],3),nsmall=3), side=1,at=bounds[2])
mtext(format(round(chi,3),nsmall=3), side=2,at=chi)