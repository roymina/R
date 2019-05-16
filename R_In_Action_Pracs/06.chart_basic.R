# 条形图
# 条形图通过垂直的或水平的条形展示了类别型变量的分布（频数）。函数 barplot() 的最简单用法是：
# barplot(height)
# 其中的 height 是一个向量或一个矩阵。
barplot(c(1:10))
# vcd包中含有数据
library(vcd)
# table函数表格化
counts <- table(Arthritis$Improved)
barplot(counts,main = "Simple bar plot",xlab = "Improvement", ylab = "Frequency")
barplot(counts,main="Horizontal Bar Plot", xlab = "Frequency",ylab = "Improvment",horiz = T)
# 如果是因子，就直接可以绘制，无需表格化
plot(Arthritis$Improved, main="Simple Bar Plot", xlab="Improved", ylab="Frequency")

# height 是一个矩阵将绘制堆砌条形图
counts <- table(Arthritis$Improved,Arthritis$Treatment)
# 堆砌条形图
barplot(counts,
        main="Stacked Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow","green"),
        legend=rownames(counts))
# 分组条形图
barplot(counts,
        main="Grouped Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts), beside=TRUE)

# 棘状图
attach(Arthritis)
counts <- table(Treatment,Improved)
spine(counts,main="Spinogram Example")
detach()

#直方图 hist()，通过在x轴上将值域分割为一定数量的组，在y轴上显示相应值的频数，展示了连续型变量的分布
# 制定外观函数par，A vector of the form c(nr, nc).
par(mfrow=c(2,2))
hist(mtcars$mpg)
hist(mtcars$mpg,
     freq=FALSE,
     breaks=12,
     col="grey",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")
# 添加轴须图rug plot
# 轴须图是实际数据值的一种一维呈现方式。如果数据中有许多结①你可以使用jitter将轴须图的数据打散：
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col="black", lwd=2)

# 正态密度曲线和外框
x <- mtcars$mpg
h<-hist(x,
        breaks=12,
        col="red",
        xlab="Miles Per Gallon",
        main="Histogram with normal curve and box")
xfit<-seq(min(x), max(x), length=40)
yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
box()


# 核密度图plot(density(x))
d <- density(mtcars$mpg)
plot(d)
# 在曲线下方绘制多边形
polygon(d, col="red", border="blue")
# 添加轴须图
rug(mtcars$mpg, col="brown")
# 使用 sm 包中的 sm.density.compare() 函数可向图形叠加两组或更多的核密度图
library(sm)
attach(mtcars)
# 创建分组因子
cyl.f <- factor(cyl,levels=c(4,6,8),labels = c("4 cylinder", "6 cylinder", "8 cylinder"))
# 绘制密度图
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")
# 通过鼠标单击添加图例.第一个参数值 locator(1) 表示用鼠标点击想让图例出现的位置来交互式地放置这个图例
colfill<-c(2:(1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)
detach(mtcars)


# 箱线图 boxplot(formula, data=dataframe)
# formula 是一个公式， dataframe 代表提供数据的数据框（或列表）。
# 一个示例公式为 y ~A ，这将为类别型变量 A 的每个值并列地生成数值型变量 y 的箱线图。
# 公式 y ~ A*B 则将为类别型变量 A 和 B 所有水平的两两组合生成数值型变量 y 的箱线图。
# 参数 varwidth=TRUE 将使箱线图的宽度与其样本大小的平方根成正比
boxplot(mpg~cyl, data = mtcars,
        varwidth=TRUE,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

# 通过添加 notch=TRUE ，可以得到含凹槽的箱线图。若两个箱的凹槽互不重叠，则表明它们的中位数有显著差异
boxplot(mpg ~ cyl, data=mtcars,
        notch=TRUE,
        varwidth=TRUE, 
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

# 可以为多个分组因子绘制箱线图
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels=c(4,6,8),
                       labels=c("4","6","8"))
mtcars$am.f <- factor(mtcars$am,
                      levels=c(0,1),
                      labels=c("auto", "standard"))
boxplot(mpg ~ am.f *cyl.f,
        data=mtcars,
        varwidth=TRUE,
        col=c("gold","darkgreen"),
        main="MPG Distribution by Auto Type",
        xlab="Auto Type", ylab="Miles Per Gallon")


# 点图dotchart(x, labels=)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=.7,
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")
# 分组、排序、着色后的点图
x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")