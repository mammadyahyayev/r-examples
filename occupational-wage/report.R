generate_report <- function(title, observations, cluster, filename="report", cluster_names=c()) {
  file <- paste(filename, ".txt", sep = "")
  file_connection <- file(file)
  
  cat(title, file=file, append = TRUE, sep="\n")
  
  if(!is.vector(observations)) {
    stop("observations parameter's type must be vector")
  }
  
  write_observations(file, observations)
  
  write_new_line(file)
  
  write_cluster_info(file, cluster, cluster_names)
  
  close(file_connection)
}

write_observations <- function(file, observations) {
  cat("The observations are listed below", file=file, append = TRUE, sep="\n")
  for(observation in observations) {
    line <- paste("\t", "==>", observation)
    cat(line, file=file, append = TRUE, sep="\n")
  }
}

write_cluster_info <- function(file, cluster, cluster_names) {
  if(!is.vector(cluster)) {
    stop("cluster parameter's type must be vector")
  }
  
  if(!is.vector(cluster_names) && !is.null(cluster_names)) {
    stop("cluster_names parameter's type must be vector")
  }
  
  cluster <- sort(unique(as.integer(cluster)))
  
  if(!is.null(cluster_names) && length(cluster) != length(cluster_names)) {
    message<-paste("cluster (length=",length(cluster),") and cluster_names (length=", length(cluster_names),") are not compatible!", sep="")
    stop(message)
  }
  
  cat(paste("There are ", length(cluster), " cluster(s) available."), file=file, append = TRUE, sep="\n")
  
  cat("Clusters:", file=file, append = TRUE, sep="\n")
  
  for(i in cluster) {
    if(!is.null(cluster_names)) {
      line <- paste("\t", "==>", cluster_names[i])
    }else {
      line <- paste("\t", "==>", i)
    }
    
    cat(line, file=file, append = TRUE, sep="\n")
  }
}

write_new_line <- function(file) {
  cat("\n", file=file, append = TRUE)
}












