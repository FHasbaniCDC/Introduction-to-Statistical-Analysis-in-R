install.packages('multcomp')
library(multcomp)
str(cholesterol)
tail(cholesterol)
attach(cholesterol)

aov_model <- aov(response ~ trt)
summary(aov_model)
detach(cholesterol)

#install.packages('gplots')
library(gplots)
plotmeans(response ~ trt, xlab="Treatment", ylab="Response",
          main="Mean Plot\nwith 95% CI")

TukeyHSD(aov_model)

#upgrade all the packages if either: There is a more recent 
#version on the CRAN OR re-install the package if it was built
#with an older version of R.

#update.packages(checkBuilt = TRUE)

#install.packages("car", dependencies = TRUE)
library(car)
outlierTest(aov_model)


