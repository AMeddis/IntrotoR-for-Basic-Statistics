dbf<-read.csv("https://raw.githubusercontent.com/AMeddis/IntrotoR-for-Basic-Statistics/refs/heads/main/data_exercise/db_follicle.csv")

dbp<-read.csv("https://raw.githubusercontent.com/AMeddis/IntrotoR-for-Basic-Statistics/refs/heads/main/data_exercise/db_patient.csv")


head(dbf)
head(dbp)

summary(dbf)

table(dbf$Patient)
mean(dbf$Day2, na.rm=TRUE)
sd(dbf$Day2, na.rm=TRUE)

db.CC<-na.omit(dbf)

dim(db.CC)
dim(dbf)

mean(db.CC$Day2, na.rm=TRUE)
sd(db.CC$Day2, na.rm=TRUE)

db_long<-reshape(db.CC, direction="long",
idvar="Number",
varying=c("Day0","Day2","Day4","Day6","Day8"),
timevar="Day",v.names=c("diameter"),
times=c("0","2","4","6","8"))

db_all<-merge(db_long, dbp, by="Patient")

db_all$Age_group<-cut(db_all$Age, breaks=c(19,30,35,40))

table(db_all$Age_group)

db0<-subset(db_all, Day=="0")


table(db0$Disease)
prop.table(table(db0$Disease))

prop.table(table(db0$Treatment))

tapply(db0$diameter,db0$Disease,FUN=mean,na.rm=TRUE)

aggregate(diameter ~ Disease, data=db0, FUN=mean, na.rm=FALSE)

day0<-db0[, c("Number","diameter")]
colnames(day0)<-c("Number","diameter0")
db_join=merge(db_all,day0, by="Number")
db_join$diam.change<-db_join$diameter-db_join$diameter0
head(db_join)


save(db_join, file="db_join.rda")
# where is this file ? It is in my working directory
save(db_join, file="C:/Users/pzs913/Documents/db_join.rda")


aggregate(diam.change~ Day, db_join, median)


aggregate(diam.change ~ Day + Treatment, db_join, median)

db_join$diam.Rchange<-db_join$diam.change/(db_join$diameter0)

aggregate(diam.Rchange ~ Day + Treatment, db_join, median)



dbday8<-subset(db_join, Day==8)
aggregate(diam.Rchange~ Treatment, dbday8, median)

dbf$status<-ifelse(is.na(dbf$Day8),0,1)

sum(dbf$status)/nrow(dbf)

db_UCP<-subset(dbf, Treatment=="UCP")
sum(db_UCP$status)/nrow(db_UCP)

db_HSA<-subset(dbf, Treatment=="HSA")
sum(db_HSA$status)/nrow(db_HSA)




