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
myFamily <- data.frame(myFamilyNames, myFamilyGenders, myFamilyAges, myFamilyWeights)

myFamily

#  myFamilyNames myFamilyGenders myFamilyAges myFamilyWeights
#1           dad            male           42           159.7
#3         colin            male            4            18.1
#2           mom          female           34            76.0
#4         nolan            male            1             9.5


