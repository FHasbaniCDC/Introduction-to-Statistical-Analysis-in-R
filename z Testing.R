#z Testing. Program by Joseph Schmuller

z.test = function(x,mu,popvar){
  one.tail.p <- NULL
  z.score <- round((mean(x)-mu)/(popvar/sqrt(length(x))),3)
  one.tail.p <- round(pnorm(abs(z.score),lower.tail = FALSE),3)
  cat(" z =",z.score,"\n",
      "one-tailed probability =", one.tail.p,"\n",
      "two-tailed probability =", 2*one.tail.p )}

#example
IQ.data <- c(100,101,104,109,125,116,105,108,110)
z.test(IQ.data,100,15)