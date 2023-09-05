#------- --------------------------------------------------
# Introduction to R reshaping data:
#     Wide to long / Long to wide - merge data.frame
#---------------------------------------------------------


###----------------
# Create Data
###---------------
## set.seed(111) is needed so that we all have same results:
# rnorm() randomy generate the weight from a normal distribution
# the seed is need so that the generation of the weight will be equal every time.
set.seed(111)
db_long<-data.frame(ID=rep(1:33,2), 
                    year=rep(c(2000,2002), 33),
                    weight=rnorm(66,60,5))
#------------------------------------------




#----------------------------------
#             LONG TO WIDE
#---------------------------------


# Step 1: create one data set for each year:

# we can use the function subset 
#NB: remember to store the new data sets assigning a name with "<-"
year_2000<-subset(db_long,year==2000)
year_2002<-subset(db_long, year==2002)

#how does it look like?
head(year_2000)

# Step 2: create data.frame in the wide format:
# ID | weight_2000 | weight_2002|  

db_wide<-data.frame(ID=year_2000$ID, weight_2000=year_2000$weight, weight_2002=year_2002$weight)

# Step 3: order them by ID:
db_wide<-db_wide[order(db_wide$ID),]

head(db_wide)

#------------------------------------------


#----------------------------------
#            WIDE TO LONG
#---------------------------------

# we consider db_wide and we want to go back to the long format:

# Step 1: create a data.frame for each year

# we cannot use the subset function now because we have one column per year
# so we do not want to select rows but columns:

year2000<-db_wide[,c("ID", "weight_2000")]
year2002<-db_wide[,c("ID","weight_2002")]

head(year2000)

# Step2: create a new variable for year for each data.frame :

year2000$year=2000
year2002$year=2002
  
# Step 3: create the long format by binding them by row:
db_long2<- rbind(year2000,year2002)

# OPS: we have an error "Error in match.names"
# because year2000 and year2002 have different names for columns:
names(year2000)
names(year2002)

# we have to rename weight_y by weight:

colnames(year2000)<-c("ID","weight","year")
colnames(year2002)<-c("ID","weight","year")

# finally use the rbind  to obtain the long format:
db_long2<- rbind(year2000,year2002)

#--------------------------------------------



#-------------------------------------
# Easier alternative: using the function reshape:
#------------------------------------


#----------------------------------
#    LONG TO WIDE by reshape
#---------------------------------

db_wide.reshape<-reshape(db_long, direction="wide",
                         idvar="ID",
                         timevar = "year") # name of the variable that indicates the time (repetition)

head(db_wide.reshape)


#----------------------------------
#    WIDE TO LONG by reshape
#---------------------------------

db_long.reshape<- reshape(db_wide, direction="long",
                          idvar="ID",
                          varying=c("weight_2000","weight_2002"),
                          v.names="weight", #define name for column for the repeated measure
                          timevar="year", #define name for the column of time (repetition)
                          times=c("2000","2002"))  #define values for the "timevar"

head(db_long.reshape)

#---------------------------------------------------



#---------------------------------------------------
#  MERGE TWO DATA SETS:
#--------------------------------------------------

#---------------------------------------
# Create data for patient characteristics
#--------------------------------------

set.seed(222)
db_pat<-data.frame(ID=1:33, sex=sample(c("F","M"), 33, replace=TRUE),
                   Age=runif(33,18,25),
                   Diet=sample(c("A","B"), 33, replace=TRUE))


# we want to merge the data set in the long format with db_pat 
# to add the patient characteristics:

db_merge<-merge(db_long,db_pat, by="ID")

head(db_merge)

#------------------------------------------------------



  
#-----------------------------------
#           CREATE PLOT
#----------------------------------

# add column height to the data (long format)

db_long$height<-rnorm(nrow(db_long),1.70,0.05)

# calculate mean hwight and mean weight (needed for the plot)

meanh<-mean(db_long$height, na.rm=TRUE)*100
meanw<-mean(db_long$weight, na.rm=TRUE)

#---SCATTERPLOT 1 

plot(db_long$height*100,db_long$weight, 
     xlab='height (cm)', ylab='weight (kg)', ylim=c(50,70),
     col='red', pch=15, 
     main='Scatterplot')


#lines( db1_ex$weight,db1_ex$height, col='blue', type='b', lwd=2, lty=2, pch=15 )
abline(v=meanh, col="green", lty=2)
abline(h=meanw, col="blue", lty=2)
points(meanh,meanw,lwd=5)


#---SCATTERPLOT 2
plot(db_long$height*100,db_long$weight, 
     xlab='height (cm)', ylab='weight (kg)', ylim=c(50,70),
     col=db_long$year, pch=15, 
     main='Scatterplot')

#------------------------------------------------------------------
# RUN THIS, IT IS TO CREATE A REGRESSION LINE: YOU LL LEARN THIS LATER
dbb<-na.omit(db_long)
mod<-lm(weight~I(height*100), dbb)
pred.w<-predict(mod)
#--------------------------------------------------------------------

lines(db_long$height*100,pred.w,lty=1, lwd=2)

legend( 'topleft', c('2000','2002'), pch=15, col=c('red','gray'),
        inset=.05, title='Year' )


#---BOXPLOT

boxplot(weight~year, db_long, 
        xlab='Year',
        names=c('2000','2002'),col=db_long$year)



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
        xlab='Year',
        names=c('2000','2002'),col=db_long$year)

hist( db_long$weight, col="lightblue", xlab="Weight (kg)", main="Histogram", prob = TRUE)

dev.off() # used so R knows that you do not need the plot to be into a 2x2 grid anymore















