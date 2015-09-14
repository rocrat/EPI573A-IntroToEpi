#HW3 graph
library(openxlsx)
library(car)
library(plyr)
library(ggplot2)
df1 <- read.xlsx("./Homework/HW3_Table1.xlsx", detectDates=T)
df1$time <- as.numeric(gsub("\\d{2}\\/\\d{2}\\/\\d{2}\\s(\\d{2}).+", "\\1", df1$DateTime, perl=T))
df1$Rice <- Recode(df1$Rice, "'x'=TRUE; NA=FALSE")
df1$Meat <- Recode(df1$Meat, "'x'=TRUE; NA=FALSE")
df1$TS <- Recode(df1$TS, "'x'=TRUE; NA=FALSE")
df1$dtime <- strptime(df1$DateTime, format="%m/%d/%y %H:%M:%S")
df1$dis <- ifelse(is.na(df1$Date), FALSE, TRUE)

df2 <- ddply(df1[which(!is.na(df1$DateTime)),], unique(df1$DateTime)[which(!is.na(df1$DateTime))], summarise, total = sum(dis), .drop=TRUE)

df2 <- data.frame(Time=levels(factor(df1$DateTime)), freq=summary(factor(df1[which(!is.na(df1$DateTime)),]$DateTime)))
df2$Time <- strptime(df2$Time, format="%m/%d/%y %H:%M:%S")
ggplot(df2, aes(x=Time, y=freq, group=1)) + geom_point() + geom_line() + theme(axis.text.x=element_text(angle=70, hjust=1)) + ylab("Number of Attacks")
ggsave("./HomeWork/HW3_Plot.png", width=7, height=6)

df2$incTime <- as.numeric(df2$Time - strptime("10/31/15 14:00:00", format="%m/%d/%y %H:%M:%S"))

ggplot(df2, aes(x=incTime, y=freq, group=1)) + geom_point() + geom_line()  + ylab("Number of Attacks") + xlab("Time Since Lunch")
ggsave("./HomeWork/HW3_Plot2.png", width=7, height=6)
summary(df2$incTime)
sd(df2$incTime)

sympFreq <- apply(df1[,10:15], 2, FUN=function(x) sum(!is.na(x)))

xtabs(~ dis + Rice, data=df1)
sum(xtabs(~ dis + Rice, data=df1))

xtabs(~ dis + Meat, data=df1)
sum(xtabs(~ dis + Meat, data=df1)[,2])

xtabs(~ dis + TS, data=df1)
sum(xtabs(~ dis + TS, data=df1)[,2])
