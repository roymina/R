#Sometimes your data will include NULL, NA, or NaN
# Null 意为真正的空，nothing，NA和NaN不是真空，有值，只不过值不可用
x <- NULL
x >5
y <- NA
z <- NaN

is.null(x)
is.null(y)
is.null(z)


#Ignoring “bad” values in vector summary functions
vy <- c(1,2,3,NA,5)
mean(vy)
mean(vy,na.rm = T)

vz <- c(1, 2, 3, NaN, 5)
# 1   2   3 NaN   5
sum(vz)
# NaN
sum(vz, na.rm=TRUE)
# 11


# NULL isn't a problem, because it doesn't exist
vx <- c(1, 2, 3, NULL, 5)
# 1 2 3 5
sum(vx)
# 11


# Removing bad values from a vector
vy[ !is.na(vy) ]
