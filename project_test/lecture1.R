#Task 1
fun <- "Hello World"

#Task 2
numbers <- (1:100)
more_numbers <- numbers*4
hist(more_numbers)

#Task 3
task3_res <- (numbers[60]*2)-120

#Task 4
dat <- data.frame(x = c("ice_cream", "Chocolate", "Vanilla", "Strawberry"),
                  y = c("rating", 1, 2, 3))
write.csv(dat, "Dataframe.csv")
