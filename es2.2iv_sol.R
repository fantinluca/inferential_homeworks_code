set.seed(12)
N=1e+5

n=4
k=3

# define pdf function
pdf_os3 <- function(x,k,n) {
  a = n*choose(n-1,k-1)*dnorm(x)
  a = a*pnorm(x)**(k-1)*(1-pnorm(x))**(n-k)
  return(a)
}

# apply pdf to values
t = seq(-3,3,len=300)
f_t = sapply(t,pdf_os3,k=k,n=n)

# draw sample
X = matrix(rnorm(n*N),nrow=N,ncol=n)

# define function to find k-th smallest
kth_smallest = function(x,k) {
  x_sorted = sort(x)
  return(x_sorted[k])
}

# pick k-th smallest for every row
xsim = apply(X,1,kth_smallest,k=3)

# plot
hist(xsim, freq=FALSE, breaks=N/1000,ylim=c(0,0.7))
lines(t,f_t,col="steelblue",lwd=2)
