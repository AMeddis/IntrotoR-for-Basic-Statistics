
#-----------------------------------
#         script slides day 3:  PLOT
#----------------------------------
set.seed(111)
db_long<-data.frame(ID=rep(1:33,2), 
                    year=factor(rep(c(2000,2002), 33)),
                    weight=rnorm(66,60,5),
                    height=rnorm(66,172,5))

#-------------------------------


# calculate mean height and mean weight (needed for the plot)

meanh<-mean(db_long$height)
meanw<-mean(db_long$weight)

#---SCATTERPLOT 1 
# when considering continuous variable can visualize it with scatterplot
# when using a plot we might want to only plot one variable:
plot(db_long$height)
# the x variable is "index" which indicates observation nr 1,2,3,----

plot(db_long$weight, xlab=" ", ylab="weight(kg)")

#relationship between two variables
plot(db_long$height,db_long$weight, 
     xlab='height (m)', ylab='weight (kg)', ylim=c(50,70),
     col='red', pch=15, 
     main='Scatterplot')


abline(v=meanh, col="green", lty=2)
abline(h=meanw, col="blue", lty=2)
points(meanh,meanw,lwd=5)
# regression line: fitted line for the average of the weight given height
abline(lm(weight~height, db_long), col="blue")




#---SCATTERPLOT 2
plot(db_long$height,db_long$weight, 
     xlab='height (cm)', ylab='weight (kg)', ylim=c(50,70),
     col=db_long$year, pch=15, 
     main='Scatterplot')
legend( 'topleft', levels(db_long$year), pch=15, col=1:2,
        inset=.05, title='Year' )


# if we want to change color:

group_colors <- c("2000" = "green", "2002" = "blue")
# Assign colors to the data points based on the year
db_long$color <- group_colors[db_long$year]

# also with the ifelse:
#db_long$color2<-ifelse(db_long$year=="2000","red","blue")

plot(db_long$height,db_long$weight, 
     xlab='height (cm)', ylab='weight (kg)', ylim=c(50,70),
     col=db_long$color, pch=15, 
     main='Scatterplot')


#--- other examples for plot: 

# to use the plot function we do not need objects to be in the same data.frame
# they need to have same dimension, cause x-y provides the coordinates of each point
plot(c(0,3,6), c(0,0.5,1), col="red", ylim=c(-2,2))
# which would be equivalent of doing: 
a<-c(0,3,6)
b<-c(0,0.5,1)
plot(a,b, col="red", ylim=c(-2,2))
#or
dbb<-data.frame(a,b)
plot(a,dbb$b, col="red", ylim=c(-2,2))


#---BOXPLOT

boxplot(weight~year, db_long, 
        xlab='Year',
        names=c('2000','2002'), col=db_long$year)

##  to be 100% sure 
boxplot(weight~year, db_long, 
        xlab='Year',names=levels(db_long$year),
        col=c("gray","red"))

# as for the aggregate, we can use more categorical variables at once with the "+"
# create categorical variable for height:
db_long$height_cat<-cut(db_long$height, breaks=c(-Inf,median(db_long$height),Inf), labels=c("short","long"))
boxplot(weight~year+height_cat, db_long, 
        xlab='Year')


#---HISTOGRAM 1 
hist(db_long$weight, col="lightblue", xlab="Weight (kg)", main="Histogram")

#---HISTOGRAM 2
hist( db_long$weight, col="lightblue", xlab="Weight (kg)", main="Histogram", prob = TRUE)
lines( density( db_long$weight, na.rm=T ) )

#--- put them together
par(mfrow=c(2,2))
plot(db_long$height*100,db_long$weight, 
     xlab='height (cm)', ylab='weight (kg)', ylim=c(50,70),
     col=db_long$year, pch=15, 
     main='Scatterplot')

boxplot(weight~year, db_long, 
        xlab='Year',names=c("2000","2002"),
        col=c("gray","red"))
hist( db_long$weight, col="lightblue", xlab="Weight (kg)", main="Histogram", prob = TRUE)

dev.off() # used so R knows that you do not need the plot to be into a 2x2 grid anymore















