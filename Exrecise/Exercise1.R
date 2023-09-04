#set your working directory
setwd("~/Desktop/KVN2021/Course/IntrotoR")

#Exercise 1 (Build in)


#create a data.frame
set.seed(10) 
# you set the seed when you want reproducible results and you have some random functions
# in my case, I use the function sample that is randomly sampling 10 numbers from a sequence
# if I do not use the set.seed( ) then every time I run the code, this would be different

#create the data.frame
db_ex1<-data.frame(id=1:10, treatment=rep(c("A","B"), 5), 
                         weight0=seq(56,90, length.out=10), weight3=seq(58,87, length.out=10),
                         age=sample(15:30, 10, replace=TRUE),height=seq(1.55,1.70, length.out=10))

db_ex1

#calculate the bmi
bmi<-db_ex1$weight0/(db_ex1$height)^2
summary(bmi)
#change Treatment into a factor
typeof(db_ex1$treatment)
trt2<-factor(db_ex1$treatment)
trt2

#add these two new columns to the data.frame
db_ex1<-data.frame(db_ex1, BMI=bmi,trt.factor=trt2)

#check the dimension
dim(db_ex1)

# how many people have BMI>25?
## BMI > 25??
bmi>25
which(bmi>25)
bmi[bmi>25]
#TRUE=1 and FALSE=0
sum(bmi>25)

#calculate the difference in weights after three months:
weight_change<-db_ex1$weight3-db_ex1$weight0
#calculate the mean:
sum(weight_change)/10

