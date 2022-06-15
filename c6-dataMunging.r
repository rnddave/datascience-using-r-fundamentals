# cleaning up datasets that are full of junk

urlToRead <- "https://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/na-est2011-01.csv"
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




