# rscript file.r to run from osx

c(42, 34, 4, 1) -> myFamilyAges
# this will assign the values to my newly named variable on the fly

myFamilyAges
# and this will print it, from this point of view, this looks even easier to learn than Python is for basic syntax. 

sum(myFamilyAges)
# 80

mean(myFamilyAges)
range(myFamilyAges)

c("dad","mom","colin","nolan") -> myFamilyNames

myFamilyNames

c("male","female","male","male") -> myFamilyGenders

c(159.7, 76, 18.1, 9.5) -> myFamilyWeights

myFamilyNames
myFamilyAges
myFamilyGenders
myFamilyWeights

mean(myFamilyWeights)
sum(myFamilyWeights)

myFamilyNames[2]

############

# lets make this into a datafram 
myFamily <- data.frame(myFamilyNames, myFamilyGenders, myFamilyAges, myFamilyWeights, stringsAsFactors = TRUE)

myFamily

#####
#str() allows us to understand what an object is at any time 

#  myFamilyNames myFamilyGenders myFamilyAges myFamilyWeights
#1           dad            male           42           159.7
#3         colin            male            4            18.1
#2           mom          female           34            76.0
#4         nolan            male            1             9.5

str(myFamily)

#'data.frame':   4 obs. of  4 variables:
# $ myFamilyNames  : Factor w/ 4 levels "colin","dad",..: 2 3 1 4
# $ myFamilyGenders: Factor w/ 2 levels "female","male": 2 1 2 2
# $ myFamilyAges   : num  42 34 4 1
# $ myFamilyWeights: num  159.7 76 18.1 9.5

# nb the Factor is for organising groups of labels essentially (in alphabetical order, ergo female = 1, male = 2)

str(myFamilyGenders)

# lets try the summary() function

summary(myFamily)

# myFamilyNames myFamilyGenders  myFamilyAges   myFamilyWeights 
# colin:1       female:1        Min.   : 1.00   Min.   :  9.50  
# dad  :1       male  :3        1st Qu.: 3.25   1st Qu.: 15.95  
# mom  :1                       Median :19.00   Median : 47.05  
# nolan:1                       Mean   :20.25   Mean   : 65.83  
#                               3rd Qu.:36.00   3rd Qu.: 96.92  
#                               Max.   :42.00   Max.   :159.70


# if we had a larger dataset, we might want to view a smaller subset of that data, we can do so with the head() and tail() functions, where we can either review the head or tail information and the number of rows we desire as follows: 

tail(myFamily, 2) #2 is the number of rows we want to review

#  myFamilyNames myFamilyGenders myFamilyAges myFamilyWeights
#3         colin            male            4            18.1
#4         nolan            male            1             9.5

# we may also want to review a specific column within a data frame using the $ attribute; 
# however it is key to note, that the data within the data.frame is not the same as the data in the original lists. 

myFamily$myFamilyWeights
# [1] 159.7  76.0  18.1   9.5

# we can verify this is different by changing some data in our source data points

myFamilyAges
# [1] 42 34  4  1

myFamilyAges[1] <- 43
myFamilyAges
# [1] 43 34  4  1

myFamily$myFamilyAges
# [1] 42 34  4  1

# what if we tried to 'add' a data point to the end of the data source that forms part of the data.frame? 

# myFamily$myFamilyAges<-c(myFamily$myFamilyAges, 11)
# Error in `$<-.data.frame`(`*tmp*`, myFamilyAges, value = c(42, 34, 4,  : 
#   replacement has 5 rows, data has 4
# Calls: $<- -> $<-.data.frame
# Execution halted

# THIS ERROR HANDLING PREVENTS US BREAKING THE DATA.FRAME

################

## data.frame() organises a set of vectors into a dataframe, a  vector is a list of elements that are the same kind, as  in  ages, or weights, or names, etc.





