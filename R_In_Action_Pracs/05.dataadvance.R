#数学计算
# abs()
# sqrt()
# ceiling()
# floor()
# trunc()
# round(3.475，digits=2) => 3.48
# signif(3.475，digits=2) => 3.5 
# cos()
# sin()
# tan()
# acos()
# asin()
# atan()
# cosh()
# sinh()
# tanh()
# acosh()
# asinh()
# atanh()
# log(x, base=n)
# log(x)
# log10(x)
# exp(x) 指数

# 统计
# mean()
# median()
# sd()
# var() 方差
# mad() 绝对中位差
# quantile(x, probs) 求分位数，x为数值型向量，probs 为一个[0,1]之间的概率值组成的数值向量
# range() 值域
# sum()
# diff(x,lag = n) 滞后差分，log：滞后几项默认=1
# min()
# max()
# scale(x,center = T,scale = T) 为数据对象 x 按列进行中心化 (center=TRUE) 或标准化 (center=TRUE,scale=TRUE)
x<-c(1:99)
mean(x)
sd(x)


# 概率

x <- pretty(c(-3,3), 30)
y <- dnorm(x)
plot(x, y,
     type = "l",
     xlab = "Normal Deviate",
     ylab = "Density",
     yaxs = "i"
)
