library(dplyr)
library(readr)

glimpse(counties)
View(counties)

x <- c(7,1,5)
x %>% mean()


country <- c("Malawi", "Haiti")
lifeExp <- c(48.3, 33.3)
continent <- c("A", "B")
df <- data.frame(country, lifeExp)


df %>% 
  mutate(continent = continent)

# Select specific columns
counties %>%
  select(not("region"))

# Select range of columns
counties %>%
  select(state:hispanic)

# Select all columns except one column
counties %>%
  select(-state) 

# Select all columns except following columns
counties %>%
  select(-c(county, population, men, women, black, native))


counties %>% 
  select(state, county, contains("work"))

counties %>% 
  select(state, county, starts_with("p"))

counties %>% 
  select(state, county, ends_with("k"))

# arrange methods

# sort ascending
counties %>%
  arrange(state)

# sort descending
counties %>%
  arrange(desc(state))

# filter methods

counties %>%
  filter(population > 10000000)

counties %>%
  filter(population > 100000, state == "Texas")

# mutate methods

counties %>%
  select(state, county, population, public_work, women, men) %>%
  mutate(public_workers = (public_work * population) / 100) %>%
  mutate(proportion_women = women / population) %>%
  mutate(proportion_men = men / population)

# count methods

# number of regions
counties %>%
  count(region, sort=TRUE)

 # number of citizens in each region
counties %>%
  count(region, wt=citizens)

# number of citizens in each state
counties %>%
  count(state, wt=citizens)

# how many people walk in each state
counties %>%
  select(state, county, population, walk) %>%
  mutate(population_walk = (population * walk) / 100) %>%
  count(state, wt=population_walk, sort=TRUE)

# how many people work in public area
counties %>%
  select(state, county, population, men, women, public_work) %>%
  mutate(public_workers = population * public_work / 100) %>%
  count(state, wt=public_workers, sort=TRUE)

# summarize methods
counties %>%
  select(state, county, population, public_work, land_area) %>%
  mutate(public_workers = round(population * public_work / 100)) %>% 
  arrange(public_workers) %>% 
  summarize(min_population = min(population),
            max_population = max(population),
            average_population = mean(population),
            total_population = sum(population),
            total_area = sum(land_area),
            min_public_workers = min(public_workers),
            max_public_workers = max(public_workers))


counties %>%
  select(state, county, population, public_work, land_area) %>%
  group_by(state) %>% 
  mutate(public_workers = round(population * public_work / 100)) %>% 
  arrange(public_workers) %>% 
  summarize(min_population = min(population),
            max_population = max(population),
            average_population = mean(population),
            total_population = sum(population),
            total_area = sum(land_area),
            min_public_workers = min(public_workers),
            max_public_workers = max(public_workers))

counties %>%
  group_by(state) %>%
  summarize(total_pop = sum(population))

counties %>%
  select(state, county, metro) %>%
  group_by(state, metro) %>% 
  count(state)
  

counties %>%
  select(state, county, metro) %>%
  group_by(state, metro) %>% 
  count(state)  %>% 
  filter(metro == "Metro")

counties %>%
  select(region, state, county, population, black) %>% 
  group_by(region) %>% 
  top_n(1, black)


counties %>% 
  group_by(state) %>% 
  summarize(average_pop = mean(population))

# rename methods
counties %>% 
  select(state, county, black_people_rate = black)

counties %>% 
  count(state) %>% 
  rename(number_of_counties = n)


counties %>% 
  transmute(state, county, population, public_workers = population * public_work / 100)

counties %>% 
  select(last_col())

counties
lag(counties, 3)
lead(counties, 11)


counties %>% 
  group_by(state) %>% 
  filter(state %in% c("Alabama", "Texas")) %>% 
  count(state)


vector_a <- c(4, 9, 22, 36)

diff = vector_a - lag(vector_a, default = 0)
diff    

diff <- lead(vector_a) - vector_a
diff









