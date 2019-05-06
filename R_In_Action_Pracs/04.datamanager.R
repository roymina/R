# 将计算出来的新变量放入原来数据中
mydata<-data.frame(x1=c(2,2,6,4),x2=c(3,4,2,8))
# 方法1
mydata$sumX <- mydata$x1+mydata$x2
mydata$meanx <- (mydata$x1+mydata$x2)/2
# 方法2
attach(mydata)
  mydata$sumX <- x1+x2
  mydata$meanx <- (x1+x2)/2
detach(mydata)
# 方法3 推荐
mydata <- transform(mydata,sumX = x1+x2, meanx = (x1+x2)/2)

# leadship data
manager <- c(1:5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)

leadership <- data.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5,stringsAsFactors = F)
# 语句 variable[condition] <- expression 将仅在 condition 的值为 TRUE 时执行赋值
leadership$age[leadership$age == 99] <-NA
attach(leadership)
leadership$agecat<-NA
leadership$agecat[age>75] <- "elder"
leadership$agecat[age>=55& age<=75] <- "middle age"
leadership$agecat[age <55] <- "young"

# within
leadership <- within(leadership,{
  agecat <-NA
  agecat[age>75] <- "elder"
  agecat[age>=55& age<=75] <- "middle age"
  agecat[age <55] <- "young"
})
# use reshape package rename var name
library(reshape)
leadership <- rename(leadership,c(managerID="managerIndex",date="testDate"))
# use names function change var name
names(leadership)[2] <- "date"


# NA,NaN,NULL
y <- c(1:5,NA)
is.na(y)
r <- is.na(leadership[,6:10])
# exclude NA values:rm=TRUE
sum<-sum(y,na.rm = T)
#  na.omit() 可以删除所有含有缺失数据的行
newData <- na.omit(leadership)




# 日期
# "2001-12-26" "1998-10-25"
# 日期值的默认输入格式为yyyy-mm-dd
mydates <- as.Date(c("2001/12/26","1998/10/25"))
strDates <- c("2001-12-26","1998-10-25")
mydates <- as.Date(strDates, "%m/%d/%Y")
# 获得当前日期和时间
today <- Sys.Date()
current <- date()
# 格式化时间
format(today,format = "%B %d %Y")
# 日期运算
days <- as.Date("2019-05-06") - as.Date("1977-10-29")
howold <- difftime(Sys.Date() , as.Date("1977-10-29"),units = "weeks")
# 日期-> 字符
strDates <- as.character(date())
# 日期帮助包：  lubridate 包中包含了许多简化日期处理的函数。
# fCalendar 包可能会有帮助。它提供了大量的日期处理函数，可以同时处理多个时区，并且提供
# 了复杂的历法操作功能，支持工作日、周末以及假期。



# 类型转换：is.datatype()/as.datatype()


# 排序
cars <- mtcars[order(mtcars$carb),]
attach(mtcars)
  cars <- mtcars[order(carb,-mpg),]
detach(mtcars)
  
  
# 数据集的合并
# cbind()直接合并，不需要指定一个公共索引
# merge()按照公共索引合并（内连接）
f1 <- data.frame(c(1:3),c("bob","jimmy","korn"))
# rename frame's column name
colnames(f1) <- c("id","name")
# another frame
f2 <- data.frame(c(1:3),c(25,30,58))
colnames(f2) <- c("id","age")
# merge 2 based on id
combained <- merge(f1,f2,by= "id")
# 添加行（纵向连接）使用rb
# 使用下标选择
newdata <- mtcars[, c(3:4)]
# 丢弃变量
myvars <- names(mtcars) %in% c("hp","mpg","gear")
newdata <- mtcars[!myvars]
newdata <- mtcars[c(-5,-6)]
mtcars$mpg <- mtcars$cyl <- NULL


# 选入观测
attach(leadership)
# which()给出下标
newdata <- leadership[which(gender=='M' & age >30),]
detach(leadership)
# subset()是选择变量最简单的方法
newdata <- subset(leadership,age>=35 | age <24, select = c(q1,q2,q3,q4))
newdata <- subset(leadership,age>=35 | age <24, select = gender:q4)


# 随机抽样(sample())
newdata <- mtcars[sample(1:nrow(mtcars),3,replace = FALSE),]