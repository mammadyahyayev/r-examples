# to install packages, write following
install.packages("ggplot2")

# to use packages 
library(ggplot2)

vect1 <- c(1, 2, 3, 4)
vect2 <- c(13, 5, 7, 34)

data.frame(first = vect1, second = vect2)

ggplot(df, aes(vect1, vect2)) + geom_point()
