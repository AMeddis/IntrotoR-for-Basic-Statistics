#----------------------------------------------------
# Exercise 2
#----------------------------------------------------------------------
# Data for individuals randomized into two groups "A" and "B"
# where a biomarker has been collected  at baseline (measure 0), 
#                                       6 months (measure 1),  
#                                       12 months (measure 2)
#-----------------------------------------------------------------------
#----------------------
# Create DATA: 
# db_ex1: data for biomarker collection
# db_ex2: data for individual characteristics
#
# Run the commands to create the data.frame:
#----------------------
set.seed(456)
group<-rep(c("A","B"), 10)
m0<-rnorm(20, 15,3)
m1<-m0 - rnorm(20,4,1)*(group=="A") + rnorm(20,2,0.05)*(group=="B")
m2<-m1 - rnorm(20,2,0.1)*(group=="A") + rnorm(20,1,0.05)*(group=="B")

db_ex1<-data.frame(patID=1:20, measure0=m0,measure1=m1,measure2=m2)

db_ex2<- data.frame(patID=1:20, sex=rep(c("M","F"), c(10,10)), 
                    age=runif(n=20, min=20, max=30),
                    group)

#------------------------------------------------------------------------
#                             Question 1
# transform db_ex1 into the long format with variables:
#   - "biomarker" for the values of the measurement
#   - "visit" for the time of measurement with values: 0,6,12
#-------------------------------------------------------------------------

db_long<-reshape(db_ex1,direction="long",
                 idvar="patID",
                 varying=paste0("measure",0:2,"",sep=""),
                 v.names="biomarker", timevar="visit", times=c(0,6,12))

#------------------------------------------------------------------------
#                             Question 2
# merge the created long version of the data with db_ex2
#-------------------------------------------------------------------------

dbb<-merge(db_long,db_ex2,by="patID")


#------------------------------------------------------------------------
#                             Question 3
# Create two data frames: one for each group A/B (subset)
#-------------------------------------------------------------------------
groupA<-subset(dbb, group=="A")
groupB<-subset(dbb, group=="B")

#------------------------------------------------------------------------
#                             Question 4
# Calculate the mean of the biomarker value in each group by visit (save results)
#-------------------------------------------------------------------------

meanA<-aggregate(biomarker~visit,groupA, FUN=mean)
meanB<-aggregate(biomarker~visit,groupB, FUN=mean)

#by tapply:

meanA2<-tapply(groupA$biomarker, groupA$visit, mean)
meanB2<-tapply(groupB$biomarker, groupB$visit, mean)

#------------------------------------------------------------------------
#                             Question 3
#  Plot the means across visits in red for group A and in blue for group B
#  ADD the legend
#-------------------------------------------------------------------------

# using the results from aggregate: meanA and meanB are data.frame
plot(meanA$visit,meanA$biomarker, col="blue", ylim=c(8,22), xlab="visit", ylab="average biomarker value", pch=2)
points(meanB$visit, meanB$biomarker, col="red", pch=2)

#using the results from tapply: meanA2 and meanB2 are vectors
plot(c(0,6,12), meanA2, col="blue", ylim=c(8,22), xlab="visit", ylab="average biomarker value", pch=2)
points(c(0,6,12), meanB2, col="red", pch=2)

