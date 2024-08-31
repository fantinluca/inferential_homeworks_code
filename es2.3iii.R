# install and load library to read csv files
install.packages("readr")
library("readr")

# read and save data in csv file
file = "es2.3_data.csv"
sample_data = read_csv2(file, col_names = TRUE)

# convert numbers from characters to numbers
sample_data[,2] = as.numeric(unlist(sample_data[,2]))

# compute the edf
edf = ecdf(sample_data$value)
print(edf(5.25))