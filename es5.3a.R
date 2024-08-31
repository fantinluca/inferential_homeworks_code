beta = 0.01
mu0 = 1
mu = 2
s = sqrt(1.2)
alpha = 0.05

lhs <- function(n) {
  pt(qt(1-alpha/2,n-1)-(mu-mu0)/(s/sqrt(n)), n-1)-pt(-qt(1-alpha/2,n-1)-(mu-mu0)/(s/sqrt(n)), n-1)
}

eq <- function(n) {
  lhs(n) - beta
}

xx <- seq(2,30,len=100)
ff <- sapply(xx, eq)
plot(xx, ff, type='l', lwd=2)

a = uniroot(eq, c(2,30))