library(ggplot2)
library(dplyr)
library(dendextend)
library(tibble)
library(tidyr)
library(purrr)
library(cluster)

oes_model <- kmeans(oes, centers=2)

oes <- mutate(oes, cluster = oes_model$cluster)

df_oes <- rownames_to_column(as.data.frame(oes), var = 'occupation')

df_oes <- mutate(df_oes, cluster = oes_model$cluster)

gathered_oes <- gather(data = df_oes, 
                       key = year, 
                       value = mean_salary, 
                       -occupation, -cluster)

ggplot(gathered_oes, aes(x = year, y = mean_salary, color = factor(cluster))) +
  geom_line(aes(group = occupation))


tot_withinss <- map_dbl(1:10,  function(k){
  model <- kmeans(x = oes, centers = k)
  model$tot.withinss
})


elbow_df <- data.frame(
  k = 1:10,
  tot_withinss = tot_withinss
)


ggplot(elbow_df, aes(x = k, y = tot_withinss)) +
  geom_line() +
  scale_x_continuous(breaks = 1:10)


sil_width <- map_dbl(2:10,  function(k){
  model <- pam(oes, k = k)
  model$silinfo$avg.width
})


sil_df <- data.frame(
  k = 2:10,
  sil_width = sil_width
)


ggplot(sil_df, aes(x = k, y = sil_width)) +
  geom_line() +
  scale_x_continuous(breaks = 2:10)



# Report
source(file = "report.R")
generate_report(
  filename="kmeans",
  title = "K-means cluster analysis for Occupation Employee Statistics",
  observations = df_oes$occupation,
  cluster=as.integer(oes_model$cluster),
  cluster_names = c("First", "Second")
)





















