x = c(1.53, 3.23, 0.11, 0.70, 0.37, 1.07, 1.47)

xbar = mean(x)
n = length(x)

alpha_hat = xbar/2

# ------------------------

lambda_hat = 1/(10*xbar)

var_lambda_hat = -1/(10*n*xbar)

# ------------------------

s2 = var(x)
a_mm = (xbar^2)/s2
l_mm = xbar/s2
p = pgamma(15.4,a_mm,l_mm) - pgamma(1,a_mm,l_mm)

# ------------------------

t_obs = -2*log(0.012/0.05)
p.value = pchisq(t_obs,1,lower.tail = FALSE)