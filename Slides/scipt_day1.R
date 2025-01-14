#------ Script during lecture:
#Day 1 Intro to R

# when coding in R we want to use the script where we can save the code
# so to re-use it the next time. 

# In the script you can comment with "# "
# and if on the line of the code, we can run the line with  "Ctrl + Enter"


##-------------------
# Working directory: when working in R it is important to set the working directory,
#                    which is the folder where we would like to save our work
#                    so that if we create plot, or save the new version of the data
#                    R already knows where to save it.
##-------------------

#check the current working directory
getwd()

# set the working directory in the folder where we want to load/save data 
setwd("~/Desktop/KVN2021/Course/IntrotoR")
# you can also set the working directory using:
# Session-> Set working directory -> Choose directory



##--------------------
#    Function: we can create a function that is doing some specific commands
#              to define a function we need: - the name
#                                            - input arguments (objects we need for the operation)
#                                            - output argument (the result of the operation)
#              Note: In every function, arguments are separated by ","
##-------------------
# Example: 
# calculate the difference a-b
# difference is the name of the function:
difference<-function(a,b){ # a, b are the input arguments
  a-b # a-b is the output 
}

# call the function: 
difference(3,4)
# which is equivalent to write: 
difference(b=4, a=3)

# a and b are usually called: INPUT ARGUMENTS
# if we do not precise what each value corresponds to, then R consider the order as it is defined

# The person who coded the function decides NAMES and ORDER for the input arguments: 
# we could also change this as: 

difference<-function(first,second){
  first-second
}

# then we have: 
difference(first=3, second = 4)

a<-3
b<-4

# this will work because a is equal to 3 and b equal to 4
difference(a,b)
# but f we write:
difference(a=3, b=4)
# then it is looking for input arguments with names a and b
# and it gives an error






##--------------------
#    Help page: we can check pre-coded functions
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
#   Data type: variables in R can be of different types and this often matters when we want to do operations on/with variables
##-------------------

#initialize variables: we save the variable in the encvironment, so that we can use it later

#shortcut for <- :  "Alt - "

a<-1

b<-0.6

c<-"0.3"

#check their type
typeof(a)
typeof(b)
typeof(c)

# we can change type:
b<-as.character(b)
typeof(b)

c
c<-as.numeric(c)
typeof(c)

#is b numeric? TRUE/FALSE
is.numeric(c)

## BE CAREFULL: R does not recognize numbers with "," and be default provides an NA: Not Available
f<-"0,3"
f<-as.numeric(f)
f

##--------------------
#   vectors: 1 dimension collection of elements of the same type
##-------------------


# Create a Vector: c(, , , )

v1<-c(0,0.3,7,20)

v2<-c("Male","Female")

v3<-c(TRUE,FALSE,FALSE)


typeof(v1)
length(v1)


## creating Vectors:
#-------------
# : Create a Vector of IDs (sequence of integers from a to b with step equal to 1)
IDs<-1:10
IDs

length<-0.5:2
length
#-------------

#-------------
# seq: Create a sequence from a to b with step equal to 1
ID<-seq(1,10)
ID

# the input argument "by" indicates the step, if not specified it is equal to 1
seq(1,10, by=0.1)

weight<-seq(0.5,0.7, by=0.1)
weight

# length.out is the input argument that specifies the length of the vector
weight<-seq(0.5,0.7, length.out=4)
weight
#--------------

#--------------
# rep: Create a vector with repeated numbers:

v1<-rep(0,3)
v1

c(0,1)

v2<-rep(c(0,1),2)
v2

vec<-c(0,1)
rep(vec, c(2,3))
#-----------------



# Access to vectors: One dimension

v1<-c(0,0.3,7,20)
v1

v1[2]

# everything but first element
v1[-1]

# element from 2 to 4
v1[2:4]

#we are going over the dimension of the vector:
v1[5]

length(v1)


#-------------
# Logical operator: AND, OR, ==, !=, >, <, .....
#-------------

# we would like to check which elements of the vector repect a specific condition: 
# the output is TRUE/FALSE

v1>2

v3<-c("B","A", "C" ,"C", "C", "C", "B", "C", "B", "B") 
# when asking for the "equality condition" we need to use == 
v3=="A"
# otherwise: 
v3="A" # we re-initialize the vector

# if we are looking for a set of elements: we can use %in% 
v3<-c("B","A", "C" ,"C", "C", "C", "B", "C", "B", "B") 
v3 %in% c("A","C")

# to ask for "is different" we use !=
v3!= "B"



# we can access vector by conditions:
# inside indwe have TRUE/FALSE
ind<-v1>2
# with the squared brackets we access the vector 
# it only provides the elements where ind is equal to TRUE
v1
ind
v1[ind]

# we could have written this directly: 
v1[v1>2]


##-----------------------
#   Operation with vectors:
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



##-----------------------
#  More on comparison operators:
##-----------------------

income<-c("low","low","medium","high","medium","high")
(income %in% c("low","high"))

!(income %in% c("low","high"))

income!="low"

(income=="low" |  income=="high")

(income=="low" &  income=="high")


a<-1:10
a
a[a>=3 & a<=5]





##-----------------------
#  Factors: for categorical variables, more convenient to use (we will see this with plots, tables and for regression models)
##-----------------------

typeof(income)
income[1:3]

# if we want to change the vector into a factor:
as.factor(income)
typeof(income)


income2<-as.factor(income)
income2[1:3]

# if we want to specify/change the labels of different levels we have to use: factor and not as.factor
income2<-factor(income, levels=c("low","medium","high"), 
                labels = c("L","M","H"))
income2[1:3]



## Exercise I : Create a new script where to do the Exercise


##--------------------
#   Matrix: two-dimensions collection of elements of the SAME type
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
# rbind: bind by row (one on top of the other)
rbind(v1,v2)
# cbind: bind by column (one on the side of the other)
cbind(v1,v2)


# BE CAREFUL on the dimensions: 
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
#   data.frame: two-dimensions collections of elements of DIFFERENT types
##-------------------

# create/ initialize a data frame
db1<-data.frame(id=c(1,2,3), # id= refers to the name od the COLUMN
                sex=c("Male","Female","Male"),
                age=c(46,53,38))


ID=1:10
sex=rep(c("M","F"),5)
data<-data.frame(ID, sex)

# creating a new data with the treatment column
Treatment=c("A","B","A")
db2<-data.frame(db1,Treatment)

#--- access to a data.frame: 
db1

# access to a column by the name: 
db1$sex
db1[, "sex"]

# squared brackets, two dimensions--> two indexes 
db1[2,3]
# second column, all rows
db1[,2]
# second row, all columns
db1[2,]


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

# careful with typos
db1$ID



## Exercise I : go back to te script and continue th Exercise


##--------------------
#  list: collection of different objects with DIFFERENT TYPE and DIFFERENT DIMENSIONS
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


#--------------
## import data: we need to specify the format of the data and where the file is located (path)
#-------------
#create a csv file ( be careful on WHERE you save it)

# read .csv files: use the path where YOUR file is located instead: 
#data_csv<-read.csv("~/Desktop/KVN2021/Course/IntrotoR/data_exercise/ex_read.csv")
data_csv

# we want to manipulate it and then save it: 
#write.csv(data_csv, file="~/Desktop/KVN2021/Course/IntrotoR/data_exercise/ex_read.csv")

# or we want to save it as an R data:
save(data_csv, file="data_example.Rdata")


#------------------
# Exploring data 
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

#-------------------
#create new variable:
#-------------------
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

#-------------------------
#--- remove a variable
#------------------------

db2<-db1_ex
db2$ID<-NULL
head(db2)


#--------------------------
### subsetting by condition
#-------------------------

# subset is a pre-coded function, if you do not remember how to use it, use the help page: ?subset
# we need to provide the data.frame we want to subset and the condition we want to be respected
subset(db1_ex, BMI<19)

db3<-subset(db1_ex, BMI<19)
db4<-subset(db1_ex, year==2000)


#-----------------------------
# from numerical to binary: ifelse
#-----------------------------
# creating a new variable: BMI.cat whish is "underwights if BMI<20, normal otherwise

db1_ex$BMI.cat<-ifelse(db1_ex$BMI<20,"underweight","normal") 

head(db1_ex)

#-----------------------------
# from numerical to categorical: cut
#-----------------------------
# lower value is excluded, upper value is included:
db1_ex$BMI.cat2<-cut(db1_ex$BMI, breaks=c(15,20,30), 
                     labels=c("underweight","normal"))

head(db1_ex$BMI.cat2)

table(db1_ex$BMI.cat2)           

# more groups: 
db1_ex$BMI.cat2<-cut(db1_ex$BMI, breaks=c(14,20,24,28),
                     labels = c("underweight","normal","overweight"))
db1_ex$BMI.cat2   






#--------------------
# Descriptive statistics 
#-------------------

# for binary/categorical variable we would like to show counts and proportions:
# the function table counts how many times each level is found in that column:

table(db1_ex$BMI.cat)

# we can also have a two-way table where we count respect to another variable:
table(db1_ex$BMI.cat,db1_ex$year)

# if we want to check for conditions:
table(db1_ex$weight>60)


# in case of missing data (NA)
# we can specify to show how many missing there are in each group:

# add a missing:
db1_ex$weight[33]<-NA
table(db1_ex$weight>60,useNA="ifany")



# for continuous variable we are mostly interested into mean/median, sd, quantiles:
mean(db1_ex$height)
median(db1_ex$weight)
# if missing data, we can use na.rm to calculate the statistic removing the missing: 
median(db1_ex$weight, na.rm=TRUE)

min(db1_ex$height)
max(db1_ex$height, na.rm=TRUE)


summary(db1_ex$weight)

quantile(db1_ex$BMI)
quantile(db1_ex$BMI, c(0.25,0.75))


# groupwise calculation: we want to calculate the mean weight by BMI category
tapply(db1_ex$weight, db1_ex$BMI.cat, mean, na.rm=TRUE)
aggregate(weight ~ BMI.cat, data=db1_ex, FUN=mean, na.rm=TRUE)

#NB: the output of tapply is a vector, while the output of aggregate is a data.frame



#rm(list = ls())




