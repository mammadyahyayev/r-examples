numbers <- c(1, 2, 3, 4, 5)

for (n in numbers) {
  print(n)
}
  
for (i in 1:length(numbers)) {
  print(numbers[i])
}



count <- 0

while(count < 5) {
  print(count)
  count <- count + 1
}
