#confusion matrix is a very useful tool for calibrating the output of a model and examining all
#possible outcomes of your predictions (true positive, true negative, false positive, 
#false negative).

data("city_population")
data_set <- na.omit(city_population)
criterion_col <- 3
cols_to_fit <- 4:ncol(data_set)

num_training_rows <- 5
train_data <- city_population[c(3:(3+num_training_rows)),]
ttb <- ttbModel(train_data, criterion_col, cols_to_fit)
reg <- regModel(train_data, criterion_col, cols_to_fit)
lreg <- logRegModel(train_data, criterion_col, cols_to_fit)

out_fwd_row_pairs_only <- predictPairSummary(train_data, ttb, reg, lreg)
fwd_df <- data.frame(out_fwd_row_pairs_only)
fwd_df$Row1 <- train_data$Name[fwd_df$Row1]
fwd_df$Row2 <- train_data$Name[fwd_df$Row2]
fwd_df

ref_data <- out_fwd_row_pairs_only[,"CorrectGreater"]
predictions <- out_fwd_row_pairs_only[,"ttbModel"]
ttb_fwd_confusion_matrix <- confusionMatrixFor_Neg1_0_1(ref_data, predictions)

#Generating "reverse" row pairs

out_fwd_row_pairs_only <- predictPairSummary(train_data, ttb, reg, lreg)
train_data_rev_rows <- train_data[c(nrow(train_data):1),]
out_rev_row_pairs_only <- predictPairSummary(train_data_rev_rows, ttb, reg, lreg)
out_both <- rbind(out_fwd_row_pairs_only, out_rev_row_pairs_only)
both_df <- data.frame(out_both)
both_df$Row1 <- train_data$Name[both_df$Row1]
both_df$Row2 <- train_data$Name[both_df$Row2]
both_df

#With that output, we can generate a complete confusion matrix for Take The Best. 
#It has non-zero data in both the first "-1" row and the last "1" row.

ref_data <- out_both[,"CorrectGreater"]
predictions <- out_both[,"ttbModel"]

#You might notice a symmetry in this confusion matrix. 
#there are 7 cases where TTB accurately predicted 1 where the CorrectGreater value was 1. 
#When these rows were reversed, they resulted in 7 cases where TTB accurately predicted -1 
#where the CorrectGreater value was -1. This happens because TTB is a symmetric model, 
#meaning predictPair(Row1, Row2) = - predictPair(Row2, Row1). 

ttb_fwd_confusion_matrix + reverseRowsAndReverseColumns(ttb_fwd_confusion_matrix)
##        predictions
## correct -1 0 1
##      -1  7 6 2
##      0   0 0 0
##      1   2 6 7
#Yet another way to calculate this complete confusion matrix is to use the more flexible rowPairApplyList function (rather than predictPairSummary) to generate the prediction data. Specifically, set the optional parameter also_reverse_row_pairs=TRUE.

out <- rowPairApplyList(train_data, list(correctGreater(criterion_col), heuristics(ttb, reg, lreg)), also_reverse_row_pairs=TRUE)
out
confusionMatrixFor_Neg1_0_1(ref_data, predictions)

#Calculating Take The Best's confusion matrix from this output produces the same result
#as above.

ref_data <- out[,"CorrectGreater"]
predictions <- out[,"ttbModel"]

statsFromConfusionMatrix(confusion_matrix_ttb)

confusion_matrix_3x3_ttb <- confusionMatrixFor_Neg1_0_1(out[,"CorrectGreater"], out[,"ttbModel"])
confusion_matrix_3x3_ttb
##        predictions
## correct -1 0 1
##      -1  7 6 2
##      0   0 0 0
##      1   2 6 7
confusion_matrix_3x3_reg <- confusionMatrixFor_Neg1_0_1(out[,"CorrectGreater"], out[,"regModel"])
confusion_matrix_3x3_reg
##        predictions
## correct -1 0 1
##      -1  9 2 4
##      0   0 0 0
##      1   4 2 9
confusion_matrix_3x3_lreg <- confusionMatrixFor_Neg1_0_1(out[,"CorrectGreater"], out[,"logRegModel"])
confusion_matrix_3x3_lreg
##        predictions
## correct -1 0 1
##      -1  9 2 4
##      0   0 0 0
##      1   4 2 9
Take The Best does worse on this data because it guesses much more than the regression models- 12 guesses (6+6) vs. only 4 (2+2). When TTB is not guessing, it is highly accurate, getting 7 correct for every 2 incorrect, an excellent ratio of 3.5. The regression models have a non-guessing correctness ration of 9 vs. 4 = 2.25. We will see in the next section the impact these numbers have on the percent correct, but we will need a way to deal with guesses to do that.

It interesting that regression and logistic regression have the exact same confusion matrix, even though the output showed they sometimes disagreed. Below are the cases where they diagreed, and we see that their correct and incorrect values exactly balance out. Notice also that these were rows that Take The Best guessed on, deeming them too hard to distinguish.

out_df <- data.frame(out)
out_df[out_df$regModel != out_df$logRegModel,]
##    CorrectGreater ttbModel regModel logRegModel
## 1               1        0        1          -1
## 2               1        0        1          -1
## 9               1        0       -1           1
## 12              1        0       -1           1
## 18             -1        0        1          -1
## 19             -1        0        1          -1
## 29             -1        0       -1           1
## 30             -1        0       -1           1
Distributing guesses and ties
In order to calculate percentCorrect from the confusion matrix, we need to handle the guesses. Heuristica offers a function that allocates these by their expected values, so half the guess counts are moved to +1 and half are moved to -1. Then the guess row can be removed. (Note that there are other ways to handle guesses, e.g. counting them all as correct or not counting them at all.)

Below we see the original matrix and how it looks after having guesses distributed by collapseConfusionMatrix3x3To2x2. (Likewise it distributes half the ties to +1 and half to -1, although in this data set there were no ties.)

confusion_matrix_3x3_ttb
##        predictions
## correct -1 0 1
##      -1  7 6 2
##      0   0 0 0
##      1   2 6 7
confusion_matrix_ttb <- collapseConfusionMatrix3x3To2x2(confusion_matrix_3x3_ttb)
confusion_matrix_ttb
##        predictions
## correct -1  1
##      -1 10  5
##      1   5 10
The number of correct predictions is along the diagonal- where correct was -1 and the prediction was -1 and where correct was 1 and the prediction was 1. So the percent correct is the sum of the diagonal divided by the sum of the whole matrix.

percent_correct_ttb <- 100 *sum(diag(confusion_matrix_ttb)) / sum(confusion_matrix_ttb)
percent_correct_ttb
## [1] 66.66667
This agrees with the output of heuristica's one-step percentCorrect function would tell us.

percentCorrect(train_data, ttb)
##   ttbModel
## 1 66.66667
Now distribute guesses for the regression models. Funnily enough, we end up with the same confusion matrix and accuracy as Take The Best. In other words, the additional "predictions" that regression models made did no better than Take The Best's guesses! (Perhaps a regression user would be "overconfident.")

confusion_matrix_3x3_reg
##        predictions
## correct -1 0 1
##      -1  9 2 4
##      0   0 0 0
##      1   4 2 9
confusion_matrix_reg <- collapseConfusionMatrix3x3To2x2(confusion_matrix_3x3_reg)
confusion_matrix_reg
##        predictions
## correct -1  1
##      -1 10  5
##      1   5 10
Alternatives

## $accuracy
## [1] 0.6666667
## 
## $sensitivity
## [1] 0.6666667
## 
## $specificity
## [1] 0.6666667
## 
## $precision
## [1] 0.6666667
confusionMatrixFor_Neg1_0_1(ref_data, predictions)

#accuracy = (true positive + true negatve) / all (100 times this is the same as percentCorrect)
#sensitivity = true pasitive rate = true positive / all positive (sensitivity is also called recall)
#specificity = true negative rate = true negative / all negative
#precision = positive predictive velue = true positive rate