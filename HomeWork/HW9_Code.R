#HW 9 code
(175*60)/(25*40) 
library(epiR)
inc.control = 40/(175+40)
for(i in 1:25){
  print(i)
  print(((60-i)*(175-i))/((25+i)*(40+i)))
}

epi.studysize(treat=46/(46+39), control=54/(54+161), n=300, sigma=0.28, method= "case.control", power=NA)
tinc <- (60-21)/(60+25)
cinc <- (40+21)/(40+175)
epi.studysize(treat=tinc, control=cinc, n=300, sigma=0.28, method= "case.control", power=NA)
tinc <- (60-24)/(60+25)
cinc <- (40+24)/(40+175)
epi.studysize(treat=tinc, control=cinc, n=300, sigma=0.28, method= "case.control", power=NA)

RR = (18/218)/(29/180) 
exp(log(0.512) -1.96*sqrt((1/18)+(1/29)))
exp(log(0.512) +1.96*sqrt((1/18)+(1/29)))
(63*4)/(36*7)
(8*44)/(22*16) 
exp(0+1.96*sqrt(1/63+1/36+1/7+1/4))
exp(0+1.96*sqrt(1/8+1/16+1/22+1/44)) 
exp(log(3.49) + 1.96*sqrt(1/5+1/15))
