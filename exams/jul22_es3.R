alpha = 1-0.9
u = 2.8678
l = 2.1322
sum = 50

se_hat = (u-l)/(2*qnorm(1-alpha/2))
lambda_hat = (u+l)/2
n = sum/lambda_hat

lambda = 2
t_obs = abs((lambda_hat-lambda)/se_hat)
p = 2*min(c(pnorm(t_obs),pnorm(t_obs,lower.tail = FALSE)))