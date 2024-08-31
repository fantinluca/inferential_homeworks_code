b0.hat = 2.29
se.hat = sqrt(1/10)
alpha = 0.1

l = b0.hat - qnorm(1-alpha/2)*se.hat
u = b0.hat + qnorm(1-alpha/2)*se.hat

# ------------------------

n = 10
t = -1
beta0.hat = 2.29
beta1.hat = -0.25
theta = exp(beta0.hat+beta1.hat*t)/(1+exp(beta0.hat+beta1.hat*t))

a = pbinom(2, n, theta)

# ----------------------

nsigma2 = 42.5
xbar = 1.1
n = 15