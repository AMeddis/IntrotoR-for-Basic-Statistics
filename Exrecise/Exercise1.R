#set your working directory
setwd("~/Desktop/KVN2021/Course/IntrotoR")

#Exercise 1 (Build in)


set.seed(10)
db_ex1<-data.frame(id=1:10, treatment=rep(c("A","B"), 5), 
                         weight0=seq(56,90, length.out=10), weight3=seq(58,87, length.out=10),
                         age=sample(15:30, 10, replace=TRUE),height=seq(1.55,1.70, length.out=10))

db_ex1

bmi<-db_ex1$weight0/(db_ex1$height)^2
summary(bmi)

typeof(db_ex1$treatment)
trt2<-factor(db_ex1$treatment)
trt2

db_ex1<-data.frame(db_ex1, BMI=bmi,trt.factor=trt2)

dim(db_ex1)

## BMI > 25??
bmi>25
which(bmi>25)
bmi[bmi>25]
#TRUE=1/FALSE=0
sum(bmi>25)



# assign weight and height (in m) to 5 people (reasonable)
# 3 solutions: 
#1. assign it  yourself
weight1=c(60,73,58,84,66)
height1=c(1.56,1.75,1.55,1.62,1.50)
#2. assign it using seq (note: they will be ordered)
weight2=seq(60,80, length.out=5)
height2=seq(1.59,1.94,length.out=5)
#3. assign it random (less control)
set.seed(222)
weight3=sample(60:80,5, replace=TRUE)
height3=sample(160:195,5,replace=FALSE)/100

#calculate BMI: (operation with vectors)
BMI=weight2/(height2)^2
#healthy range is 18.5-25
summary(BMI)
#healthy people:
#vector extraction:
#condition:
(BMI>18.5 & BMI<25)
BMI[BMI>18.5 & BMI<25]
#OR:
index<-which(BMI>18.5 & BMI<25)
index
BMI[index]


  
#assign sex using the function Sample
sex<-sample(c("M","F"), 5, replace=TRUE)

#extract BMI of females:
BMI[sex=="F"]

#create a data.frame with the 4 vectors:
dbex1<-data.frame(weight=weight2,height=height2, BMI=BMI, sex=sex)
#create a new variable for cateogries of BMI cutting it in a sensible way depending on what you got:
#using the cut function (see ?cut if needed)
#check the BMI distribution 
summary(dbex1$BMI)
dbex1$BMIcat<-cut(dbex1$BMI, breaks=c(20,22,23,30), labels=c("low","medium","high"))
#same principle
dbex1$BMIcat<-cut(dbex1$BMI, breaks=c(min(dbex1$BMI),22,23,max(dbex1$BMI)), labels=c("low","medium","high"), include.lowest = TRUE)
#instead if we want 3 intervals exactly splitted:
dbex1$BMIcat<-cut(dbex1$BMI, breaks=3, labels=c("low","medium","high"))









