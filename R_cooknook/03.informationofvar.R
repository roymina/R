x <- 6
n <- 1:4
letters <- LETTERS[1:4]
df <- data.frame(n,letters)

# 列出当前所有变量
ls()
# Check if a variable named "x" exists
exists("x")

rm(x)
# Get information about structure
str(df)
length(n)
nrow(df)
ncol(df)
# get rows and columns count
dim(df)
