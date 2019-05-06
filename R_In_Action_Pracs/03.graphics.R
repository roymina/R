stus
attach(stus)
  plot(Science,Math)
  abline(lm(Math~Science))
  title("students math vs science")
  
# save
jpeg("cars.jpg")
plot(cars$speed,cars$dist) 
dev.off()

# everytime new
dev.new()
plot(cars)
dev.new()
plot(cars)
dev.off()

# advance
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

plot(dose, drugA, type="b")

opar <- par(no.readonly = T)
par(font.lab=3, cex.lab=2, font.main=4, cex.main=6)
plot(dose, drugA, type="b")
par(opar)

#use RColorBrewer
library(RColorBrewer)
opar <- par(no.readonly = T) 
mycolors <- brewer.pal(n, "Set1")
barplot(c(1:10), col=mycolors)
 