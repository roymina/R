# A sample vector
v <- c(1,4,4,3,2,2,3)

subset(v,v<3) # equals v[v<3]

t <- c("small", "small", "large", "medium")
subset(t, t!="small") # equals t[t!="small"]

v[v<3] <- 9 # assign value 9 to all item in v which <9 : output [1] 9 4 4 3 9 9 3
subset(v, v<3) <- 9 # couldn't assign value in subset method: output Error in subset(v, v < 3) <- 9 : could not find function "subset<-"

# A sample data frame
data <- read.table(header=T, text='
 subject sex size
       1   M    7
       2   F    6
       3   F    9
       4   M   11
 ')

subset(data, subject < 3) # = data[data$subject < 3, ]

subset(data, subject < 3, select = -subject) # select all subject<3 items, Delete subject column
subset(data, subject < 3, select = c(sex,size))
subset(data, subject < 3, select = sex:size) # data[data$subject < 3, c("sex","size")]
subset(data, subject < 3  &  sex=="M")
subset(data, subject < 3  |  sex=="M")

subset(data, subject %in% c(1,3)) # data[data$subject %in% c(1,3), ]