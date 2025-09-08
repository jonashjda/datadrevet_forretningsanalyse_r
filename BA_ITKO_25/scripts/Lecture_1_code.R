##BUSINESS ANALYTICS LECTURE 1 - OPENING R

## You can insert comments with #

#This is a comment.

print("Data Analytics is Fun!") #to output a string use command "print"


#you can make basic math operations
2+2

2/2

2*5

#you can save these to objects via <- or =

calc <- 2+2



#then you can edit objects
calc/4

#you can also create a string object

obj <- "Data Analytics is fun"


obj*4 #this will not work as it is not a numeric object.

#you can check the type of object using "str"

str(obj) #this is a character


#we can create vectors of objects using "c" (c stands for concatenate)

seq <- c(1:34) #the : operator takes all values from 1 to 34

#now pull a certain number from the vector. we can pull numbers with [] and their position.

seq[5] #this should be the number that comes at fifth place which is 5

print(seq)

seq*2 #operations will apply it to all numbers of a vector. 

hist(seq) #we can visualize the distribution of these scores

#we can create a vector that is not a sequence by using commas for seperation.
vec <- c(4,8,15,16,23,42)

print(vec)

#this pulls out the third value in the vector
vec[3] 

vec*3
#this will multiply all six values by 3

hist(vec)
 
#we can create data frames to work with

dat <- data.frame(x = c(1:5),
                  y = c("Hello", "What", "Is", "It", NA)) #note that x and y should have the same amount of information


head(dat) #inspect the dataframe. 

#we can write the dataframe to disk.
write.csv(dat, "Dataframe.csv")
