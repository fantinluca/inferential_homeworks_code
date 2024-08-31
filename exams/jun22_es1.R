x = c(16.1, 15.6, 21.2, 18.3, 14.8, 39.8, 34.8, 27.6)

tau_hat = mean(x^3)
n = length(x)

var = (tau_hat^2)/n

se_hat = sqrt(var)
alpha = 0.05
z = qnorm(1-alpha/2)

l = (tau_hat-z*se_hat)^(1/3)
u = (tau_hat+z*se_hat)^(1/3)

# ----------------------------

mean.hat = mean(x)
sigma2.hat = var(x)
qqnorm = qnorm((1:n)/(n+1), mean=mean.hat, sd=sqrt(sigma2.hat))
plot(x=sort(x),y=qqnorm)
abline(a=0,b=1)