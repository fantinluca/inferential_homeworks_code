x = c(30,20,60,80,30,50,33,81,34,35,44,41,22,32,21,26,47,27,32,91)
y = c(71,42,45,28,34,43,52,31,36,24,35,37,67,47,42,39,25,91,23,19)

delta = 0
m = length(x)
n = length(y)
x_bar = mean(x)
y_bar = mean(y)

mu_x_hat = 1/x_bar
mu_y_hat = 1/y_bar
delta_hat = mu_x_hat - mu_y_hat

se_mu_x_hat = mu_x_hat/sqrt(m)
se_mu_y_hat = mu_y_hat/sqrt(n)
se_hat = sqrt(se_mu_x_hat^2+se_mu_y_hat^2)

t_obs = abs((delta_hat-delta)/se_hat)

p_value = 2*min(c(pnorm(t_obs),1-pnorm(t_obs)))