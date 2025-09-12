# Task 1
vec <- c(1:500)
vec[499]

# Task 2
dat <- data.frame(var1 = c(13, 14, 2, 15, 16, 18),
                  var2 = c(0, 0, 1, 0, 1, 1))
dat[6, 2]

# Task 3
dat[,2] # Returns just second column
dat$var2 # Returns the same as above
dat[3,] # Returns just third row

# Task 4
install.packages("janitor")
library(janitor)


# Importing data
library(rio)
data_1 <- import("raw_data/lecture_1_dataframe.csv")
