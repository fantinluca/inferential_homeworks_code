x = c(30,20,60,80,30,50,33,81,34,35,44,41,22,32,21,26,47,27,32,91)
y = c(71,42,45,28,34,43,52,31,36,24,35,37,67,47,42,39,25,91,23,19)

m = length(x)
n = length(y)
alpha = 0.01

L <- function(mu_x,mu_y) {
  ((mu_x)^m)*((mu_y)^n)*(exp(-mu_x*sum(x)-mu_y*sum(y)))
}

x_bar = mean(x)
y_bar = mean(y)

mu_x_hat = 1/x_bar
mu_y_hat = 1/y_bar

theta_0_hat = (3*(m+n))/(2*m*x_bar+3*n*y_bar)

stat = -2*log((L(mu_x_hat,mu_y_hat))/(L((2*theta_0_hat)/3,theta_0_hat)))
chi = qchisq(1-alpha,1)