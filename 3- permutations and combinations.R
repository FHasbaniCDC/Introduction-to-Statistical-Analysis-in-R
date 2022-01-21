#Permutations and Combinations
#examples
#1- Permutations with repetitions
#2- Combinations without repetitions
#3- Permutations (of all elements) without repetitions


#1-permutations with repetitions
pwi <- expand.grid(rep(list(0:9), 3))
pwi

#see the formulas from the lecture
10^3
# [1] 1000
nrow(pwi)
# [1] 1000

cwop <- combn(1:49, 6)
cwop[ , 1:10] #6 balls, the first 10 columns

choose(49, 6)
## [1] 13983816

factorial(49) / (factorial(6) * factorial(49 - 6))
## [1] 13983816
#cwop
ncol(cwop)
## [1] 13983816

#Written in Learning Machines, June 2019, lines 32--54
#permutations (of all elements) without repetitions - there is no readily available function in Base R. 
#You can write our own:
perm <- function(v) {
  n <- length(v)
  if (n == 1) v
  else {
    X <- NULL
    for (i in 1:n) X <- rbind(X, cbind(v[i], perm(v[-i])))
    X
  }
}
#it's a recursive function (call) within a loop.
#idea is to fix one element after the other [for (i in 1:n) 
#and cbind(v[i], ...)] and permute the remaining elements 
#[perm(v[-i])] down to the base case when only one element 
#remains [if (n == 1) v], which cannot be permuted any further.
#Collect all sets on the respective higher level [X <- (rbind(X, ...)]
#and return the whole matrix X.
p_wo <- perm(1:4)
p_wo #example of the order of students that come into the classroom

#n! Use the factorial function
factorial(4)
# [1] 24
nrow(p_wo)


#Example using gtools package, the permutation function
#install.packages('gtools')
#load library
library(gtools)

#Example
#study with 4 letters
x <- c("A","C","G","T")
#pick 2 letters from the results with replacement
#get all permutations
permutations(n=4,r=11,v=x,repeats.allowed=T)
#number of permutations
head(permutations(n=4,r=11,v=x,repeats.allowed=T))
nrow(permutations(n=4,r=11,v=x,repeats.allowed=T))

#Permutation without replacement function
perm_without_replacement <- function(n,r){
  return(factorial(n)/factorial(n - r))
}
perm_without_replacement(16,16)
perm_without_replacement(16,4)

#Combination without replacement
choose(5,2)# 5 4 3 2 1 / 3 2 1 = 120/6
for (n in 0:10) print(choose(n, k = 0:n))

#Combination with replacement
comb_with_replacement <- function(n, r){
  return( factorial(n + r - 1) / (factorial(r) * factorial(n - 1)) )
}
#have 3 elements, choosing 3
comb_with_replacement(4,2) #that is n-1=3 and r-1=2
#[1] 10

#Example
#three marbles in an urn
x <- c("red", "blue","black")
#pick 2 balls from the urn with replacement
#get all permutations
permutations(n=3,r=2,v=x)
#     [,1]    [,2]   
#[1,] "black" "blue" 
#[2,] "black" "red"  
#[3,] "blue"  "black"
#[4,] "blue"  "red"  
#[5,] "red"   "black"
#[6,] "red"   "blue"

#number of permutations
nrow(permutations(n=3,r=2,v=x))
#[1] 6

