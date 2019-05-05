# A sample vector

v <- c(1,4,4,3,2,2,3)

v[c(2,3,4)]
#> [1] 4 4 3
v[2:4]
#> [1] 4 4 3

v[c(2,4,3)]
#> [1] 4 3 4


# Create a sample data frame

data <- read.table(header=T, text='
 subject sex size
       1   M    7
       2   F    6
       3   F    9
       4   M   11
 ')

data[1,3]
data[1,'size']
data[1:2, c("sex","size")]

data[1:2,]

data[1:2, 2]
data[c(1,2), 2]

data[c(2,3),]
data[,c(2,3)]

# Indexing with a boolean vector
v <- c(1,4,5,3,2,9,8)
v>2
v[v>2]
v[c(F,T,T,T,F,F,T)]

# indexing with table
data$subject>3
data[data$subject < 3, ]
data[c(TRUE,TRUE,FALSE,FALSE), ]
which(data$subject < 3)


# Negative indexing
v[-1]
# Drop first three
v[-1:-3]
# Drop just the last element
v[-length(v)]
# ATTENTION: THIS ACTION DONOT CHANGE ORIGIN OBJECT