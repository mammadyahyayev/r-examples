library(ggplot2)
library(dplyr)
library(readxl)
library(lubridate)
library("tidyr")

excel_data <- read_excel("C:/Users/User/Desktop/data-science/Probability and Statistics/Course Paper/Oil Analysis.xlsx", sheet = "Oil Prices By Month")
View(excel_data)

colSums(is.na(excel_data))

oil_prices <- excel_data %>%
                  rename(location=LOCATION, date = TIME, price = VALUE) %>% 
                  drop_na()

colSums(is.na(oil_prices))

View(oil_prices)

usa_oil_prices <- oil_prices %>% 
                      filter(location == "USA")

usa_oil_prices$date <- as.Date(paste(usa_oil_prices$date, 1, sep="-"),"%Y-%m-%d")

View(usa_oil_prices)

oil_price_from_year <- function(x, year) {
  filtered_x <- filter(x, year(date) >= year)
  return (filtered_x)
}

usa_oil_prices_from_2014 <- oil_price_from_year(usa_oil_prices, 2014)

View(usa_oil_prices_from_2014)

ggplot(usa_oil_prices_from_2014, aes(x=date, y=price)) +
  geom_line()





