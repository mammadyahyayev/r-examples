person <- c("Jack", "Rose", "Sam")
birthdates <- c("1999-03-01", "2000-12-23", "2000-09-20") # FORMAT: Year-Month-Day

class(birthdays)

people <- data.frame(name = person, birthdate = as.Date(birthdates))

class(people$birthdate)

birthdays <- as.Date(people$birthdate)

people <- data.frame(name = person, birthdate = birthdates)


people <- read.csv("people.csv")

people$birthdate = as.Date(people$birthdate)

people$birthdate = as.character(people$birthdate)

people$birthdate = format(people$birthdate, format="%d-%m-%Y")
