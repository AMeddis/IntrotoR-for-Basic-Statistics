#------ Script during lecture:


##--------------------
#    Help page:
##-------------------
?round
#help(round)


##--------------------
#   Data type:
##-------------------
#initialize variables

#shortcut for <- :  "Alt - "

a<-1L
b<-0.6
c<-"0.3"

#check their type
typeof(a)
typeof(b)
typeof(c)

#is b numeric? TRUE/FALSE
is.numeric(c)



##--------------------
#   vectors:
##-------------------

as.numeric(c)

#Vectors: c(, , , )

v1<-c(0,0.3,7,20)

v2<-c("Male","Female")

v3<-c(TRUE,FALSE,FALSE)

typeof(v1)
typeof(v2)
typeof(v3)

length(v1)
length(v2)
v2


#Create a Vector of IDs (sequence of inetegers from a to b)
IDs<-1:10
IDs

length<-0.5:0.7
length



ID<-seq(1,10)
ID

seq(1,10, by=0.5)

weight<-seq(0.5,0.7, by=0.1)
weight

weight<-seq(0.5,0.7, length.out=4)
weight


#create a vector with repeated numbers:

v1<-rep(0,3)
v1


v2<-rep(c(0,1),2)
v2


v3<-rep(c(0,1), c(2,5))
v3



# Access to vectors:

v1<-c(0,0.3,7,20)
v1
v1[2]
v1[-1]

v1[-c(1,2)]

v1[2:4]

#we are going over the dimension of the vector:
v1[5]


# By condition:
v1>2
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
sum(a+b)

prod(a)

# vectorial product
a %*% b

##-----------------------
#  comparison oeprators:
##-----------------------

sex<-c("female","male","male","female")
sex=="female"

## 

income<-c("low","low","medium","high","medium","high")
!(income %in% c("low","high"))

(income=="low" & income=="high")


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

rownames(m1)
rownames(m1)<-c("A","B")
m1

m1["A",]


colnames(m1)

colnames(m1)<-c("1","2","3")
m1

#ERROR
rownames(m1)<-c("1","2","3")


##--------------------
#   data.frame
##-------------------

db1<-data.frame(id=c(1,2,3), sex=c("Male","Female","Male"), age=c(46,53,38))

db1

db1$sex


db1[2,]

dim(db1)

names(db1)

db2<-data.frame(id=1:100, sex=rep(c("Female","Male"),50), age=rnorm(100,40,10))

db2
head(db2)
tail(db2)

#ERROR
db2$ID

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
income[1:3]

income2<-factor(income)
income2[1:3]

income2<-factor(income, levels=c("low","medium","high"), labels = c("L","M","H"))
income2[1:3]




###-----------------------
#  Conversion and Coercion
##------------------------

weight<-c(10L,15L,27L,18L,22L)
typeof(weight)
weight[2]<-25.4
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












