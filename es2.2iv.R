N=1e+5
set.seed(10)

# generate values to process with pdf
b = 3
t = seq(-b,b,length.out=N/2)
n_t = length(t)

# get values of normal distributions for values of t
# default parameters of pnorm correspond to the standard normal
phi = pnorm(t)

# get values of normal density for values of t
f_norm = dnorm(t)

# generate values of target pdf
pdf = numeric()
for (i in 0:n_t) {
  p = phi[i]
  f = f_norm[i]
  pdf = append(pdf, 4.0*(p)^2*f*(1-p))
}

# plot pdf
plot(t, pdf, type='l', main='PDF of X_(3)', xlab="Values of X_(3)", ylab="Density")

# plot histogram
samples = sample(x=t, prob=pdf, size=N, replace=TRUE)
hist(samples, freq=FALSE, breaks=N/1000)
lines(t,pdf,col="steelblue",lwd=2)

# curve function
# pdf2 = function(t) {4.0*(pnorm(t))^2*dnorm(t)*(1-pnorm(t))}
# curve(pdf2, from=-10, to=10, n=N)
