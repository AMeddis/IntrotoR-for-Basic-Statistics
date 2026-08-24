sund <- read.csv(file="https://raw.githubusercontent.com/AMeddis/IntrotoR-for-Basic-Statistics/refs/heads/main/data_exercise/sundby_clean.csv")
summary(sund)
colnames(sund)
colnames(sund)<-c("physical_activity","alcohol_intake", "sex","weight","height")
sund$weight_num<-as.numeric(sund$weight)

sum(sund$weight=="") 
sum(is.na(sund$weight_num))

which(sund$weight!="" & is.na(sund$weight_num))


sund[85, ]
sund[99, ]
sund[c(85,99), ]
# find records where we have missing but not "blanks" and print them
sund[which(sund$weight!="" & is.na(sund$weight_num)), ]
# found two places where commas where used - changing them
sund[c(85,99),]$weight<-c(84.5,79.5)
# re-derive weight_num so the fix actually propagates to BMI below
# (it was computed from the old, uncorrected $weight)
sund$weight_num<-as.numeric(sund$weight)

table(sund$sex)
tapply(sund$height, sund$sex, FUN=median, na.rm=TRUE)
aggregate(height ~ sex, data=sund, FUN=median, na.rm=TRUE)

sund$sex<-factor(sund$sex, levels=c(1,2), labels=c("M","F") )

aggregate(height ~ sex, data=sund, FUN=median, na.rm=TRUE)

sund$physical_activity_factor<-factor(sund$physical_activity, levels=1:4, labels=c("max","medium","low","minimal"))

table(sund$physical_activity)
table(sund$physical_activity_factor)

aggregate(height ~ physical_activity_factor, data=sund, FUN=median, na.rm=TRUE)

sund$BMI <- sund$weight_num / (sund$height/100)**2 

aggregate(BMI ~ physical_activity_factor, data=sund, FUN=median, na.rm=TRUE)
