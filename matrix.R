ages <- c(22, 24, 34, 42)
scores <- c(89, 78, 69, 91)

people <- matrix(c(ages, scores), 4, 2)

# colnames() and rownames() methods
# before the methods
#       [,1] [,2]
# [1,]   22   89
# [2,]   24   78
# [3,]   34   69
# [4,]   42   91

colnames(people) <- c("Ages", "Scores")

# after colnames()
#       Ages Scores
# [1,]   22     89
# [2,]   24     78
# [3,]   34     69
# [4,]   42     91

rownames(people) <- c("Cabbar", "Samir", "Babek", "Zakir")
# after rownames()
#         Ages Scores
# Cabbar   22     89
# Samir    24     78
# Babek    34     69
# Zakir    42     91







