library(ggplot2)
library(dplyr)
library(dendextend)
library(tibble)
library(tidyr)


dist_oes <- dist(oes, method="euclidean")

hierarchical_clust_oes <- hclust(dist_oes, method = "average")

dendogram_oes <- as.dendrogram(hierarchical_clust_oes)

plot(dendogram_oes)

colored_dendogram_oes <- color_branches(dendogram_oes, h=100000)

plot(colored_dendogram_oes)

df_oes <- rownames_to_column(as.data.frame(oes), var = 'occupation')

cut_oes <- cutree(hierarchical_clust_oes, h = 100000)


clust_oes <- mutate(df_oes, cluster = cut_oes)

head(clust_oes %>% select(occupation, cluster))

gathered_oes <- gather(data = clust_oes, 
                       key = year, 
                       value = mean_salary, 
                       -occupation, -cluster)

sort(cut_oes)

ggplot(gathered_oes, aes(x = year, y = mean_salary, color = factor(cluster))) + 
  geom_line(aes(group = occupation))


count(clust_oes, cluster)


# Report
source(file = "report.R")
generate_report(
  filename="hierarchical",
  title = "Hierarchical cluster analysis for Occupation Employee Statistics",
  observations = df_oes$occupation,
  cluster=as.integer(cut_oes),
  cluster_names=c("First", "Second", "Third")
)


