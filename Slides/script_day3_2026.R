# ==========================================================================
# Intro to R -- Day 3
# Plots
# ==========================================================================

set.seed(111)
db_long <- data.frame(ID = rep(1:33, 2),
                       year = factor(rep(c(2000, 2002), 33)),
                       weight = rnorm(66, 60, 5),
                       height = rnorm(66, 172, 5))

# Mean height and mean weight (needed later for reference lines on the plot)
meanh <- mean(db_long$height)
meanw <- mean(db_long$weight)


# ==========================================================================
# Scatterplot 1
# ==========================================================================
# For continuous variables we can visualize the data with a scatterplot.

# Plotting a single variable: the x-axis is just the observation index (1, 2, 3, ...)
plot(db_long$height)

plot(db_long$weight, xlab = " ", ylab = "Weight (kg)")

# Relationship between two variables
plot(db_long$height, db_long$weight)

plot(db_long$height, db_long$weight,
     xlab = "Height (cm)", ylab = "Weight (kg)", ylim = c(50, 70),
     col = "red", pch = 15,
     main = "Scatterplot")

abline(v = meanh, col = "green", lty = 2, lwd = 2)
abline(h = meanw, col = "blue", lty = 2)

points(meanh, meanw, lwd = 3, lty = 2, col = "orange")

# Regression line: fitted line for the average weight given height
object <- lm(weight ~ height, db_long)
abline(object, col = "blue")


# ==========================================================================
# Scatterplot 2 -- coloring points by group
# ==========================================================================

plot(db_long$height, db_long$weight,
     xlab = "height (cm)", ylab = "weight (kg)", ylim = c(50, 70),
     col = db_long$year, pch = 15,
     main = "Scatterplot")
# When a factor is passed to col=, R uses its underlying level codes
# (1, 2, ...) against the default palette -- level 1 ("2000") = black,
# level 2 ("2002") = red, matching col = 1:2 in the legend below
legend("topleft", levels(db_long$year), pch = 15, col = 1:2,
       inset = .05, title = "Year")

# --- Using custom colors instead of the default palette --------------------

group_colors <- c("2000" = "green", "2002" = "blue")
# Indexing a named vector with a factor matches by the factor's level
# LABEL (e.g. "2000"), not by its underlying integer code
db_long$color <- group_colors[db_long$year]

# Equivalent alternative using ifelse():
# db_long$color2 <- ifelse(db_long$year == "2000", "red", "blue")

plot(db_long$height, db_long$weight,
     xlab = "height (cm)", ylab = "weight (kg)",
     # xlim = c(min(db_long$height), 185),
     # ylim = c(min(db_long$weight), 70),
     col = db_long$color, pch = 15,
     main = "Scatterplot")

legend("topleft", levels(db_long$year), pch = 15,
       col = c("green", "blue"),
       inset = .05, title = "Year")


# ==========================================================================
# Other examples for plot()
# ==========================================================================
# plot() does not require x and y to come from the same data.frame or
# object -- they only need to be the same length, since together they
# give the (x, y) coordinates of each point.

plot(c(0, 3, 6), c(0, 0.5, 1), col = "red", ylim = c(-2, 2))

# Equivalent to:
a <- c(0, 3, 6)
b <- c(0, 0.5, 1)
plot(a, b, col = "red", ylim = c(-2, 2))

# ... or:
dbb <- data.frame(a, b)
plot(dbb$a, dbb$b, col = "red", ylim = c(-2, 2))


# ==========================================================================
# Boxplot
# ==========================================================================

# Caution: db_long$year has one value PER ROW (66), but boxplot() needs
# one color PER GROUP (2). This only looks right because of how the rows
# happen to be ordered -- it is not a reliable way to color boxplots.
boxplot(weight ~ year, db_long,
        xlab = "Year",
        names = c("2000", "2002"), col = db_long$year)

# To be 100% sure: map colors explicitly to the group levels instead
boxplot(weight ~ year, db_long,
        xlab = "Year", names = levels(db_long$year),
        col = c("gray", "red"))

# As with aggregate(), we can cross several categorical variables with "+"
db_long$height_cat <- cut(db_long$height,
                           breaks = c(-Inf, median(db_long$height), Inf),
                           labels = c("short", "long"))
boxplot(weight ~ year + height_cat, db_long,
        xlab = "Year")


# ==========================================================================
# Histogram 1
# ==========================================================================

hist(db_long$weight, col = "lightblue", xlab = "Weight (kg)", main = "Histogram")


# ==========================================================================
# Histogram 2 -- with a density curve
# ==========================================================================

hist(db_long$weight, col = "lightblue", xlab = "Weight (kg)", main = "Histogram", prob = TRUE)
lines(density(db_long$weight, na.rm = TRUE))


# ==========================================================================
# Putting it all together: a 2x2 panel of plots
# ==========================================================================

par(mfrow = c(2, 2))

plot(db_long$height, db_long$weight,
     xlab = "height (cm)", ylab = "weight (kg)", ylim = c(50, 70),
     col = db_long$year, pch = 15,
     main = "Scatterplot")

boxplot(weight ~ year, db_long,
        xlab = "Year", names = c("2000", "2002"),
        col = c("gray", "red"))

hist(db_long$weight, col = "lightblue", xlab = "Weight (kg)", main = "Histogram")

hist(db_long$weight, col = "lightblue", xlab = "Weight (kg)", main = "Histogram", prob = TRUE)
lines(density(db_long$weight, na.rm = TRUE))

dev.off()  # tells R the plots no longer need to go into a 2x2 grid
