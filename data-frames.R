vect1 <- c(1, 2, 3, 4)
vect2 <- c(13, 5, 7, 34)

data.frame(vect1, vect2)

data.frame(first = vect1, second = vect2) # column names will be first and second

df <- data.frame(vect1, vect2)
class(df) # data.frame

m <- matrix(vect2, 2, 2) # vect1 contains 4 elements, therefore row and column are 2: 2 x 2 = 4
m

named_df <- data.frame(first_vector = vect1, second_vector = vect2)
named_df 

named_df$first_vector
named_df$second_vector

named_df[1,] # print all values of first row
named_df[,2] # print all values of second column

 