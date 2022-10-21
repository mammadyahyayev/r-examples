# % % 
5 %% 2 # 2.5
5 %/% 2 # 2 (integer division)

pow <- function (a, b = 1) {
  return (a ** b)
}

pow(4, 5) # 1024
pow(10) # 10

print(is.numeric(4))
print(is.vector(c(1, 2, 3)))

arr <- array(c(1, 2, 3, 4, 5))
print(is.array(arr))

is.function(pow)

frame <- data.frame(c(1, 2, 3), c("Samir", "Cabbar", "Zakir"))
colnames(frame) = c("RowNum", "Name")
rownames(frame) = c("#1","#2","#3")
frame
is.data.frame(frame)


frame_with_na <- data.frame(c(1, 2, 3), names = c("Samir", "Cabbar", NA))

is.na(frame_with_na$names[2])

# as 
numbers_list <- list(1, 2, 3, 4, 5, 6)
numbers_list
class(numbers_list) # list

numbers_array <- as.array(numbers_list)
numbers_array
class(numbers_array) # array

class(as.character(3))













