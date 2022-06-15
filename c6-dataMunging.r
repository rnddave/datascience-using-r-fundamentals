# cleaning up datasets that are full of junk

urlToRead <- "https://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
testFrame <- read.csv(url(urlToRead))

str(testFrame)
summary(testFrame)

# we can see that the first lines are useless to our data set (useful to humans, but not useful for analyhsis)

# let's remove them
testFrame <- testFrame[-1:-8,] #remove lines 1-8

# now we can also verify that the end of the data file is also useless:
summary(testFrame[,6:10])

# we just have a load of 'na' in these columns

# we don't want to modify the dataset at the moment, but we can focus more on the useful information

testFrame <- testFrame[,1:5]

tail(testFrame,5) # we can see this is also useless information to the machine (useful to humans perhaps, but not machines)

testFrame <- testFrame[-52:-58]

################## RENAMING COLUMNS

testFrame$stateName <- testFrame[,1]

colnames(testFrame) # shows us the column names
# [1] "table.with.row.headers.in.column.A.and.column.headers.in.row.3...leading.dots.indicate.sub.parts."
# [2] "X"                                                                                                
# [3] "X.1"                                                                                              
# [4] "X.2"                                                                                              
# [5] "X.3"                                                                                              
# [6] "stateName" 

# we can also use colnames() to rename columns, this is better to rename, than to add new columns if the dataset is very large. but we're not going to try that at the moment, we have the new column, let's just remove the other. 

testFrame <- testFrame[,-1]

# let's look at the global substitute command gsub() which can be used to search and replace elements. 

testFrame$stateName <- gsub("\\.","", testFrame$stateName)

# we use the \\ character as an escape charcter in R. This allows us to instruct the gsub() command to look for the "." specifically else, the "." without escape characters = wildcard for R

# now we need to look at addressing the populations, currently R has read this as strings of numbers, rather than numericals. So we can use gsub() again, and as.numeric() to convert, but first we need to get rid of those human readable touches (the commas in large numbers for example) 

testFrame$april10census <- gsub(",", "", testFrame$X)
testFrame$april10base <- gsub(",", "", testFrame$X.1)
testFrame$july10pop <- gsub(",", "", testFrame$X.2)
testFrame$july11pop <- gsub(",", "", testFrame$X.3)

# and convert to numbers

testFrame$april10census <- as.numeric(gsub(" ", "", testFrame$april10census))
testFrame$april10base <- as.numeric(gsub(" ", "", testFrame$april10base))
testFrame$july10pop <- as.numeric(gsub(" ", "", testFrame$july10pop))
testFrame$july11pop <- as.numeric(gsub(" ", "", testFrame$july11pop))

testFrame <- testFrame[,-1:-4]

str(testFrame)

head(testFrame,10)

#               stateName april10census april10base july10pop july11pop
# 9               Alabama       4779736     4779735   4785401   4802740
# 10               Alaska        710231      710231    714146    722718
# 11              Arizona       6392017     6392013   6413158   6482505
# 12             Arkansas       2915918     2915921   2921588   2937979
# 13           California      37253956    37253956  37338198  37691912
# 14             Colorado       5029196     5029196   5047692   5116796
# 15          Connecticut       3574097     3574097   3575498   3580709
# 16             Delaware        897934      897934    899792    907135
# 17 District of Columbia        601723      601723    604912    617996
# 18              Florida      18801310    18801311  18838613  19057542






