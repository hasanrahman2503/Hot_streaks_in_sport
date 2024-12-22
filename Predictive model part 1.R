data = read.csv("Pastmatches.csv", header = TRUE)
model<-glm(result~matchresult1,data=data,family = "binomial")
summary(model)
