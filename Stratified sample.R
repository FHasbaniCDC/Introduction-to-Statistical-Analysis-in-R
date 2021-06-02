library(dplyr)
#library(devtools)

#Stratified sampling
set.seed(1)
d1  <- data.frame(ID = 1:100, A = sample(c("AA", "BB", "CC", "DD", "EE"), 100, 
                                           replace = TRUE),
                    B = rnorm(100), 
                    C = abs(round(rnorm(100), digits = 1)), 
                    D = sample(c("CA", "NY", "TX"), 100, replace = TRUE), 
                    E = sample(c("M", "F"), 100, replace = TRUE))

# What do the data look like in general?
summary(d1)

#obtain stratified sample
strat_smp<- d1 %>% group_by("B") %>% sample_n(size=10)
strat_smp

# Let's take a 10% sample from only 'A' and 'B' groups from -A- in d1
strat_smp <- d1 %>% group_by("A") %>% sample_frac(size=.10)
table(strat_smp$A)

# Let's take 7 samples from all -D- groups in d1, specified by column# number
strat_smp <- d1 %>% group_by(!!!5)%>% sample_n(size=7)

# Use a two-column strata: -E- and -D- -E- varies more slowly, so it is better to put that first
strat_smp <- d1 %>% group_by("E", "D") %>% sample_frac(size= 0.20)

# Use a two-column strata (-E- and -D-) but only interested in cases where E- == "F"
strat_smp <- d1 %>% group_by("E", "D") %>% sample_frac(size= 0.15, weight=(E=="F"))


rsamp(pd, n=50, over=0.1, rep=FALSE)
size <- rsampcalc(nrow(pd), 3, 95, 0.5)
size <- rsampcalc(nrow(pd),3)
rsamp(pd, size)

ssampcalc(df=pd, n=105, strata=status, over=0.05)
or
size <- rsampcalc(nrow(albania), 3, 95, 0.5)
ssampcalc(albania, size, qarku)
