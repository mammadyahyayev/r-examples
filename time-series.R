library(dplyr)
library(ggplot2)
library(lubridate)

suppliers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
amounts <- c(9, 8, 9, 12, 9, 12, 11, 7, 13, 9, 11, 10)

customer_df <- data.frame(supplier = suppliers, amount=amounts)

mean_amount <- amounts %>% mean()

customer_df_mean_squared_error <- customer_df %>% 
  mutate(error=amount-mean_amount) %>% 
  mutate(error_squared=error*error)

mean_squared_error <- mean(customer_df_mean_squared_error$error_squared)
sum_squared_error <- sum(customer_df_mean_squared_error$error_squared)
  
calculate_squared_error(customer_df$amount, 10)
calculate_squared_error(customer_df$amount, 10, FALSE)


calculate_squared_error <- function(data, estimate, mean_squared_error=TRUE) {
  error <- data-estimate
  error_squared <- error*error
  if(mean_squared_error) {
    return (mean(error_squared))
  } 
  
  return(sum(error_squared))
} 




oil_price <- read.csv("C:/Users/User/Desktop/data-science/Probability and Statistics/Course Paper/BP-CRUDE_OIL_PRICES.csv")
View(oil_price)

oil_price <- oil_price %>% 
  select(Date,  Price.in.2021.Dollars) %>% 
  rename(date=Date, price=Price.in.2021.Dollars)

oil_price <- oil_price %>%
  transmute(date, price, year=format(as.Date(date, format="%Y-%m-%d"),"%Y"))

View(oil_price)
