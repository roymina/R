# numeric(0), character(0)等将创建一个指定模式但不含实际数据的变量
# edit(x)将打开数据编辑器
mydata <- data.frame(age=numeric(0),gender=character(0), weight=numeric(0))
mydata <- edit(mydata)
# 手动输入
mydatatxt <- "
age gender weight
25 m 166
30 f 115
18 f 120
"
mydata <- read.table(header=TRUE, text=mydatatxt)

# read from file
stus <- read.table("students.txt",header = T, row.names = "StudentID",sep = ',')
stus <- read.table("students.txt",header = T, row.names = "StudentID",sep = ',',stringsAsFactors = F)
stus <- read.table(
                  "students.txt",header = TRUE,
                   row.names = "StudentID",
                   sep = ',',
                   colClasses=c("character", "character", "character","numeric", "numeric", "numeric")
                  )

# data functions
length(stus)
dim(stus)
str(stus)
class(stus)
mode(stus)
names(stus)
stus
cbind(stus,stus) # 按列合并对象
rbind(stus,stus) #按行合并对象
head(stus,1) #默认6行
tail(stus,1) #默认6行
ls() #列出所有对象
rm(list=ls()) # 删除当前所有对象
stus2 <- edit(stus) # 编辑对象并保存为新对象
fix(stus) # 直接编辑对象
