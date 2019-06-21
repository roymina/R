rm(list = ls())

#######replacation######
#rep和replicate一样
rep(runif(1), 5)
replicate(5, runif(1))

####xpply家族###########33

# lapply , 作用于list，返回作用后的新list
list = list(one = 1,
            two = c(2, 2, 2),
            three = 1:10)
lapply(list, unique)

# lapply , 作用于list，返回vector,它一定需要第三个参数
# 即返回值的模板
vapply(list, length, numeric(1))

# sapply， 介于lapply和vapply之间，
# 其含义为：简化列表应用，它不需要模板，会尽可能的匹配
# 但正因为如此，其返回值是不可预测的，可能是列表，也可能是向量
sapply(list, length)
sapply(list(), length) # 返回list()

# 遍历文件夹下的所有R脚本并执行
scripts = dir(pattern = "\\.R$")
lapply(scripts, source)

# 以上所有xapply函数都能作用于向量
# 如果xapply的函数部分需要传额外的参数，紧跟逗号后传入即可
# 注意：这只适用于向量参数（下面例子里的1:5）是第一个参数的情况
lapply(1:5, rep.int, times = 3)
# 如果向量参数不是第一个，就需要自定义函数封装
lapply(1:5, function(x) {
  rep.int(4, times = x)
})

#eapply遍历环境列表
env = new.env()
env$ltes = letters
eapply(env, length)

# rapply是lapply的递归版本，但一般使用unlist扁平化列表后操作

######apply###########
# 所有的xapply函数都是将传入的列表或向量（x）打散，按照列来逐一执行的
# 如果想按行执行遍历操作，该怎么做呢？
# 为举例说明，先用matlab包生成一个4×4方阵
if (!require("matlab"))
  install.packages("matlab")
library(matlab)
magic4 = magic(4)
# 可使用rowSums计算行的总数
rowSums(magic4)
# 如何统计每行数据？答案是使用apply函数
# apply(a,b,c)
# a: 一般是一个matrix,也可以是数据框，但比较少见，因为数据框各列数据类型可以不同
# b: 应用于：1：应用于每一行2:每列，更大的数字表示更高的维度
# c:函数
apply(magic4, 2, summary)

#当对数据框按照列应用apply函数，其作用与sapply一样
# 因为sapply会自动决定返回类型，这种情况下它会返回数据框（数据框是非嵌套的列表）
sapply(magic4, summary)

a <- data.frame(1:14)
b <- data.frame(15:30)
mapply(summary, a, b)


# split-apply-combine
scores =  data.frame(player = rep(c("tom", "dick", "karry"), times = c(2, 5, 3)),
                     score = round(rlnorm(10, 8),-1))

# split 将数据框拆分成3个元素的列表
# split(x, f, drop = FALSE, ...)
# x:vector or dataframe
# f: x中的因子，上例中，player是因子
# drop： if levels that do not occur should be dropped (if f is a factor or a list).
scoreByPlayer = with(scores,
                     split(score, player))

# apply
scoreMean = lapply(scoreByPlayer, mean)

# combine
# 最后一步是把结果合并到单个向量中
result = unlist(scoreMean)
# dick    karry      tom
# 4124.000 4126.667 2110.000

######tapply#######
###一次性执行上述三个步骤
result = with(scores,
              tapply(score,  player, mean))




################ plyr package ############################
# plyr是一系列名为**ply的函数，其中的星号分别代表输入和输出的形式
# 如：llply,list-list; 相同于lapply
library(plyr)
llply(scoreByPlayer, mean)
# laply ： list-vector（注意不是lapply）
laply(scoreByPlayer, mean)
#r开头的raply: 可以取代replicate
raply(5, runif(1)) # 0.90486329 0.07345407 0.04568905 0.54464207 0.75477330
# rlply返回列表
rlply(5, runif(1))
# rdply返回数据框
df = rdply(5, runif(1))
# ddply: 最常用，数据框-数据框，可以替换tapply
# 下面是第一种用法：使用colwise，表示除了.()里面的列以外，对其余列都使用mean方法
# ddply将对数据框自动分组
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)
d1 = ddply(dfx, .(group,sex), colwise(mean))
# group sex      age
# 1     A   F 36.31042
# 2     A   M 34.24761
# 3     B   F 32.15730
# 4     B   M 35.86387
# 5     C   F 40.98684
# 6     C   M 24.91566

#第二种是使用summarize，这时必须手动指定每一列 
d2 = ddply(dfx,.(group),summarize,age_mean = mean(age))
# group age_mean
# 1     A 35.27902
# 2     B 33.88703
# 3     C 35.62978