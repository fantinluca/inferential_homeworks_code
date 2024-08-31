# dichiarare matrice
a = rbind(c(24,300,4900),c(300,4900,90000),c(4900,90000,1763020))

# calcolare autovalori di matrice
b = eigen(a)

# somma di tutti gli elementi, man mano
c = cumsum(a)

# edf
d = ecdf(a)

xx = seq(0,1,length.out=100)
pp = qnorm(xx/2)
ss = qnorm(1-xx/2)
plot(xx, pp, type='p', lwd=2)
lines(xx,-ss,type='l',lwd=2)