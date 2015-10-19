#plot for knowledge
df <- read.csv("./Project1/Statistics_Knowledge_Among_Epi_Students.csv", skip=1)
df <- df[, c("ResponseID", "Please.provide.your.sex", "t.test", "ANOVA", "Regression", "Hierarchical.Models")]
names(df) <- c("id", "sex", "t.test", "ANOVA", "Regression", "Hierarchical.Models")

library(reshape2)
dfl <- melt(df, id=c("id", "sex"))
library(ggplot2)
ggplot(dfl, aes(x=variable, y=value)) + geom_boxplot(aes(fill=factor(sex))) + ylab("Reported Level of Understanding") + xlab("Statistical Procedure") + scale_fill_discrete("Sex", labels=c("Male", "Female"))
ggsave("./Project1/UnderstandbySex.png", width=6, height=6)

library(dplyr)
sdf <- summarize(group_by(dfl, variable), pval= t.test(sex))
t1 <- t.test(df[df$sex==1, ]$t.test, df[df$sex==2, ]$t.test)
summary(t1)
