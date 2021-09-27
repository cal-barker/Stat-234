# R Code to generate a random sample for the Housing data

#install.packages("googlesheets4") #*Un-comment if package hasn't been installed*


library(googlesheets4)
url <- "https://docs.google.com/spreadsheets/d/1JpD2EFdEW1C_4T7eu84yY3JVbqN4dMOKOWtU7kv-668/edit#gid=0"
housing_data <- read_sheet(url)

#set seed for reproducibility
set.seed(2021)

#sample size n
n <- 20
n_rows <- length(housing_data$Name)
initial <- 2 #to skip row 1; remove header

#create random indices to subset our data
random_indices <- sample(initial:n_rows, n)

housing_sample <- housing_data$Name[random_indices]
index <- seq(from = 1, to = n, by = 1)

#combine indexes and observations into df 
housing_sample_df <- do.call(rbind, Map(data.frame, Index=index, Housing=housing_sample))

#write
write_sheet(housing_sample_df, ss ="https://docs.google.com/spreadsheets/d/1JpD2EFdEW1C_4T7eu84yY3JVbqN4dMOKOWtU7kv-668/edit#gid=1315386826", sheet="Sample")
