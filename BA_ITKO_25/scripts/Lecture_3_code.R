##BUSINESS ANALYTICS LECTURE 3 - LOADING DATA

##1. Loading/Installing Packages###

#you can install packages using install.packages()
#let's install pacman in case you haven't done this yet.

install.packages("pacman")

#to load a package we can use libary().
library(pacman) #note without ""

#alternatively we can use pacman to load
pacman::p_load("janitor") #this will load janitor (and install it if not already loaded)


#do you need help about a package or function? just use ?
?p_load() #this will open the help tab on the lower right side. 

##2. Reading Data###

#download the data "gym_churn_us.csv" from Brightspace (content -> lecture 3 -> gym_churn_us.csv). 
#place it in your folder called "raw_data" (or any other folder you want, but remember to specify).

#we can just use the rio package. let's load it. 
library(rio)

#we will just use the import function to read the data. 
dat <- import("raw_data/gym_churn_us.csv")

#this will create a new data object in the environment on the top right called "dat". 

#we can see the data by using View()
View(dat)

#how many rows and columns do we have?
dim(dat) #4000 rows, 14 columns (variables)

#what are the names of the columns?
names(dat) 

##3. Overview of Dataset####

#to get an overview of the dataset we use two packages "skimr" and "DataExplorer"

install.packages("skimr", "DataExplorer")

library(skimr)
library(DataExplorer)

#we can just skim to get an overview of the data. 
skim(dat)

#we can plot the data to get a further overview
plot_bar(dat) #inconcistencies in age and gender.

plot_histogram(dat) #plot histograms. mostly normally distributed.
