#------ Script during lecture:
#Day 1 Intro to R

##-------------------
#working directory:
##-------------------

#check the current working directory
getwd()

# set the working directory in the folder where we want to load/save data 
setwd("~/Desktop/KVN2021/Course/IntrotoR")


##--------------------
#    Help page:
##-------------------
?round
#help(round)

round(x=20.53647484, digits=3)


##-----------------
# Package, functions are stored in units (packages)
##----------------
install.packages("Publish")

?univariateTable

#we first need to load the package in the current work
library(Publish)

# check R version and the attaches packages
sessionInfo()



##--------------------
#   Data type:
##-------------------
#initialize variables

#shortcut for <- :  "Alt - "

a<-1L
a

d<-1
typeof(a)
typeof(d)

b<-0.6

c<-"0.3"

#check their type
typeof(a)
typeof(b)
typeof(c)

d<-as.integer(d)
typeof(d)

typeof(b)
b<-as.character(b)
typeof(b)

c
c<-as.numeric(c)

typeof(c)

#is b numeric? TRUE/FALSE
is.numeric(c)

f<-"0,3"
f<-as.numeric(f)
f

##--------------------
#   vectors:
##-------------------


#Vectors: c(, , , )

v1<-c(0,0.3,7,20)

v2<-c("Male","Female")

v2<-c("Male","Female")

v3<-c(TRUE,FALSE,FALSE)

typeof(v1)
typeof(v2)
typeof(v3)

length(v1)
v1
length( v2 )
v2


#Create a Vector of IDs (sequence of integers from a to b)
IDs<-1:10
IDs

length<-0.5:2
length



ID<-seq(1,10)
ID

seq(1,10, by=0.1)

weight<-seq(0.5,0.7, by=0.1)
weight

weight<-seq(0.5,0.7, length.out=4)
weight


#create a vector with repeated numbers:

v1<-rep(0,3)
v1


c(0,1)

v2<-rep(c(0,1),2)
v2

vec<-c(0,1)
rep(vec, c(2,2))

v3<-rep(c(0,1), c(2,5) )
v3



# Access to vectors:

v1<-c(0,0.3,7,20)
v1

v1[2]

v1[-1]

v1[-c(1,2)]
2:4

v1[2:4]




#we are going over the dimension of the vector:
v1[5]

length(v1)


# By condition:
v1

v1>2

ind<-v1>2


v1[ind]

#select only where the condition is TRUE:
v1[v1>2]

v3<-c("B","A", "C" ,"C", "C", "C", "B", "C", "B", "B") 

v3 %in% c("A","C")

v3[v3 %in% c("A","C")]

#none is resepcted
v3[v3 %in% c("a","c")]

##-----------------------
#   operation with vectors:
##-----------------------

a<-1:3
b<-3:5

a
b

# operation by element:
a+b
a*b

#operation on the all vector:
a
sum(a)


sum(a+b)
a
prod(a)

# vectorial product
a %*% b

##-----------------------
#  comparison operators:
##-----------------------

sex<-c("female","male","male","female")

sex == "female"

sex = "female"
sex
## 


income<-c("low","low","medium","high","medium","high")
(income %in% c("low","high"))

!(income %in% c("low","high"))

income!="low"

(income=="low" |  income=="high")


a<-1:10
a
a[a>=3 & a<=5]


##--------------------
#   Matrix:
##-------------------

# Create a Matrix 
m1<-matrix(c(1,2,3,4,5,6), nrow=2)
m1

m2<-matrix(c(1,2,3,4,5,6), nrow=3, byrow = TRUE)
m2

# rbind and cbind:
v1<-c(0,0.3,7,20)
v2<-c(1,4,3,5)


v1
v2
rbind(v1,v2)
cbind(v1,v2)

v3<-1:5
v4<-1:3

v3
v4
rbind(v3,v4)

# Warning on the dimensions
rbind(v1,v2,v3)
rbind(v1,v2,v4)

# Warning on the dimensions
cbind(v1,v2)
cbind(v1,v2,v3)
cbind(v1,v2,v4)

# Access a Matrix:

m1
#second column
m1[ ,2]
#second row
m1[2,]

#second element of second row:
m1[2,2]

#By condition:
m1[m1>2]
#we can substitute these values:
m1[m1>2]<-0

m1


dim(m1)
nrow(m1)
ncol(m1)
m1

rownames(m1)
rownames(m1)<-c("A","B")
m1

m1["A",]


colnames(m1)

colnames(m1)<- c("1a","2a","3a")
m1

#ERROR
rownames(m1)<- c("1a","2a","3a")


##--------------------
#   data.frame
##-------------------

db1<-data.frame(id=c(1,2,3),
                sex=c("Male","Female","Male"),
                age=c(46,53,38))

ID=1:10
sex=rep(c("M","F"),5)
data<-data.frame(ID, sex)

# creating a new data with the treatment column
Treatment=c("A","B","A")
db2<-data.frame(db1,Treatment)


#--- access 
db1

db1$sex

db1[,2]

#--dimension
dim(db1)

#change name of columns:
colnames(db1)
colnames(db1)<-c("pnr","sex","age")
colnames(db1)

colnames(db1)[1]<-"id"

db1

db2<-data.frame(id=1:100, 
                sex=rep(c("Female","Male"),50), 
                age=rnorm(100,40,10))

db2
head(db2)
tail(db2)

#ERROR
db1$ID

##--------------------
#  list
##-------------------

family<-list(n=3, 
             kids=data.frame(id=c(1,1,2,3), 
                             age=c(6,10,8,4), 
                             IQ=c(97,101,103,102)),
             
             mother=data.frame(id=c(1,2,3), smoker=c("Yes","No","Yes"))
)

family

#Access to a list

family[1]

family["n"]

family$kids


length(family)

str(family)





###-----------------------
#  Missing
##-----------------------:


sex<-c("female",NA,"male","male","NA","female")

is.na(sex)

0/0


height<-NULL
height

db1

db1$Sex




##-----------------------
#  Factors
##-----------------------
income<- c("low","low","high","medium","low","high","medium")
typeof(income)
income[1:3]

as.factor()
income2<-factor(income)
income2[1:3]

income2<-factor(income, levels=c("low","medium","high"), 
                labels = c("L","M","H"))
income2[1:3]




###-----------------------
#  Conversion and Coercion
##------------------------

weight<-c(10L,15L,27L,18L,22L)
typeof(weight)
weight[2]<-25.4
weight
typeof(weight)

weight<-c(2,3,6,8,9)
typeof(weight)

weight2<-as.integer(weight)
typeof(weight2)

as.character(weight)


c(0,1,FALSE,TRUE)

c("low","high",2)

c(1,1,"3")

as.numeric(c("0.4","0.2","0,1"))



#------------------
# Manipulating data set (Part1)
#-------------------------
set.seed(100)
db1_ex<-data.frame(ID=rep(1:25,2), 
                   year=rep(c(2000,2002), 25),
                   weight=rnorm(50,60,5),
                   height=rnorm(50,1.70,0.05))


dim(db1_ex)
head(db1_ex)
tail(db1_ex)

str(db1_ex)

summary(db1_ex)

#create new variable:
db1_ex$BMI

# weight<-db1_ex$weight
# height<- db1_ex$height
# 
# ppp <- weight/height^2
# BMI
# db1_ex$BMI<-ppp


db1_ex$BMI<- db1_ex$weight/(db1_ex$height)^2

#NB: you need to specify that the variable is in the data frame
# if we do: 
log.weight<-log(weight)

# it is not finding the variables
# or if we do
log.weight<- log(db1_ex$weight)
# then we saved it in log.weight which IS NOT in db1_ex
# we need to use db1_ex$
head(db1_ex)

db1_ex$log.weight<- log(db1_ex$weight)
head(db1_ex)


#--- dremove a variable
db2<-db1_ex[,-1]
head(db2)

db2<-db1_ex[, 2:ncol(db1_ex)]
head(db2)

db2<-db1_ex
db2$ID<-NULL
head(db2)


dim(db1_ex)


### subsetting by condition
subset(db1_ex, BMI<19)


db3<-subset(db1_ex, BMI<19)
db4<-subset(db1_ex, year==2000)
dim(db4)

dim(db3)


# from numerical to binary: ifelse
db1_ex$BMI.cat<-ifelse(db1_ex$BMI<20,"underweight","normal") 

head(db1_ex)

# cut (for more categories)
db1_ex$BMI.cat2<-cut(db1_ex$BMI, breaks=c(15,20,30), 
                     labels=c("underweight","normal"))

head(db1_ex$BMI.cat2)

table(db1_ex$BMI.cat2)           

db1_ex$BMI.cat2<-cut(db1_ex$BMI, breaks=c(14,20,24,28),
                     labels = c("underweight","normal","overweight"))
     

#combining groups:
db1_ex$BMI.cat2[db1_ex$BMI.cat2=="overweight"]<-"normal"
table(db1_ex$BMI.cat2)
db1_ex$BMI.cat2
db1_ex$BMI.cat2<-droplevels(db1_ex$BMI.cat2)
summary(db1_ex$BMI.cat2)

#--------------------
# Descriptives
#-------------------

table(db1_ex$BMI.cat,db1_ex$year)

table(db1_ex$weight>60)

table(db1_ex$weight>60, useNA="ifany")

table(db1_ex$weight>60,db1_ex$year,useNA="ifany")

mean(db1_ex$height)

mean(db1_ex$height, na.rm=TRUE)

min(db1_ex$height, na.rm=TRUE)
max(db1_ex$height, na.rm=TRUE)
median(db1_ex$height, na.rm=TRUE)

summary(db1_ex$height)

quantile(db1_ex$BMI)
quantile(db1_ex$BMI, c(0.25,0.75))


tapply(db1_ex$weight, db1_ex$BMI.cat, mean, na.rm=TRUE)
aggregate(weight ~ BMI.cat, data=db1_ex, FUN=mean, na.rm=TRUE)




#rm(list = ls())




