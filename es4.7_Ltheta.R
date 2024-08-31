library(latex2exp)

yn = 3
n = 10
L = function(theta) {
  (theta>=yn)*(1/theta)^n
}

theta = seq(0,6,by=0.0001)
plot(theta,L(theta),type='l',lwd=2,col='steelblue',xaxt='n',yaxt='n',ylab='',xlab='')
title(ylab=TeX('L(\\theta)'),line=0,cex.lab=1.2)
title(xlab=TeX('\\theta'),line=2.5,cex.lab=1.2)
axis(1,at=c(yn),labels=c(TeX('$y_{(n)}$')))
corners = par("usr") #Gets the four corners of plot area (x1, x2, y1, y2)
segments(yn,(1/yn)^n,corners[1],(1/yn)^n,lwd=1.5, lty=2)

par(xpd = TRUE) #Draw outside plot area
text(x = corners[1]-.35, y = (1/yn)^n, TeX('$\\left(\\frac{1}{y_{(n)}}\\right)^n$'), srt = 0)
#mtext(TeX('$\\left(\\frac{1}{\\theta}\\right)^n$'),side=2,at=(1/yn)^n)