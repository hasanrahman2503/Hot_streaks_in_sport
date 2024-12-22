data = read.csv("Pastmatches.csv", header = TRUE)
model<-glm(result~matchresult1+matchresult2+matchresult3+matchresult1:matchresult2+matchresult1:matchresult2:matchresult3,data=data,family = "binomial")
summary(model)

