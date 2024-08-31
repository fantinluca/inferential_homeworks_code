a = seq(0,1,length.out=100)
b = dexp(a)
alpha = 0.01

plot(a,b,type='l')
segments(qexp(alpha/2),0,qexp(alpha/2),dexp(qexp(alpha/2)))
segments(qexp(1-alpha/2),0,qexp(1-alpha/2),dexp(qexp(1-alpha/2)))