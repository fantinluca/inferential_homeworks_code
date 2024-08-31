b0 = 29.02
b1 = 1.96
b2 = -0.094

mu <- function(t) {
  b0+b1*t+b2*t^2
}

#optim(0,mu)
a = optimise(mu,c(0,24),maximum=TRUE)