#exam 1 code
library(openxlsx)
dat27.ate <- read.xlsx("./Exams/FA13 Exam1 Qx27 & 33-35.xlsx", rows=4:9, cols=c(1,3,4))
dat27.ate$ate <- "ate"
dat27.not <- read.xlsx("./Exams/FA13 Exam1 Qx27 & 33-35.xlsx", rows=4:9, cols=c(1,7,8))
dat27.not$ate <- "no"

dat27 <- rbind(dat27.ate, dat27.not)
dat27$total <- dat27$Ill + dat27$Not.Ill
dat27$inc <- dat27$Ill/dat27$total
dat27w <-merge(dat27[which(dat27$ate=="ate"),], dat27[which(dat27$ate=="no"),], by="Food.Item")
dat27w$rr <- dat27w$inc.x/dat27w$inc.y


dat33 <- data.frame(sick=c(85,105,64,45), notsick = c(400, 300, 200, 300), ate= rep(c("ate","no"), each=2))
dat33$total <- dat33$sick + dat33$notsick
dat33$ar <- dat33$sick/dat33$total
dat33$food <-rep(c("c","p"),2)
dat33w <-merge(dat33[which(dat33$ate=="ate"),], dat33[which(dat33$ate=="no"),], by="food")
dat33w$rr <- dat33w$ar.x/dat33w$ar.y
