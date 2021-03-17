library(dplyr)
df <- read.csv("C:\Users\philliyd\Documents\My Stuff\BeVera\CDC bioinformatics\poisons.csv", TRUE) %>%
select(-X) %>% 
mutate(poison = factor(poison, ordered = TRUE))
glimpse(df)

#Step 1) You can check the level of the poison with the following code. You should see three character values because you convert them in factor with the mutate verb.

levels(df$poison)

#Step 2) You compute the mean and standard deviation.

df % > %
  group_by(poison) % > %
  summarise(
    count_poison = n(),
    mean_time = mean(time, na.rm = TRUE),
    sd_time = sd(time, na.rm = TRUE)
  )

#Step 3) In step three, you can graphically check if there is a difference between the distribution. Note that you include the jittered dot.

ggplot(df, aes(x = poison, y = time, fill = poison)) +
  geom_boxplot() +
  geom_jitter(shape = 15,
              color = "steelblue",
              position = position_jitter(0.21)) +
  theme_classic()

#Step 4) You can run the one-way ANOVA test with the command aov. The basic syntax for an ANOVA test is:
  
aov(formula, data)
#Arguments:			
#- formula: The equation you want to estimate
#- data: The dataset used

anova_one_way <- aov(time~poison, data = df)
summary(anova_one_way)

#Code Explanation

aov(time ~ poison, data = df): Run the ANOVA test with the following formula
summary(anova_one_way): Print the summary of the test

#Pairwise comparison
#The one-way ANOVA test does not inform which group has a different mean. Instead, you can perform a Tukey test with the function TukeyHSD().

TukeyHSD(anova_one_way)

#We adjust our code by adding treat with the other independent variable.

anova_two_way <- aov(time~poison + treat, data = df)
summary(anova_two_way)

#https://www.guru99.com/r-anova-tutorial.html