library(rootSolve)
n = 30;
xbar = 10;

lambda <- function(theta0) {
  return (-2*n*(log(1-theta0)+log(xbar-1)-log(theta0)+xbar*(log(xbar)+log(theta0)-log(xbar-1))));
}

f <- function(theta0) {
  return (lambda(theta0)-qchisq(0.9,1));
}

a = uniroot.all(f, c(0,1));