x_bar = 0.1
s2_x = 0.05
m = 10
alpha = 0.01

t_obs = x_bar_obs/(sqrt(s2_obs/m))
t = qt(1-alpha/2,m-1)

# --------------

y_bar = 0.05
s2_y = 0.15
n = 25

sp2 = ((n-1)*s2_y+(m-1)*s2_x)/(n+m-2)
t_obs_eq = (x_bar-y_bar)/(sqrt(sp2*(1/m+1/n)))
p_value_1 = 2*pt(abs(t_obs_eq),n+m-2,lower.tail=FALSE)

t_obs_neq = (x_bar-y_bar)/(sqrt(s2_x/m+s2_y/n))
nu = ((s2_x/m+s2_y/n)^2)/(s2_x^2/(m^2*(m-1))+s2_y^2/(n^2*(n-1)))
p_value_2 = 2*pt(abs(t_obs_neq),nu,lower.tail=FALSE)