library(dplyr)
library(readr)

glimpse(counties)
View(counties)

# Select specific columns
counties %>%
  select(state, county, population, men, women)

# Select range of columns
counties %>%
  select(state:hispanic)

# Select all columns except one column
counties %>%
  select(-state) 

# Select all columns except following columns
counties %>%
  select(-c(county, population, men, women, black, native))

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







