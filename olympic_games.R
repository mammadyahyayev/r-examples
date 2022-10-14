library(readxl)
library(dplyr)

olympic_games <- read_excel("olympic_games.xlsx")
olympic_games %>% 
  count()

# how many Olympic games have been held
olympic_games %>% 
  summarise(min_year = min(year), max_year = max(year), diff = (max_year - min_year + 4) / 4)

# first and last Olympic game
olympic_games %>% 
  filter(year == max(year) | year == min(year))


host_continents <- olympic_games %>% 
  group_by(continent) %>% 
  count(name = "count") 
  
host_cities <- olympic_games %>% 
  group_by(city) %>% 
  count(name = "count") 

# top n cities where the Olympic Games held most
olympic_games %>% 
  group_by(city) %>% 
  count(name = "count") %>% 
  arrange(desc(count)) %>% 
  ungroup() %>% 
  top_n(3)
  

pie(host_continents$count, 
    labels=host_continents$continent,
    main="Olympic games hosted by countries",
    col = rainbow(length(host_continents$continent)))


library(ggplot2)

ggplot(data = host_continents, aes(x="", y = count, fill = continent)) +
  geom_bar(stat = "identity", color = "black") +
  coord_polar("y") +
  labs(title = "The Olympic Games held by continents so far")

    