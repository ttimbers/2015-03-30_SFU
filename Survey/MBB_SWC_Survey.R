## Survey data to assess Software Carpentry workshop focus for my home 
## department, Molecular Biology & Biochemistry

## Q1: I would you be interested in attending a workshop focused on:
library(binom)

## make data frame to hold survey data
language <- c('R', 'Python', 'Matlab')
proportion <- c(0.871, 0.7419, 0.3226)
N <- c(31, 31, 31)
CI <- binom.confint(proportion*N, N, conf.level = 0.95, methods = "exact")
df.q1 <- data.frame(language, proportion, N, CI)

## plot results & save
library(gplots)
pdf("Q1.pdf",width=3.75,height=4)
barplot2(df.q1$proportion, ylim=c(0,1), names.arg = df.q1$language, 
         plot.ci = TRUE, ci.l=df.q1$lower, ci.u=df.q1$upper, ci.width=0.25, 
         ci.lwd=1, xlab="Language", ylab="Proportion", col='lightblue4')
title("I would you be interested in \nattending a workshop focused on:")
dev.off()


## Q2: I would be interested in a workshop teaching a computer programming 
## language aimed at:

## make data frame to hold survey data
level <- c('novices', 'intermediates')
proportion <- c(0.7333, 0.2667)
N <- c(31, 31)
CI <- binom.confint(proportion*N, N, conf.level = 0.95, methods = "exact")
df.q2 <- data.frame(level, proportion, N, CI)

## plot results & save
pdf("Q2.pdf",width=4.5,height=4)
barplot2(df.q2$proportion, ylim=c(0,1), names.arg = df.q2$level, 
		plot.ci = TRUE, ci.l=df.q2$lower, ci.u=df.q2$upper, 
		ci.width=0.25, ci.lwd=1, xlab="Level", ylab="Proportion", 
		col='lightblue4')
title("I would be interested in a workshop teaching a \ncomputer programming language aimed at:")
dev.off()


##Q3: I would be interested in learning how to use:

## make data frame to hold survey data
topic <- c('Unix Shell', 'Programming Language', 'Databases', 'Version Control', 'Spreadsheets more effectively')
proportion <- c(0.5161, 0.9032, 0.5161, 0.5484, 0.5161)
N <- c(31, 31, 31, 31, 31)
CI <- binom.confint(proportion*N, N, conf.level = 0.95, methods = "exact")
df.q3 <- data.frame(topic, proportion, N, CI)

## plot results & save
pdf("Q3.pdf",width=5,height=6)
five.cols = c("grey1", 'lightblue4', "lightcyan3", "grey60", "lightcoral")
barplot2(df.q3$proportion, ylim=c(0,1), plot.ci = TRUE, ci.l=df.q3$lower, 
		ci.u=df.q3$upper, ci.width=0.25, ci.lwd=1, ylab="Proportion", col=five.cols)
title("I would be interested in learning how to use:")
legend("topright", legend=df.q3$topic, fill=five.cols, bg="white", cex = 0.75)
dev.off()
