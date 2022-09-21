gender <- c("male", "female")
scores <- c(123, 345, 234, 123, 345, 234, 678, 954, 347)
status <- c(TRUE, FALSE, T, F)
mix <- c(TRUE, FALSE, 2344, 23, 12, "hey", 'aa') # if we mix data types, they will be converted into character

vect1 <- c(1, 2, 3, 4)
vect2 <- c(13, 5, 7, 34)

result <- vect1 + vect2 # it will sum of each value with its appropriate

mix_vect <- c(vect1, vect2)

gender
scores
status
mix
result
mix_vect

class(gender) # character
class(scores) # numeric
class(status) # logical
class(mix) # character
class(vect1) # numeric
class(mix_vect) # numeric


vect1[1:3] # prints 1 2 3

vect1[-1] # prints all values except first one (1)
vect1[-2] # prints all values except second one (2)


vect1[c(T,F,F,T)] # prints 1 and 4

