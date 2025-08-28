#----------------------------------------------------
# Exercise 3
#----------------------------------------------------------------------
# load the data saved on Wednesday at the end of the day Exercise 2.
load("~/Desktop/KVN2021/Course/IntrotoR/data_exercise/db_join.rda")
# if you cannot find it, use the command: 
#  read.csv("https://raw.githubusercontent.com/AMeddis/IntrotoR-for-Basic-Statistics/refs/heads/main/data_exercise/db_join.csv")
#-----------------------------------------------------------------------

#------------------------------------------------------------------------
# We want to plot the diameter growth over time by treatment group
#-----------------------------------------------------------------------

# 1. Make a boxplot of the diameter change by Day 

boxplot(db_join$diam.change~db_join$Day, ylab="diameter change from 0", xlab="Days")

# 2. Calculate the median change by treatment and Day ( you can use the aggregate)
#     ( store the results in the environment, you would need it for the plot)
median<-aggregate(diam.change ~ Day + Treatment, db_join, FUN=median)

# 2a. Rename the column "diam.change"  with "median.change" of the data.frame obtained by the aggregate 

colnames(median)[3]<-"median.change"

# 2b. Create a plot with the points at the median change from time 0 at varying
#    of days where the color is defined by the treatment group. Add a legend.
median$Treatment<-factor(median$Treatment)
plot( median$Day, median$median.change, col=median$Treatment, xlab="days", ylab="median relative change")
legend("bottomright", levels(median$Treatment), col=1:nlevels(median$Treatment), pch=rep(1,4))
