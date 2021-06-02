library("sampler")

#Stratified sampling
set.seed(1)
d1  <- data.frame(ID = 1:100, A = sample(c("AA", "BB", "CC", "DD", "EE"), 100, 
                  replace = TRUE),
                  B = rnorm(100), 
                  C = abs(round(rnorm(100), digits = 1)), 
                  D = sample(c("CA", "NY", "TX"), 100, replace = TRUE), 
                  E = sample(c("M", "F"), 100, replace = TRUE))


#Determine random sample size, e=error of margin
#rsampcalc(N, e, ci=95,p=0.5, over=0)
rsampcalc(1000, 2.5, ci=95,p=0.5, over=0)

#Draw a simple random sample
#rsamp(df, n, over=0, rep=FALSE)
#Where: * df is object containing full sampling data frame * n is sample size (integer #or object containing sample size) * over (optional) is desired oversampling #proportion (defaults to 0; takes value between 0 and 1 as input) * rep (optional) is #boolean for a sample with repalcement (TRUE) or without replacement (defaults to #FALSE)
rsamp(pd,100)

#Determine sample size by strata using proportional allocation
ssampcalc(df, n, strata, over=0)
#Where: * df is object containing sampling data frame * n is sample size (integer) or #object containing sample size * strata is variable in sampling data frame by which #to stratify * over (optional) is desired oversampling proportion (defaults to 0; takes #value between 0 and 1 as input)
#Returns proportional sample size per strata (rounded up to nearest integer)
table(pd$status)
ssampcalc(pd,100,status,over=0)
ssampcalc(pd,100,status,over=.5)

#Draw stratified sample (proportional allocation)
ssamp(df, n, strata, over=1)
#example
x<-ssamp(pd, 100, status, over=.5)
head(x)
tail(x)
table(x$status)

#Where: * df is object containing full sampling data frame * n is sample size (integer, #or object containing sample size) * strata is variable in sampling data frame by #which to stratify (e.g. region) * over (optional) is desired oversampling proportion #(defaults to 0; takes value between 0 and 1 as input)
#Returns stratified sample using proportional allocation without replacement

#Determine sample size by strata using sub-units
psampcalc(df, n, strata, unit, over=0)
#Where: * df is object containing full sampling data frame * n is sample size (integer) #or object containing sample size * strata is variable in sampling data frame by #which to stratify * unit is variable in sampling data frame containing sub-units #(e.g. population) * over (optional) is desired oversampling proportion (defaults to 0; #takes value between 0 and 1 as input)
#Returns sample size per strata based on sub-units (rounded up to nearest integer)
#Example
sort(d1$E,decreasing = FALSE)
psampcalc(df=d1, n=50, strata=D, unit=nrow(d1), over=0)
table(d1$D)





