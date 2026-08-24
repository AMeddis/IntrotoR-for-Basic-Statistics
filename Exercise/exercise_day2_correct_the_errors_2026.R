###############################################################################
##--------------Introduction to R for Basic Statistics-------------------------
##-----------------Exercise 404: Correct the error------------------------------
###############################################################################

#set the working directory:
setwd("~/Desktop/KVN2021/Course/IntrotoR/data_exercise")

# assign the variable n to be equal to 50
n<50

# create a vector of dimension n for sex repeating M n/2 times and F n/2 times:
sex<-rep(c("M","F"), c(n/2,n/2)

# create the vector weight: a sequence of integer from 1.6 to 3.5 
weight<-seq(1.6, 3,5, length.out=n)

# create the vector for dimension randomly sampling n number from 60:300
dim<-smaple(60:300, n, replace=TRUE)

# create a vector of character for species:
species.names<-c("Maui","Indus River","Bottlenose"","Risso")
"
# create a new data.frame dolphins with variables: sex,weight,dimension 
dolphins<-data.frame(sex=sex, weight=weight,dim=dimension)

# define a new variable in the database dolphins for the species
# this is assigned depending on weight: Maui: [1.6,2.3], Indus River: (2.3,2.8],
#                                       Bottlenose: (2.8, 3], Risso: (3,3.5]

species<-cut(weight,breaks = c(1.6,2.3,2.8,3.5), 
                labels=species.names, include.lowest = true)

# create a table for species
table(dolphins$species)

# table for species by sex
table(dolphins$species, dolphins$Sex, useNA ="if.any" )

# Subset only males:
subset(dolphins,sex="Male")

# calculate the average weight among males:
mean(dolphins.M$weight)

## add a row to the data.frame:
dolphins2<-rbind(dolphins,data.frame(sex="F",weight=290,dim="3,3",species="Risso"))
# did something change?
head(dolphins2)

# create a scatterplot for weight and dimension by sex
plot(dolphins$weight,dolphins$dim, col=sex)

# create a scatterplot for weight and dimension by species:
plot(dolphins$weight,dolphins$dimension, col=dolphins$species, ylim=c(1.6,4))
# hint: check summary(dolphins$dimension)

# Create a boxplot for dimension by species
boxplot(dim~species,col="lightblue")


