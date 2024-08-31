lrt <- function(t) {
  n = 30
  bx = 10
  t_hat = (bx-1)/b
  l = n*log(1-t)+(n*bx-n)*log(t)
  l_hat = n*log(1-t_hat)+(n*bx-n)*log(t_hat)
  return (-2*(l-l_hat))
}

xx <- seq(0.7,0.99,len=100)
ff <- sapply(xx, lrt)
plot(xx, ff, type='l', lwd=2)