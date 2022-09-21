vect1 <- c(1, 2, 3, 4)
vect2 <- c(13, 5, 7, 34)

mix <- list(vect1, vect2)
mix

new_mix <- list(mix, 20, 25, 44, TRUE)
new_mix

mean <- list(1, 1, 2, 2, 2, 3, 3, 31, 31, 32, 32, 32, 33, 33, mean)

class(list) # function, because at the end of the list there is a function called mean

median(c(1, 1, 2, 2, 2, 3, 3, 31, 31, 32, 32, 32, 33, 33))
mean(c(1, 1, 2, 2, 2, 3, 3, 31, 31, 32, 32, 32, 33, 33))


new_mix[5]


named_list <- list(first = 1, second = 2, "third" = 3, "money" = 44)
named_list
# prints followings

# $first
# [1] 1
# 
# $second
# [1] 2
# 
# $third
# [1] 3
# 
# $money
# [1] 44

names(named_list) # prints "first"  "second" "third"  "money" 

named_list$first # 1
named_list$second # 2
named_list$third # 3
named_list$money # 44





















