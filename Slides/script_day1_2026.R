# ==========================================================================
# Intro to R -- Day 1
# Live-coding script (run interactively during the lecture)
# ==========================================================================

# We write code in a script so we can save it and reuse it later.
# Lines starting with "#" are comments -- R ignores them.
# To run the current line (or selection), press Ctrl + Enter.


# ==========================================================================
# Working directory
# ==========================================================================
# The working directory is the folder R uses by default to load and save
# files (data, plots, ...). Set it to the folder where you keep your work.

# Check the current working directory
getwd()

# Set the working directory to the folder where you want to load/save data
setwd("C:/Users/pzs913/Desktop/Course/IntrotoR")

# You can also set it via the menu:
# Session -> Set Working Directory -> Choose Directory

# ==========================================================================
# Assign values using '<-' (or '=')
# ==========================================================================

x <- 2.22 # same as x = 2.22

# ==========================================================================
# Functions
# ==========================================================================
# A function performs a specific set of commands. To define one we need:
#   - a name
#   - input arguments (the objects the function needs)
#   - an output (the result of the operation)
# Note: arguments within a function call are separated by ","

# Example: a function that calculates the difference a - b
difference <- function(a, b) { # a, b are the input arguments
  a - b                        # a - b is the output
}

# ==========================================================================
# Notice: '<-' _assigns the function to the name 'difference'
# ==========================================================================


# Call the function
difference(3, 4)

# This is equivalent to:
difference(b = 4, a = 3)

# a and b are called INPUT ARGUMENTS.
# If we don't specify which value goes to which argument, R uses the
# order in which they are defined.

# The person who writes the function chooses the NAMES and ORDER of the
# input arguments -- we could just as well have called them differently:
difference <- function(first, second) {
  first - second
}

# Now we must use the new names:
difference(first = 3, second = 4)

a <- 3
b <- 4

# This still works because R falls back to positional matching
difference(a, b)

# But if we write:
difference(a = 3, b = 4)
# R looks for input arguments literally named "a" and "b", which no
# longer exist (they are now "first" and "second") -- this gives an error

difference(3.78901, 4.11)

result <- difference(3.78901, 4)

round(result)

# ==========================================================================
# Help pages
# ==========================================================================
# Use "?" or help() to look up documentation for a function
?round
help("round")

round(x = result, digits = 2)


# ==========================================================================
# Packages
# ==========================================================================
# Functions are organized into packages. Install a package once, then load
# it with library() in every session where you need it.

install.packages("Publish")  # run once (or when updating)
library(Publish)              # load the package in the current session

?univariateTable


# Check the R version and which packages are currently attached
sessionInfo()


# ==========================================================================
# Data types
# ==========================================================================
# Variables in R can be of different types, which matters when performing
# operations on them.

# Initialize variables: they are saved in the environment so we can reuse
# them later. Shortcut for "<-" is Alt + "-"

a <- 1
b <- 0.6
c <- "0.3"

# Check their type
typeof(a)
typeof(b)
typeof(c)

# We can change (coerce) the type of a variable
new.b <- as.character(b)
typeof(new.b)

c
c <- as.numeric(c)
typeof(c)

# Is c numeric? TRUE/FALSE
is.numeric(c)

# BE CAREFUL: R does not recognize numbers written with "," as the decimal
# separator, and by default returns NA (Not Available) instead
f <- "0,3"
f <- as.numeric(f)
f


# ==========================================================================
# Vectors: a one-dimensional collection of elements of the same type
# ==========================================================================

# Create a vector with c(...)
v1 <- c(0, 0.3, 7, 20)
v2 <- c("Male", "Female")
v3 <- c(TRUE, FALSE, FALSE)

typeof(v1)
length(v1)

typeof(v2)
length(v2)

typeof(v3)
length(v3)

# --- Creating vectors ------------------------------------------------------

# ":" creates a sequence of integers from a to b (step = 1)
IDs <- 1:10
IDs

# Caution: naming a variable "length" shadows the built-in length() function.
# It still works below because R looks specifically for a function when a
# name is followed by "(", but avoid reusing names of common base functions.
length <- 0.5:2
length

# seq(): create a sequence from a to b
ID <- seq(1, 10)
ID

# The "by" argument sets the step (default step = 1)
seq(1, 10, by = 0.1)

# "length.out" sets the desired length of the output vector instead
seq(1, 10, length.out = 6)

# rep(): create a vector by repeating values
v1 <- rep(0, 3)
v1

# --- Accessing vector elements ----------------------------------------------

v1 <- c(0, 0.3, 7, 20)
v1
length(v1)

# look at second element
v1[2]

# Elements 2 and 4
v1[c(2,4)]

# Look at everything except the first element
v1[-1]

# Going beyond the vector's length returns NA
v1[5]


# --- Logical operators: &, |, ==, !=, >, <, ... -----------------------------

# Check which elements of a vector satisfy a condition -- returns TRUE/FALSE
v1 > 2


# tabulate
v3 <- c("Cancer", "Cancer", "Diabetes", "Cancer", "Diabetes", "Cardiovasc.", "Dermatol.", "Cancer", "Diabetes", "cancer")
table(v3) 

# Oops
v3[10] = "Cancer"
table(v3) 

# Check condition - notice that evaluating for equality requires "==" (a single "=" is assignment!): result is a vector
test <- (v3 == "Cancer")
test

# Using a single "=" instead overwrites v3 with the string "A" -- a common
# mistake. Compare the (wrong) result:
test <- (v3 = "Cancer")
test

# %in%: check membership in a set of values
v3 <- c("Cancer", "Cancer", "Diabetes", "Cancer", "Diabetes", "Cardiovasc.", "Dermatol.", "Cancer", "Diabetes", "cancer")
test2 <- (v3 %in% c("Cardiovasc.", "Diabetes"))
test2

# "!=" means "is different from"
test3 <- (v3 != "Cancer")

# --- Subsetting a vector with a condition -----------------------------------

# "test3" holds a TRUE/FALSE vector
v3
v3[test3]

# This can be written directly, without the intermediate variable:
v3[(v3 != "Cancer")]

# beware of missing values

v3 <- c(v3,NA)
v3[(v3 != "Cancer")]

# ==========================================================================
# Operations with vectors
# ==========================================================================

a <- 1:3
b <- 3:5

a
b

# Element-wise operations
a + b
a * b
a / b

# Operations on the whole vector
a
sum(a)
mean(a)

sum(a + b)

a
prod(a)

difference(a, b)


# ==========================================================================
# More on comparison operators
# ==========================================================================

income <- c("low", "low", "medium", "high", "medium", "high", "low", "medium", "high", "medium", "high")
income

incometest <- income %in% c("low", "high")

incometest2 <- !(income %in% c("low", "high"))

incometest3 <- income != "low"

# "|" = OR
incometest4 <- (income == "low" | income == "high")

# "&" = AND (no value can be "low" AND "high" at once -> all FALSE)
incometest5 <- (income == "low" & income == "high")

# ==========================================================================
# Factors: the preferred type for categorical variables (used later for
# plots, tables, and regression models)
# ==========================================================================

typeof(income)
income[1:3]

# Convert to a factor -- note this is NOT saved, so "income" itself is
# unchanged unless we assign the result
as.factor(income)
typeof(income)

income2 <- as.factor(income)
income2

# To specify/change the labels of the levels, use factor() (not as.factor())
income2 <- factor(income,
                   levels = c("low", "medium", "high"),
                   labels = c("L", "M", "H"))
income2


# ==========================================================================
# Matrix: a two-dimensional collection of elements of the SAME type
# ==========================================================================

# Create a matrix
m1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
m1
m1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = TRUE)
m1

m2 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, byrow = TRUE)
m2

# --- rbind() and cbind() -----------------------------------------------

hospitaldays <- c(0, 0.3, 7, 11, 6, NA, 20, NA)
satisfaction <- c(1, 4, 3, 5, 2, 4, 3, 5)

# rbind: bind vectors as rows (stacked on top of each other)
# cbind: bind vectors as columns (side by side)
matrix <- cbind(hospitaldays, satisfaction)
matrix

# BE CAREFUL with dimensions: vectors of different lengths cause
# recycling warnings or errors
v3 <- 1:5
v4 <- 1:3

v3
v4
rbind(v3, v4)

# Warning: length mismatch (v3 has 5 elements, v1/v2 have 4)
rbind(v1, v2, v3)
rbind(v1, v2, v4)

# Warning: length mismatch
cbind(v1, v2)
cbind(v1, v2, v3)
cbind(v1, v2, v4)

dim(m1)
nrow(m1)
ncol(m1)
m1


# Assign names: the number of names must match the number of columns (m1 has 2 columns)
colnames(matrix)
colnames(matrix) <- c("days", "satisfaction")

matrix[1,1]
matrix[3,2]

matrix[3,"satisfaction"]

# ==========================================================================
# data.frame: a two-dimensional collection of elements of DIFFERENT types
# ==========================================================================

# Create/initialize a data.frame

db1 <- data.frame(id = 1:8,        # "id =" sets the COLUMN name
                  hospitaldays,
                  satisfaction,
                  age = c(46, 53, 38, 86, 53, 31, 19, 20))

# Add a new data.frame with a Treatment column
Treatment <- c("A", "B", "A", "B", "A", "B", "A", "B")
db2 <- data.frame(db1, Treatment)

# Square brackets, two dimensions -> two indices: [row, column]
db1[2, 3]
db2[2, 3]

# Access a column by name
db2$age
db2[, "age"]

# Dimensions
dim(db1)
dim(db2)

# Change the column names
colnames(db1)
colnames(db1) <- c("pnr", "sex", "age")
colnames(db1)

colnames(db1)[1] <- "id"
db1

head(db2)
tail(db2)

# ==========================================================================
# Exercise I - question 1 and question 2
# ==========================================================================

dbf <- read.csv("https://raw.githubusercontent.com/AMeddis/IntrotoR-for-Basic-Statistics/refs/heads/main/data_exercise/db_follicle.csv")
dbp <- read.csv("https://raw.githubusercontent.com/AMeddis/IntrotoR-for-Basic-Statistics/refs/heads/main/data_exercise/db_patient.csv")

# 1. Check the dimension of the data.frame. How many patients were
#    included in the study?
dim(dbp)

# 2. Visualize the first lines of the data using head().
head(dbp)

# 3. Print a summary of the data. What is the data type of each variable?
summary(dbp)

# --- Question 2 --------------------------------------------------------
# Disease is imported as character -- can we tell from the summary how
# many different diseases are in the data?

# 1. Would it be better if Disease were a different type? If so, which one?
factor(dbp$Disease)
summary(dbp)

# 2. Transform it into a factor, using factor().
dbp$Disease2 <- factor(dbp$Disease)

# 3. Print the summary again -- can you see any difference?
summary(dbp)

# 4. Create a new variable Cancer that groups Disease into
#    "Breast cancer" vs. "Others" - we will see later that 'ifelse' is a nicer way to do this

dbp$Disease == "Breast_cancer"
dbp$Cancer <- "Others"
dbp$Cancer[dbp$Disease == "Breast_cancer"] <- "Breast_Cancer"
dbp$Cancer2 <- as.factor(dbp$Cancer)
summary(dbp)

# ==========================================================================


# Careful with typos/case: "ID" does not exist in db1 (only "id" does),
# so this returns NULL instead of an error
db1$ID
db1$id
db1$pnr


# ==========================================================================
# list: a collection of objects of DIFFERENT type and DIFFERENT dimensions
# ==========================================================================

family <- list(n = 3,
               kids = data.frame(id = c(1, 1, 2, 3),
                                  age = c(6, 10, 8, 4),
                                  IQ = c(97, 101, 103, 102)),
               mother = data.frame(id = c(1, 2, 3),
                                    smoker = c("Yes", "No", "Yes")))

family

# --- Accessing a list -----------------------------------------------------

family[1]
family[2]

family["n"]
family["kids"]
family["mother"]

family$mother

length(family)
str(family)


# ==========================================================================
# Missing values
# ==========================================================================

# Note: the 5th element is the literal text "NA" (a string), not a true
# missing value -- only the 2nd element is an actual NA
sex <- c("female", NA, "male", "male", "NA", "female")
sex

is.na(sex)

# 0/0 is not a number (NaN), not the same as NA
0 / 0

height <- NULL
height

db1

# Again: case/typo-sensitive -- db1 has a column "sex", not "Sex"
db1$Sex


# ==========================================================================
# Conversion and coercion
# ==========================================================================

weight <- c(10L, 15L, 27L, 18L, 22L)  # "L" makes these integers
weight
typeof(weight)

# Assigning a decimal into an integer vector silently coerces it to double
weight[2] <- 25.4
weight
typeof(weight)

weight <- c(2, 3, 6, 8, 9)
typeof(weight)

weight2 <- as.integer(weight)
typeof(weight2)
weight2

as.character(weight)
as.character(weight2)

# Combining different types coerces everything to the "widest" type:
# logical -> numeric -> character
c(0, 1, FALSE, TRUE)
c(FALSE, TRUE)
c("low", "high", 2)
c(1, 1, "3")

# A comma is not recognized as a decimal separator -> NA
as.numeric(c("0.4", "0.2", "0,1"))
as.numeric(c("0.4", "0.2", "0.1"))


# ==========================================================================
# Manipulating a dataset (Part 1)
# ==========================================================================

# --- Importing data ---------------------------------------------------
# We need to specify the file format and where the file is located (path).
# Use the path to YOUR file instead of the ones below.

data_csv <- read.csv("C:/Users/pzs913/Documents/R-course/amh.csv")
data_csv <- read.csv("amh.csv")

# Save a modified data.frame back to a csv file
# write.csv(data_csv, file = "~/Desktop/KVN2021/Course/IntrotoR/data_exercise/ex_read.csv")

# ... or save it as an R data file
save(data_csv, file = "AMH.Rdata")

# --- Exploring data -----------------------------------------------------

set.seed(100)  # makes the random values reproducible
db1_ex <- data.frame(ID = rep(1:25, 2),
                      year = rep(c(2000, 2002), 25),
                      weight = rnorm(50, 60, 5),
                      height = rnorm(50, 1.70, 0.05))
db1_ex[4, 4]

dim(db1_ex)
head(db1_ex)
tail(db1_ex)

str(db1_ex)
summary(db1_ex)

# --- Creating a new variable ---------------------------------------------

# Not there yet -> NULL
db1_ex$BMI

db1_ex$BMI <- db1_ex$weight / (db1_ex$height)^2

# NB: you must tell R the variable lives inside the data.frame (db1_ex$...).
# If we instead do:
log.weight <- log(weight)
# this does NOT error -- it silently uses whichever "weight" object already
# exists in the environment (e.g. from an earlier section), which is NOT
# db1_ex$weight. This gives a wrong result without any warning!

# The correct version:
log.weight <- log(db1_ex$weight)
# "log.weight" is now a separate object, still NOT a column of db1_ex
head(db1_ex)

hist(log.weight)

# To store it as a column, assign it to db1_ex$...
db1_ex$log.weight <- log(db1_ex$weight)
head(db1_ex)

# --- Removing a variable --------------------------------------------------

db2 <- db1_ex
db2$ID <- NULL
head(db2)

# --- Subsetting by condition -----------------------------------------------

# subset() is a built-in function -- see ?subset if you forget the syntax.
# It needs the data.frame to subset and the condition to keep.
subset(db1_ex, BMI < 19)

db3 <- subset(db1_ex, BMI < 19)
db4 <- subset(db1_ex, year == 2000)

# --- From numerical to binary: ifelse() -------------------------------------
# Create BMI.cat: "underweight" if BMI < 20, "normal" otherwise

db1_ex$BMI.cat <- ifelse(db1_ex$BMI < 20, "underweight", "normal")
head(db1_ex)

# --- From numerical to categorical: cut() -----------------------------------
# By default, the lower bound is excluded and the upper bound is included

db1_ex$BMI.cat2 <- cut(db1_ex$BMI, breaks = c(15, 20, 30),
                        labels = c("underweight", "normal"))

cut(db1_ex$BMI, breaks = c(15, 20, 30))
summary(db1_ex)
head(db1_ex$BMI.cat2)

table(db1_ex$BMI.cat2)

# More groups
db1_ex$BMI[17] <- 29
db1_ex$BMI[18] <- 12

# Without labels, cut() shows the interval notation directly
db1_ex$BMI.cat2 <- cut(db1_ex$BMI,
                        breaks = c(-Inf, 14, 20, 24, 28, Inf),
                        include.lowest = TRUE)
table(db1_ex$BMI.cat2)

# With labels: the number of labels must match the number of intervals.
# 6 breakpoints define 5 intervals, so we need exactly 5 labels.
db1_ex$BMI.cat2 <- cut(db1_ex$BMI,
                        breaks = c(-Inf, 14, 20, 24, 28, Inf),
                        include.lowest = TRUE,
                        labels = c("severely underweight", "underweight",
                                   "normal", "overweight", "obese"))
db1_ex$BMI.cat2
table(db1_ex$BMI.cat2)


# ==========================================================================
# Descriptive statistics
# ==========================================================================

# --- Categorical variables ---------------------------------------------
# table() counts how many times each level occurs in a column

table(db1_ex$BMI.cat)

# Two-way table: counts cross-classified by a second variable
table(db1_ex$BMI.cat, db1_ex$year)

# Counting how many observations satisfy a condition
table(db1_ex$weight > 60)

# Handling missing data (NA): useNA shows how many are missing per group
db1_ex$weight[33] <- NA
table(db1_ex$weight > 60, useNA = "ifany")

# --- Continuous variables -------------------------------------------------
# Mostly interested in mean/median, sd, quantiles

mean(db1_ex$height)

# Returns NA because db1_ex$weight now contains a missing value
median(db1_ex$weight)

# na.rm = TRUE removes missing values before calculating the statistic
median(db1_ex$weight, na.rm = TRUE)

min(db1_ex$height)
max(db1_ex$height, na.rm = TRUE)

summary(db1_ex$weight)
summary(db1_ex$BMI)

quantile(db1_ex$BMI)
quantile(db1_ex$BMI, c(0.05, 0.95))

# --- Groupwise calculations -------------------------------------------------
# Mean weight by BMI category

tapply(db1_ex$weight, db1_ex$BMI.cat, mean, na.rm = TRUE)

aggregate(weight ~ BMI.cat, data = db1_ex, FUN = mean, na.rm = TRUE)

# NB: tapply() returns a vector, aggregate() returns a data.frame


# ==========================================================================
# Exercise Questions 2 (last part revisited), 3 and 4
# ==========================================================================


# 4. Create a new variable Cancer that groups Disease into ..
# 
#    dbp$Disease == "Breast_cancer"
#    dbp$Cancer <- "Others"
#    dbp$Cancer[dbp$Disease == "Breast_cancer"] <- "Breast_Cancer"
#    dbp$Cancer2 <- as.factor(dbp$Cancer)
#    
#    'ifelse' is a nicer way to do this:

dbp$test <- ifelse(dbp$Disease == "Breast_cancer", "Breast_cancer", "Other")

# Age is a continuous covariate. We want an idea of the age distribution of
# the patients included in the study.

# rm(list = ls())  # uncomment to clear the environment before starting

View(dbp)

# 1. Show min, max and mean age
c(min(dbp$Age), max(dbp$Age), round(mean(dbp$Age), 1))

# 2. Mean age by cancer group

# aggregate()
aggregate(Age ~ Cancer2, data = dbp, FUN = mean, na.rm = TRUE)

# tapply()
tapply(dbp$Age, dbp$Cancer2, mean, na.rm = TRUE)

# 3. Create a categorical age variable, split at the median.
#    Two different ways to code it:

# 3a. Using cut() -- run str(dbp) afterwards: what type is the new variable?
m <- median(dbp$Age)
dbp$AgeCat <- cut(dbp$Age, breaks = c(-Inf, m, Inf), labels = c("low", "high"))
View(dbp)
str(dbp)

# 3b. Using ifelse() -- run str(dbp) afterwards: what type is the new variable?
dbp$AgeCat2 <- ifelse(dbp$Age < m, "low", "high")

# 4. Count how many patients belong to each age group
table(dbp$AgeCat)

# 5. Proportion of patients by cancer group (use prop.table)
tab <- table(dbp$Cancer)
prop.table(tab)


# ==========================================================================
# Question 4 -- patients with breast cancer only
# ==========================================================================

# 1. Subset patients with breast cancer (use subset())
BC <- subset(dbp, Cancer2 == "Breast_Cancer")

# 2. Number of patients per age group
table(BC$AgeCat2)

# 3. Mean and standard deviation of age
round(c(mean(BC$Age), sd(BC$Age)), 2)

====
