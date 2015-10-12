library(ggplot2)
#Seer plot
df <- read.csv("HomeWork/SEERdata.csv")
df <- df[-c(1,3),]
names(df)[1] <- "Age"
df$All.races <- gsub(",", "", df$All.races)
df$All.races <- as.numeric(as.character(df$All.races))

 ggplot(df, aes(x=Age, y=All.races, group=1)) + geom_point() + geom_line() + ylab("Incidence of All Cancer Types") + theme(axis.text.x=element_text(angle=90, hjust=1))
 ggsave("./HomeWork/HW5_plot.png", width=5, height=5)
 