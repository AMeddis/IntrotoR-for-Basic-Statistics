###############################################################################
##--------------Introduction to R for Basic Statistics-------------------------
##-----------------Exercise 3: Correct the error------------------------------
###############################################################################

#n<50
#sex<-rep(c("M","F"), c(n/2,n/2)
#weight<-seq(1.6, 3,5, length.out=n) m
#dim<-smaple(60:300, n, replace=TRUE) kg
#species<-c("Maui","Indus River","Bottlenose"","Risso")
#weight.cat<-cut(weight,breaks = c(1.6,2.3,2.8,3.5), include.lowest = true)
#dolphins<-data.frame(weight=weight,dim=dim,species=species,)
#count how many dolphins by gender:
#sum(dolphins$sex)
#table(dolphins$specis)
#table(dolphins$species, dolphins$sex, useNA ="if.any" )

# dolphins.M<-subset(dolphins,sex=="Male")
# mean(dolphins.M$weight)

## add a row to the data.frame:
#dolphins2<-rbind(dolphins,data.frame(sex="F",weight=290,dim="3,3",species="Risso")
#mean(dolphins2$dim)
#hint: typeof(dolphins2$dim)
        
#plot(dolphins$weight,dolphins$dim, col=factor(sex), ylim=c(1.6,4))
#boxplot(dim~species, "lightblue", dolphins)

set.seed(278)

sex<-rep(c("M","F"), c(n/2,n/2))
weight<-seq(1.6, 3.5, length.out=n)

dim<-sample(200:300, n, replace=TRUE)

species.names<-c("Maui","Indus River","Bottlenose","Risso")

species<-cut(weight,breaks = c(1.6,2.3,2.8,3,3.5), labels=species.names,
                include.lowest = TRUE)

dolphins<-data.frame(sex=sex,weight=weight,dim=dim,species=species)

#count how many dolphins by gender:
table(dolphins$sex)

table(dolphins$species)

table(dolphins$species, dolphins$sex, useNA ="ifany" )

dolphins.M<-subset(dolphins,sex=="M")
mean(dolphins.M$weight)

## add a row to the data.frame:
dolphins2<-rbind(dolphins,
                 data.frame(sex="F",weight=290,dim=3.3,species="Risso"))
mean(dolphins2$dim)


plot(dolphins$weight,dolphins$dim, col=factor(sex), xlim=c(1.6,4))

boxplot(dim~species, col="lightblue", dolphins)






