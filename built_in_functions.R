# sum()

numbers <- c(1, 2, 3, 4, 5, NA, 2, 9, 11, NA)
sum(numbers)
sum(12, 44, NA) # returns NA

num1 <- NA
num2 <- 45
sum(num1, num2) # returns NA

# if sum() returns NA, try following one
sum(num1, num2, na.rm = TRUE) # returns 45
# na.rm = TRUE means 'remove na', default is FALSE

# nchar()

nchar("i don't know") # returns 12

x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
nchar(x) # returns 5  6  6  1 15

x <- c("asfef", NA, "stuff.blah.yech")
nchar(x, keepNA = FALSE) # returns 5  2 15
# 2 for NA because it has 2 chars

# strsplit
message <- "This_is_message"
parts <- strsplit(message, "_")


numbers <- c(2, 4, 5, 6, 8, 8, 9, 10, 12, 15)
sd(numbers, na.rm=TRUE) # 2.160247

mean(numbers, trim=0.1)
