#install.packages("ppcor")
library("ppcor")

# Partial correlation between "NHR","HNR" and "Shimmer.DDA"
with(pd, pcor.test(NHR,HNR,Shimmer.DDA))

#Semi-partial (part) correlation for two variables given a third variable.
#Semi partial correlation - Age constant for Weight only
#spcor.test(x, y, z, method = c("pearson", "kendall", "spearman"))

# data
df <- data.frame(currentGrade = c(82, 88, 75, 74, 93, 97, 83, 90, 90, 80),
                 hours = c(4, 3, 6, 5, 4, 5, 8, 7, 4, 6),
                 examScore = c(88, 85, 76, 70, 92, 94, 89, 85, 90, 93)
                 )

#view data frame
df

#calculate partial correlations.
#function pcor can calculate the pairwise partial correlations for 
#each pair of variables given others. In addition, it gives us the p value
#as well as statistic for each pair of variables.
pcor(df)

#The function pcor.test can calculate the pairwise partial correlations between two variables
pcor.test(df$currentGrade,df$hours,df[,c("examScore")])
pcor.test(df[,1],df[,2],df[,3])
pcor.test(df[,1],df[,2],df[,3])
pcor.test(df[,1],df[,2],df[,-c(1:2)])

#Partial correlation between hours studied and final exam score:
#The partial correlation between hours studied and final exam score is .191, 
#which is a small positive correlation. 
#As hours studied increases, exam score tends to increase as well, assuming current grade is held constant.

#The p-value for this partial correlation is .623, 
#which is not statistically significant at ?? = 0.05.


#e function spcor can calculate the pairwise semi-partial (part) 
#correlations for each pair of variables given others.
#The function spcor.test can calculate the pairwise semi-partial (part) correlations between two variables.

# semi-partial (part) correlation between "currentGrade" and "hours" given "examScore"
spcor.test(df$currentGrade,df$hours,df[,c("examScore")])
spcor.test(df[,1],df[,2],df[,c(3)])
spcor.test(df[,1],df[,2],df[,-c(1:2)])
