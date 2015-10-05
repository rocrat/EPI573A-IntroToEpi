library(ggplot2)
#Seer plot
df <- read.csv("HomeWork/SEERdata.csv")
df <- df[-c(1,3),]
names(df)[1] <- "Age"
df$All.races <- as.numeric(as.character(df$All.races))

 ggplot(df, aes(x=Age, y=All.races)) + geom_point() + geom_line()
 