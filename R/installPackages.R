system(paste0("sudo su - -c "R -e \"install.packages(c('RMySQL','dplyr','ggplot2','reshape2','randomForest'), repos = 'http://cran.rstudio.com/')\""))
system("ls")