amh <- read.csv("amh.csv")
summary(amh)

table(amh$bmi)
table(amh$pill)

amh$bmi<-factor(amh$bmi)
amh$pill<-factor(amh$pill)

prop.table(table(amh$pill))
table(amh$bmi, amh$pill)
table(amh$smoking, amh$pill)
#proportion of smokers among users:
48/(180+48)
#proportion of smokers among non-users:
103/(103+401)

amh$logamh<-log(amh$amh)

hist(amh$logamh, col="pink", xlab="log(AMH)", main=" ")
hist(amh$logamh, col="pink", xlab="log(AMH)", main=" ", probability = TRUE)
lines(density(amh$logamh))

hist(amh$amh, col="pink", xlab="AMH", main=" ", probability = TRUE)
lines(density(amh$amh))

aggregate(logamh~pill, amh, FUN=mean)
diff<-2.912 - 2.853
diff

percentagediff <- (exp(diff)-1)*100
percentagediff

boxplot(logamh~pill, amh)

boxplot(age~pill, amh)

plot(amh$age,amh$logamh, xlab="Age", ylab="AMH-log scale")
abline(lm(logamh~age, amh),col="blue", lwd=2)

median(amh$age)


amh$age_cat<-cut(amh$age, breaks=c(-Inf,32,Inf), labels=c("<=32",">32"))

table(amh$age_cat)

aggregate(logamh~ pill + age_cat, amh, FUN=mean)

boxplot(logamh~pill+age_cat, amh, col=amh$pill)

plot(amh$age, amh$logamh, xlab="Age",ylab="AMH-log scale")
abline(lm(logamh~age, data=subset(amh, pill=="yes")), col="blue",lwd=2)
abline(lm(logamh~age, data=subset(amh, pill=="no")), col="green",lwd=2)
legend("bottomleft", c("yes","no"), col = c("blue","green"), title="contraceptive", lty=1)


