sample = c(5.1, 7.4, 10.9, 21.3, 12.3, 15.4, 25.4, 18.2, 17.4, 22.5)

par_length = 750
alpha = seq(0.1, 5, length.out=par_length)
beta = seq(12, 22, length.out=par_length)
L_alpha_beta <- function(alpha,beta) {
  result = numeric()
  for (a in alpha) {
    tmp = numeric()
    for (b in beta) {
      s = b^(1/a)
      tmp = append(tmp, prod(dweibull(sample,shape=a,scale=b)))
    }
    result = rbind(result, tmp)
  }
  return(result)
}
l_alpha_beta <- function(alpha,beta) {
  result = numeric()
  for (a in alpha) {
    tmp = numeric()
    for (b in beta) {
      s = b^(1/a)
      tmp = append(tmp, log(prod(dweibull(sample,shape=a,scale=b))))
    }
    result = rbind(result, tmp)
  }
  return(result)
}

L_values = L_alpha_beta(alpha,beta)
l_values = l_alpha_beta(alpha,beta)

par(mfrow = c(1, 2))

# persp(alpha,beta,L_values,theta=0,phi=90)
image(alpha,beta,L_values,col=hcl.colors(10,palette="YlOrRd"),xlab=expression(alpha),ylab=expression(beta))
contour(alpha,beta,L_values,nlevels=30,add=TRUE,col='black',lwd=1.5)
title(main = "Contours of the Lik")

image(alpha,beta,l_values,col=hcl.colors(10,palette="PuBu"),xlab=expression(alpha),ylab=expression(beta))
contour(alpha,beta,l_values,nlevels=30,add=TRUE,col='black',lwd=1.5)
title(main = "Contours of the log-Lik")