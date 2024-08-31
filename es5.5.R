library(bzinb)
library(rootSolve)

X = c(14.87, 7.13, 6.46, 6.45, 9.41, 8.21, 11.18, 14.28, 6.36, 17.98)
n = 10

f = function(a) {
  return(a - idigamma(log(10*a/sum(X))+(log(sum(X)))/10))
}

a = uniroot.all(f, c(0,100))
print(a)

l = (10*a)/(sum(X))
print(l)