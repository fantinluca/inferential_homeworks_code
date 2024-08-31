# read data from eggs file
eggs = read.table("eggs.txt", header=TRUE)
n_eggs = nrow(eggs)

# compute first quartiles for features
fq_vol = quantile(eggs$vol,probs=c(0.25))
fq_height = quantile(eggs$height,probs=c(0.25))
fq_rough = quantile(eggs$roughness,probs=c(0.25))
fqe = c(fq_vol,fq_height,fq_rough)

# compute mean for fqe
b0 = 0.5
bs = c(-1,1,0.1)
mean = b0 + sum(egg*bs)

# compute prob for fqe
prob = 1/(1+exp(-mean))

# predict sex with rbinom
sex = rbinom(1,1,prob)

# print data
cat("The first quartile egg has features",fqe,"and its predicted sex is",if(sex==1)"male."else"female.")