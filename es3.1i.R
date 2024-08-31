max_sample = 10
sample_size = 10

# draw sample from gamma distribution
sample = sort(runif(sample_size, max=max_sample))

# define log-likelihood
alpha = seq(0.2, 10, length.out=1000)
l_alpha <- function(alpha) {
  result = numeric()
  for (a in alpha)
    result = append(result, log(prod(dgamma(sample,shape=a,scale=1))))
  return(result)
}

plot_name = capture.output(cat('Sample:',sample))
plot_name = strwrap(plot_name,width=60)
plot_name = paste(plot_name,collapse='\n')
plot(alpha, l_alpha(alpha), type='l', col='steelblue', lwd=2, main=plot_name, ylab='log-likelihood')