# install and load library to read csv files
install.packages("readr")
library("readr")

# read and save data in csv file
file = "es2.3_data.csv"
sample_data = read_csv2(file, col_names = TRUE)

# convert numbers from characters to numbers
samples = as.numeric(unlist(sample_data[,2]))

# generate exponential quantile
lambda=4
y_qexp = numeric()
for (i in 1:10) y_qexp = append(y_qexp, qexp(i/11,rate=lambda))
# oppure y_qexp=qexp((1:n)/11,rate=lambda)

# plot QQ-plot
test = qqplot(x=y_qexp,y=samples,main=paste(c("QQ plot with Exp(",lambda,")"),collapse=""),xlab="Theoretical quantiles",ylab="Random quantiles")
abline(0,1,col="steelblue",lwd=2)