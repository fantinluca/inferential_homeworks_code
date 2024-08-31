x = c(3,2,4,2,1,2,2,0,1,3,2,1,4,3,2,0,1,1,5,4)
m = length(x)
xbar = mean(x)

n = 20
ybar = 2.5

alpha = 0.05
delta = 0
delta_hat = ybar-xbar
se_hat = sqrt(xbar/m+ybar/n)
w = abs((delta_hat-delta)/se_hat)
z = qnorm(1-alpha/2)

p_value = 2*min(c(pnorm(w),pnorm(w,lower.tail=FALSE)))