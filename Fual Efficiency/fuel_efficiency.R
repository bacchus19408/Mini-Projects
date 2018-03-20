library("plyr")
library("ggplot2")
library("reshape2")

vehicles <- read.csv("/dataset/vehicles.csv")

head(vehicles)

labels <- read.table("varlabels.txt", sep = "-", header = FALSE)

mpgByYr <- ddply(vehicles, ~year, summarise, avgMPG = 
                   mean(comb08), avgHghy = mean(highway08), avgCity = 
                   mean(city08))

ggplot(mpgByYr, aes(year, avgMPG)) + geom_point() + 
  geom_smooth() + xlab("Year") + ylab("Average MPG") + 
  ggtitle("All cars")