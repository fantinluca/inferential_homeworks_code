x = c(3,2,4,2,1,2,2,0,1,3,2,1,4,3,2,0,1,1,5,4)
m = length(x)
xbar = mean(x)

n = 20
ybar = 2.5

L_reduced <- function(theta,lambda) {
  exp(-m*theta-n*lambda)*theta^(m*xbar)*lambda^(n*ybar)
}

alpha = 0.05
theta_0_hat = (m*xbar+n*ybar)/(m+n)
stat = -2*log(L_reduced(theta_0_hat,theta_0_hat)/L_reduced(xbar,ybar))
chi = qchisq(1-alpha,1)

p_value = pchisq(stat,1,lower.tail=FALSE)