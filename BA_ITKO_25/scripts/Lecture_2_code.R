##BA_ITKO_25 LECTURE 2 CODE

#Part 1. Objects####

#create an object with the name obj and the value 4.
obj <- 4 #you do assign values with <- or =

#create an object with a text. 
txt <- "I <3 Aarhus"

#create a vector from 1 to 10. vectors are created using c() and sequences using :
sq <- c(1,2)
sq <- c(1:10)


#create a text vector with the same value 10 times. This creates a vector with 10 times the same text. rep() needs the value and then , number of times
txt_rp <- c(rep("I <3 Aarhus", 10))

#alternatively we could do
txt_rp <- c(rep(txt, 10)) #this should result in the exact same vector as above.

#now create a dataframe. 
data <- data.frame(var1 = sq,
                   var2 = txt_rp) #we specify two variables one based on sq the other based on txt_rp. we can also specify these inside.


#Part 2. Referencing####

#we can reference an object by just calling it.
obj #this should return 4
print(obj) #this should return 4

#we can reference a vector by its position using []
sq[11] #returns position 6 of vector
sq[1:4] #returns position 1-4 of vector
sq[c(1,4)] #returns position 1 AND 4 of vector

#we can reference dataframes by position as row, column
data[2,1] #this would return row 2 and column 1 which is 2
data[10,2] #this would return row 10 and column 2, which is I <3 Aarhus

#we can also call a column in a dataframe by using the $ operator
data$var1 #this calls the whole column (basically a vector)
data$var2

#we could save this column to an object
txt_rp2 <- data$var2 #this should be identical to txt_rp


#Part 3. Installing & Loading Packages####

#we install external packages using install.packages()
install.packages("pacman") #this downloads the packman package

#we load packages using library
library(pacman) #note that it is not in quotations anymore

#with pacman we can actually load many packages and install them if not done.
p_load("tidyverse", "rio") #this loads and installs tidyverse and rio
