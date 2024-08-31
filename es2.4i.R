# read data from eggs file
eggs = read.table("eggs.txt", header=TRUE)
n_eggs = nrow(eggs)

# compute mean for every egg
b0 = 0.5
bs = c(-1,1,0.1)
mean = numeric()
for (i in 1:nrow(eggs)) {
  egg=eggs[i,]
  mean = append(mean, b0 + sum(egg*bs))
}

# compute prob for every egg
probs = numeric()
for (m in mean) {
  probs = append(probs, 1/(1+exp(-m)))
}

# predict sex with rbinom
sexes = numeric()
for (prob in probs) {
  sexes = append(sexes, rbinom(1,1,prob))
}

# print data
cat("The predicted sexes are:", sexes)
cat("\nThere will be",sum(sexes),"males and",n_eggs-sum(sexes),"females.")