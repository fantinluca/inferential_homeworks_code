x = c(3.2, 2.3, 3.3, 2.5, 4.4, 2.3, 1.9)
mu0 = 2
alpha = 0.05

xbar = mean(x)
sx2 = var(x)
m = length(x)

t.obs = (xbar-mu0)/(sqrt(sx2/m))
t = qt(1-alpha,m-1)

# ---------------------

p.value = min(c(pt(abs(t.obs),m-1,lower.tail = FALSE),pt(-abs(t.obs),m-1)))

# ---------------------

y = c(1.8, 3.1, 4.1, 2.5, 2.7, 3.3, 4.3)

ybar = mean(y)
n = length(y)
sy2 = var(y)

sp2 = ((n-1)*sy2+(m-1)*sx2)/(n+m-2)
tn.obs = abs((xbar-ybar)/(sqrt(sp2*(1/m+1/n))))
t2 = qt(alpha/2,n+m-2)

p.value2 = 2*min(pt(tn.obs,n+m-2,lower.tail = FALSE),pt(-tn.obs,n+m-2))