library(ggplot2)
library(dplyr)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species)) +
  geom_point()


ggplot(diamonds, aes(x=carat, y=price, color=clarity)) +
  geom_point(alpha = 0.4) +
  geom_smooth(alpha  = 0.1)


ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(alpha = 0.4) +
  geom_smooth(aes(color=clarity), alpha = 0.1)


ggplot(diamonds, aes(x=carat, y=price, color=clarity, size=carat)) +
  geom_point(alpha = 0.4, shape=5)


sub_diamonds <- diamonds %>% 
  arrange(desc(price)) %>% 
  top_n(20)


ggplot(sub_diamonds, aes(x=carat, y=price,  fill=carat, size=carat)) +
  geom_point(stroke = 1, shape = 21)

ggplot(sub_diamonds, aes(carat, price, size=carat, fill=carat)) +
  geom_point(shape=21, color='red', stroke=2) # give stroke to increase thickness

ggplot(sub_diamonds, aes(carat, price)) +
  geom_text(aes(label=rownames(sub_diamonds)), size=4)


ggplot(sub_diamonds, aes(carat, price, size=carat, fill=carat, shape=cut)) +
  geom_point()

ggplot(sub_diamonds, aes(carat, price, size=carat, fill=carat, shape=clarity)) +
  geom_point()


ggplot(sub_diamonds, aes(clarity, fill=clarity)) +
  geom_bar() +
  labs(x = "Clarity of the diamond", y = "Count")


ggplot(sub_diamonds, aes(y=clarity, fill=clarity)) +
  geom_bar(orientation = "y") +
  labs(y = "Clarity of the diamond", x = "Count")

palette <- c(I1 = 'red', SI2='yellow', VVS2='green', VS1='blue')

ggplot(sub_diamonds, aes(cut, fill=clarity)) +
  geom_bar(position = position_dodge()) +
  labs(x = "Cut of the diamond", y = "Count") +
  scale_fill_manual("Clarity of diamond", values = palette)




