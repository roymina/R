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

opar <- par(no.readonly = T,col="red")
par(lty=3,pch=23,lwd=3)
plot(dose, drugA, type="b")
par(opar)