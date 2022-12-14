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


numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

column_wise_matrix <- matrix(numbers, nrow=3, ncol = 3)
column_wise_matrix
#       [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

row_wise_matrix <- matrix(numbers, nrow=3, ncol = 3, byrow = TRUE)
row_wise_matrix
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9

named_matrix <- matrix(numbers, nrow=3, ncol=3, byrow = TRUE,
          dimnames = list(c('First', "Second", "Third"), c("A", "B", "C")))
named_matrix

#        A B C
# First  1 2 3
# Second 4 5 6
# Third  7 8 9

# another way of creating matrix is by using functions cbind() and rbind()
function_matrix <- cbind(c(1,2,3), c(4,5,6))
#        [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6
rownames(function_matrix) <- c("#1-", "#2-", "#3-")
colnames(function_matrix) <- c("A", "B")
function_matrix
#     A B
# #1- 1 4
# #2- 2 5
# #3- 3 6

function_row_bind_matrix <- rbind(c(1, 2, 3), c(4, 5, 6))
function_row_bind_matrix
#        [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6


# we can also create a matrix by using dim() function
dim(numbers) <- c(3,3)
numbers
#         [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9


numbers[1, 3] # 7
numbers[7] # 7
numbers[c(1, 2), c(3)] # 7 8
numbers[c(1,2,3), c(2)] # 4 5 6
# first part selects rows, second part select columns

numbers[2, ] # 2 5 8
numbers[,3] # 7 8 9

numbers[c(T, T, F),]
#       [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8

# first True - for first row
# second True - for second row
# False - for third row

numbers * 2
#       [,1] [,2] [,3]
# [1,]    2    8   14
# [2,]    4   10   16
# [3,]    6   12   18

numbers + 100
#       [,1] [,2] [,3]
# [1,]  101  104  107
# [2,]  102  105  108
# [3,]  103  106  109

# modify single element
numbers[3, 3] = "nine"
numbers
#       [,1] [,2] [,3]  
# [1,] "1"  "4"  "7"   
# [2,] "2"  "5"  "8"   
# [3,] "3"  "6"  "nine"


numbers[numbers < 5] <- numbers[numbers < 5] * (-1)
numbers

numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
dim(numbers) <- c(3,3)
rowSums(numbers) # 12 15 18
colSums(numbers) # 6 15 24

str(numbers) # num [1:3, 1:3] 1 2 3 4 5 6 7 8 9
