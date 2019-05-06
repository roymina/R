# data types: vector,maxtrix,array,frame,factor,list

# vector
a<- c(1,2,3,4,5,6)
a[1:3]
a[c(1,2,3)]

# matrix
# myymatrix <- matrix(vector, nrow=number_of_rows, ncol=number_of_columns,
#    byrow=logical_value, dimnames=list(
#    char_vector_rownames, char_vector_colnames))
#其中 vector 包含了矩阵的元素， nrow 和 ncol 用以指定行和列的维数， dimnames 包含了可选的、
#以字符型向量表示的行名和列名。选项 byrow 则表明矩阵应当按行填充（ byrow=TRUE ）
#还是按列填充（ byrow=FALSE ），默认情况下按列填充。代码清单2-1中的代码演示了 matrix
#函数的用法。

rnames <- c("row1","row2","row3","row4","row5")
cnames <- c("col1","col2","col3","col4")
b <- matrix(1:20,nrow=5,ncol = 4,byrow = TRUE,dimnames = list(rnames,cnames))
b[,1]
b[,c(1:4)]
b[2,]
b[2,3]


# array
# myarray <- array(vector, dimensions, dimnames)
# 数组（array）与矩阵类似，但是维度可以大于2。数组可通过 array 函数创建
# 其中 vector 包含了数组中的数据， dimensions 是一个数值型向量，给出了各个维度下标的最大
# 值，而 dimnames 是可选的、各维度名称标签的列表。

dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
# 创建一个维度为（2，3，4）的数组，将1-24数字填写其中
z <- array(1:24, c(2,3,4),dimnames = list(dim1,dim2,dim3))


# data frame
# 数据框和矩阵类似，但不同的列可以包含不同模式的数据，是R中最为常用的数据结构
# mydata <- data.frame(col1, col2, col3,...)

patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)

patientdata[1:3]
patientdata["age"]
patientdata[c("diabetes", "status")]
patientdata$diabetes

table(patientdata$diabetes, patientdata$status)
# attach() 、 detach() 和 with()
# attach(),detatch()为了避免多次写变量
attach(patientdata)
  summary(age)
  plot(age,patientID)
detach(patientdata)
# 可以看到attach中如果使用已经存在的变量名将会引起mask错误
# 为避免这种状况，使用with
with(patientdata,{
  agesum <- summary(age)
  print(agesum)
  })
# 如果在with语句外使用内部定义的变量将会报错
agesum
# 解决办法是使用<<-赋值语句
with(patientdata,{
  agesum <<- summary(age)
  print(agesum)
})
agesum

# 使用rwo.names指定实例标识符(id)
patientdata <- data.frame(patientID, age, diabetes, status,row.names = patientID)



# factor
# 变量可以归结为名义型、有序型、和连续型变量，其中，前两种在R中称为因子
diabetes <- factor(c("tp1","tp2","tp1"))
str(diabetes) # Factor w/ 2 levels "tp1","tp2": 1 2 1
class(diabetes) # "factor"
diabetes <- c("tp1","tp2","tp1")
str(diabetes) # chr [1:3] "tp1" "tp2" "tp1"
class(diabetes) #  "character"
# 使用ordered=TRUE表示有序排列
letters <- factor(order(letters, decreasing = T) )
letters <- factor(order(letters, decreasing = T) ,ordered = T)
# 使用levels和labels编码

gender <-  c("F","M","M","F","F","M")
gender_fac <- factor(gender, levels = c(1,2), labels = c("M","F"))
str(gender_fac)

# list
# 列表允许你整合若干（可能无关的）对象到单个对象名下
# mylist <- list(name1=object1, name2=object2, ...)
g <- "My First List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")

mylist <- list(title=g, data=h,j,k)
mylist[2]
mylist[[2]]
mylist[2[2]]
