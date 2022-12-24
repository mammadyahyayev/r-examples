# Categorize the countries using some socio-economic and health factors that 
# determine under-developing, developing and developed countries by applying clustering methods

library(gridExtra)
library(factoextra)
library(FactoMineR)
library(arsenal)
library(tidyverse)

country <- read.csv("Country-data.csv")


View(country)

glimpse(country)

# Data Preprocessing

# Rename short column names to longer meaningful names
country <- country %>% rename(child_mortality = child_mort, 
                   life_expectancy = life_expec,
                   total_fertility = total_fer)


# Checking whether there are NA values or not
colSums(is.na(country))


# useful to check data types of each column
glimpse(country)

# with this statistics, we can easily said that there are huge gap 
# in the life for each country
summary(country)

# Furthermore, from the inspection above. The data are required to be scale
# since there are different range of value on each columns, so every columns will
# have same standardization or range of value. The standardization is important because
# the higher the scale, the higher the variance or covariance value which might cause bias.

scaled_country <- country %>% 
                  mutate_at(c(2:10), funs(c(scale(.))))

summary(scaled_country)

# PCA ( Principal Component Analysis )

rownames(scaled_country) <- scaled_country[,"country"]

scaled_country <- scaled_country %>%
  select(-country)

head(scaled_country)


country_pca <- prcomp(scaled_country)

biplot(country_pca, cex=0.8)


country_selected_pca <- data.frame(country_pca$x[,1:4])
head(country_selected_pca)

summary(country_pca)

country_pca <- country %>% 
  select_if(purrr::negate(is.numeric)) %>% 
  cbind(country_selected_pca)

glimpse(country_pca)

country_final <- country_pca %>% 
  select(-country)

head(country_final)


# KMEANS Clustering

fviz_nbclust(country_final, kmeans, method = "wss") + 
  labs(subtitle = "Elbow Method With PCA Value")

fviz_nbclust(country_final, kmeans, method = "silhouette") + 
  labs(subtitle = "Silhouette Method With PCA Value")

fviz_nbclust(country_final, kmeans, method = "gap_stat") + 
  labs(subtitle = "Gap Statistic method With PCA Value")


set.seed(100)

country_km_pca <- kmeans(country_final, centers = 3) 

country_final$cluster <- country_km_pca$cluster

unique(country_final$cluster)

cluster_pca <- fviz_cluster(country_km_pca, data = country_final) +
  labs(subtitle = "K-Means With PCA & K-Value = 3")

cluster_pca


country_final %>%
  group_by(cluster) %>% 
  summarise_all(mean)


#Assign into new object
country_profile <- scaled_country

#Assign cluster result into the new object
country_profile$cluster <- country_km_pca$cluster

country_profile %>%
  group_by(cluster) %>% 
  summarise_all(mean)



#Parameter filter
economic <- country_profile %>% 
  filter(exports < -0.42,
         imports < -0.15,
         income < -0.68,
         gdpp < -0.60) %>% 
  select(income,exports,imports, gdpp)

economic

#Change negative value into positive, for the sake of visualization
economic <- abs(economic)

#Change country section from index into columns, for the sake of visualization
economic <- tibble::rownames_to_column(economic, "country")

head(economic)


eco_piv_long <- pivot_longer(data = economic, 
                             cols = c("income", "exports", "imports", "gdpp"))
head(eco_piv_long,8)
  

ggplot(data = eco_piv_long, aes(x = value, y = reorder(country, value))) +
  geom_col(aes(fill = name),position = "dodge") +
  scale_x_continuous(label = scales::comma,
                     expand = c(0,0),
                     breaks = seq(0, 2.5, 0.25)) +
  labs(title = "Most Needed Aid Country In Economic Segmen",
       subtitle = "Comparismn between Income, Exports, Imports & GDP",
       x = "Value",
       y = "Country",
       color = "") +
  theme_bw()  +
  theme(legend.position = "bottom",
        legend.title = element_blank())



#Parameter filter
health <- country_profile %>% 
  filter(child_mortality  > 1.32,
         health < -0.13,
         life_expectancy < -1.27) %>% 
  select(child_mortality, health, life_expectancy)

health


#Change negative value into positive, for the sake of visualization
health <- abs(health)

#Change country section from index into columns, for the sake of visualization
health <- tibble::rownames_to_column(health, "country")

health


health_piv_long <- pivot_longer(data = health, 
                                cols = c("child_mortality", "health", "life_expectancy"))
head(health_piv_long,9)


ggplot(data = health_piv_long, aes(x = value, y = reorder(country, value))) +
  geom_col(aes(fill = name),position = "dodge") +
  scale_x_continuous(label = scales::comma,
                     expand = c(0,0),
                     breaks = seq(0, 4, 0.25)) +
  labs(title = "Most Needed Aid Country In Health Segmen",
       subtitle = "Comparismn between Child Mortality, Health & Life Expected",
       x = "Value",
       y = "Channel",
       color = "") +
  theme_bw()  +
  theme(legend.position = "bottom",
        legend.title = element_blank())




# https://rpubs.com/VicNP/uml-kmeans-clustering
# https://builtin.com/data-science/step-step-explanation-principal-component-analysis
# https://builtin.com/data-science/dimensionality-reduction-python
# https://medium.com/@faizfadhilah1/clustering-the-countries-of-the-world-using-socio-economics-and-health-factor-for-help-4b62f7e739da
# https://aforanalysis.wordpress.com/2021/02/11/clustering-countries-based-on-socio-economic-and-health-factors/
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6277727/
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8264526/


# PCA, methods




