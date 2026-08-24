# ==========================================================================
# Introduction to R -- Reshaping data
#   Wide to long / Long to wide, and merging data.frames
# ==========================================================================


# ==========================================================================
# Create data
# ==========================================================================

# set.seed(111) ensures everyone gets the same random numbers.
# rnorm() randomly generates weight from a normal distribution;
# the seed makes that random generation reproducible.
set.seed(111)
db_long <- data.frame(ID = rep(1:33, 2),
                       year = rep(c(2000, 2002), 33),
                       weight = rnorm(66, 60, 5))
db_long <- db_long[order(db_long$ID), ]


# ==========================================================================
# Long to wide
# ==========================================================================

# --- Step 1: create one data set per year -----------------------------------

# We can use subset() to split the rows by year.
# NB: remember to store each new data set with "<-"
year_2000 <- subset(db_long, year == 2000)
year_2002 <- subset(db_long, year == 2002)

# What does it look like?
head(year_2000)
head(year_2002)

# --- Step 2: build the data.frame in wide format ----------------------------
# ID | weight_2000 | weight_2002

db_wide <- data.frame(ID = year_2000$ID,
                       weight_2000 = year_2000$weight,
                       weight_2002 = year_2002$weight)

head(db_wide)


# ==========================================================================
# Wide to long
# ==========================================================================

# Starting from db_wide, we want to go back to the long format.

# --- Step 1: create a data.frame per year -----------------------------------

# subset() no longer applies -- we now have one column per year, so we
# need to select COLUMNS, not rows:
year2000 <- db_wide[, c("ID", "weight_2000")]
year2002 <- db_wide[, c("ID", "weight_2002")]

head(year2000)
head(year2002)

# --- Step 2: add a "year" column to each data.frame -------------------------

year2000$year <- 2000
year2002$year <- 2002

# --- Step 3: stack them into the long format with rbind() -------------------

db_long2 <- rbind(year2000, year2002)

# Oops: this fails with "Error in match.names" because year2000 and
# year2002 don't have the same column names (rbind requires identical
# names, in any order):
names(year2000)
names(year2002)

# Rename "weight_<year>" to just "weight" in both data.frames:
colnames(year2000) <- c("ID", "weight", "year")
colnames(year2002) <- c("ID", "weight", "year")

# Now rbind() works and we get the long format:
db_long2 <- rbind(year2000, year2002)
head(db_long2)


# ==========================================================================
# Easier alternative: the reshape() function
# ==========================================================================

# --- Long to wide, with reshape() -------------------------------------------

db_wide_reshape <- reshape(db_long, direction = "wide",
                            idvar = "ID",
                            timevar = "year") # variable marking the repeated occasions

head(db_wide_reshape)

# --- Wide to long, with reshape() -------------------------------------------

db_long_reshape <- reshape(db_wide, direction = "long",
                            idvar = "ID",
                            varying = c("weight_2000", "weight_2002"),
                            v.names = "weight",  # name of the repeated-measure column
                            timevar = "visit")   # name of the time/occasion column
                            # times = c("baseline", "followup"))  # values for "timevar"

head(db_long_reshape)


# ==========================================================================
# Merging two data sets
# ==========================================================================

# --- Create data for patient characteristics --------------------------------

set.seed(222)
db_pat <- data.frame(ID = 1:33,
                      sex = sample(c("F", "M"), 33, replace = TRUE),
                      Age = runif(33, 18, 25),
                      Diet = "A", year = 2000)

# We want to merge the long-format data with db_pat to add the patient
# characteristics. Merging by c("ID", "year") is an inner join, so only
# rows with a matching ID AND year in both data sets are kept -- since
# db_pat only has year = 2000, only the year-2000 rows survive the merge.

db_merge <- merge(db_long, db_pat, by = c("ID", "year"))

head(db_merge)


# --- Optional extension: add year-2002 patient data --------------------------
# db_pat2 <- data.frame(ID = 1:33,
#                        sex = sample(c("F", "M"), 33, replace = TRUE),
#                        Age = runif(33, 18, 25),
#                        Diet = "B", year = 2002)
# db_pat <- rbind(db_pat, db_pat2)
#
# table(db_pat$year)
