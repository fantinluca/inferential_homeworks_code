library(latex2exp)
n=100

mse_mom = function(theta) {
  (theta^2)/(3*n)
}
mse_mle = function(theta) {
  (2*theta^2)/((n+1)*(n+2))
}

theta = seq(-5,5,by=0.01)
plot(theta,mse_mom(theta),type='l',lwd=2,col='steelblue',ylab='',xlab='')
lines(theta,mse_mle(theta),type='l',lwd=2,col='red')
title(ylab=TeX('mse'))
title(xlab=TeX('\\theta'),line=2.5,cex.lab=1.2)
title(main=TeX('Blue line: $\\hat{\\theta}_{MM}$, red line: $\\hat{\\theta}_{MLE}$'))