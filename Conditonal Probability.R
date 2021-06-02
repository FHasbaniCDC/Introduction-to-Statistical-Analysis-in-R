
#Must install packages plyr and dplyr if not before. Check packages.
#install.packages("plyr")
#install.packages("dplyr")
library(plyr)
library(dplyr)

#Example using a card tossed in the air, with 1 on one side, and 2 on the other
f <- function(toss=1){
  x <- sample(1:2, size=toss, replace=TRUE)
  y <- sample(1:2, size=toss, replace=TRUE)
  return(cbind(x,y))
}
set.seed(2500)
toss_times <- as.data.frame(f(2000))

freq <- ddply(toss_times, ~x, summarize,
              y1=sum(y==1), y2=sum(y==2))
row.names(freq) <- paste0('x',1:2)
prob_table1 <- freq[,-1]/2000
prob_table1

prob_x <- table(toss_times$x)/2000
prob_y <- table(toss_times$y)/2000
prob_table2 <- outer(prob_x,prob_y,'*')
rownames(prob_table2) <- paste0('x',1:2)
colnames(prob_table2) <- paste0('y',1:2)
prob_table2

#prob_table1 and prob_table2 have close values, indicating
#that the toss of the two cards  are probably independent.

#conditional probability
#using a contingency table
P_Accident_who_follow_Traffic_Rule <- 50
P_who_follow_Traffic_Rule = 50+2000

#output the values of line 35 and 36
P_Accident_who_follow_Traffic_Rule
P_who_follow_Traffic_Rule

Conditional_Probability=(P_Accident_who_follow_Traffic_Rule/P_who_follow_Traffic_Rule)
#outputs the statistic
Conditional_Probability

#Example
#sample
flu <- sample(c('No','Yes'), size=100000, replace=TRUE, prob=c(0.99,0.01))
test <- rep(NA, 100000) # create a dummy variable first
#joint prob
test[flu=='No'] <- sample(c('Neg','Pos'), size=sum(flu=='No'), replace=TRUE, prob=c(0.95,0.05))
test[flu=='Yes'] <- sample(c('Neg','Pos'), size=sum(flu=='Yes'), replace=TRUE,prob=c(0.1, 0.9))

#P(test + | no flu) = 1 - P(test - | no flu) = 0.05
#what is the chance that you have the flu given that you tested positive
mean(flu[test=='Pos']=='Yes')

#using Bayes theorem
#P(flu=Yes|test+) = P(test+|flu=Yes)P(flu=Yes)/P(test+)

#P(test+|flu=Yes)P(flu=Yes)/[P(test+|flu=Yes)P(flu=Yes)+P(test+|flu=No)P(flu=No)]
#= 0.9 x 0.01 / (0.9 x 0.01 + 0.05 x 0.99)
#= 0.1538




