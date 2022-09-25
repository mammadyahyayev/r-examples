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

summary(named_df)
# Min.   :1.00   Min.   : 5.00  
# 1st Qu.:1.75   1st Qu.: 6.50  
# Median :2.50   Median :10.00  
# Mean   :2.50   Mean   :14.75  
# 3rd Qu.:3.25   3rd Qu.:18.25  
# Max.   :4.00   Max.   :34.00  


head(named_df, 2)
#             first_vector  second_vector
# 1            1            13
# 2            2             5


tail(named_df, 2)
#             first_vector  second_vector
# 3            3             7
# 4            4            34

word_length <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
head(word_length ,3) # 1 2 3
tail(word_length, 3) # 7 8 9

str(word_length) # num [1:9] 1 2 3 4 5 6 7 8 9
str(named_df)
# 'data.frame':	4 obs. of  2 variables:
# $ first_vector : num  1 2 3 4
# $ second_vector: num  13 5 7 34

person <- data.frame(name=c("Samir", "Cabbar", "Qalib"), age=c(23, 44, 36))
person
#     name   age
# 1  Samir   23
# 2  Cabbar  44
# 3  Qalib   36
 

# subset by row name
subset(person, subset=rownames(person) == '1') 
#   name   age
# 1 Samir  23


# subset row by vector of row names
subset(person, rownames(person) %in% c('1','2'))
# 1  Samir  23
# 2 Cabbar  44

# subset by condition
subset(person, age > 25)
# 2 Cabbar  44
# 3  Qalib  36


subset(person, age > 35 & age <= 40)
# 3 Qalib  36


subset(person, age > 30 | nchar(name) == 5)
# 1  Samir  23
# 2 Cabbar  44
# 3  Qalib  36

order(person$name)




