# script by Richie Hodel (richiehodel@gmail.com) #

# This script takes SweeD output files (run for each of 13 
# Amborella chromosomes) and filters them to output positions 
# above a certain composite likelihood ratio (CLR).
# It also makes plots of CLR valuse for loci along chromosomes
# and produces random samples of neutral loci from the SweeD files.

### need to install these packages for making figures
### only need to do this once
install.packages("ggplot2")

source("https://bioconductor.org/biocLite.R")
biocLite("ggtree")

### need to load these libraries each time you run the script
library("ggplot2")
library("ggtree")

### you'll need to change this to match the directory where
### you put the SweeD output files
setwd("/Users/richiehodel/Desktop/Amborella_ENM/")

options(scipen=999)

### read in all of the reports run in SweeD using 150,000 positions
### per chromosome, evenly spaced

SweeD_1 <- read.table("SweeD_Report.chr1", header=TRUE, skip=2)
SweeD_2 <- read.table("SweeD_Report.chr2", header=TRUE, skip=2)
SweeD_3 <- read.table("SweeD_Report.chr3", header=TRUE, skip=2)
SweeD_4 <- read.table("SweeD_Report.chr4", header=TRUE, skip=2)
SweeD_5 <- read.table("SweeD_Report.chr5", header=TRUE, skip=2)
SweeD_6 <- read.table("SweeD_Report.chr6", header=TRUE, skip=2)
SweeD_7 <- read.table("SweeD_Report.chr7", header=TRUE, skip=2)
SweeD_8 <- read.table("SweeD_Report.chr8", header=TRUE, skip=2)
SweeD_9 <- read.table("SweeD_Report.chr9", header=TRUE, skip=2)
SweeD_10 <- read.table("SweeD_Report.chr10", header=TRUE, skip=2)
SweeD_11 <- read.table("SweeD_Report.chr11", header=TRUE, skip=2)
SweeD_12 <- read.table("SweeD_Report.chr12", header=TRUE, skip=2)
SweeD_13 <- read.table("SweeD_Report.chr13", header=TRUE, skip=2)

### create new data frames that only have the columns of interest

df_1 <- data.frame(SweeD_1$Position, SweeD_1$Likelihood)
df_2 <- data.frame(SweeD_2$Position, SweeD_2$Likelihood)
df_3 <- data.frame(SweeD_3$Position, SweeD_3$Likelihood)
df_4 <- data.frame(SweeD_4$Position, SweeD_4$Likelihood)
df_5 <- data.frame(SweeD_5$Position, SweeD_5$Likelihood)
df_6 <- data.frame(SweeD_6$Position, SweeD_6$Likelihood)
df_7 <- data.frame(SweeD_7$Position, SweeD_7$Likelihood)
df_8 <- data.frame(SweeD_8$Position, SweeD_8$Likelihood)
df_9 <- data.frame(SweeD_9$Position, SweeD_9$Likelihood)
df_10 <- data.frame(SweeD_10$Position, SweeD_10$Likelihood)
df_11 <- data.frame(SweeD_11$Position, SweeD_11$Likelihood)
df_12 <- data.frame(SweeD_12$Position, SweeD_12$Likelihood)
df_13 <- data.frame(SweeD_13$Position, SweeD_13$Likelihood)

### put together all of the chromosomes into one data frame

SweeD_all <- rbind(SweeD_1, SweeD_2, SweeD_3, SweeD_4, SweeD_5, SweeD_6, SweeD_7,
                   SweeD_8, SweeD_9, SweeD_10, SweeD_11, SweeD_12, SweeD_13)

df_all <- data.frame(SweeD_all$Position, SweeD_all$Likelihood)

newdata <- df_all[order(-df_all$SweeD_all.Likelihood),]

newdata$SweeD_all.Likelihood[195]
# 2.921672

newdata$SweeD_all.Likelihood[390]
# 2.018474

newdata$SweeD_all.Likelihood[975]
# 1.393728

newdata$SweeD_all.Likelihood[1950]
# 1.036357

max(df_all$SweeD_all.Likelihood)

### this is the 0.02% cutoff
cutpoint <- 2.018474


setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs/")


### writing files to identify the sites of interest for each chromosome
pos_1 <- subset(df_1, SweeD_1.Likelihood > cutpoint)
write.table(pos_1, file="chr1_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_2 <- subset(df_2, SweeD_2.Likelihood > cutpoint)
write.table(pos_2, file="chr2_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_3 <- subset(df_3, SweeD_3.Likelihood > cutpoint)
write.table(pos_3, file="chr3_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_4 <- subset(df_4, SweeD_4.Likelihood > cutpoint)
write.table(pos_4, file="chr4_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_5 <- subset(df_5, SweeD_5.Likelihood > cutpoint)
write.table(pos_5, file="chr5_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_6 <- subset(df_6, SweeD_6.Likelihood > cutpoint)
write.table(pos_6, file="chr6_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_7 <- subset(df_7, SweeD_7.Likelihood > cutpoint)
write.table(pos_7, file="chr7_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_8 <- subset(df_8, SweeD_8.Likelihood > cutpoint)
write.table(pos_8, file="chr8_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_9 <- subset(df_9, SweeD_9.Likelihood > cutpoint)
write.table(pos_9, file="chr9_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_10 <- subset(df_10, SweeD_10.Likelihood > cutpoint)
write.table(pos_10, file="chr10_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_11 <- subset(df_11, SweeD_11.Likelihood > cutpoint)
write.table(pos_11, file="chr11_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_12 <- subset(df_12, SweeD_12.Likelihood > cutpoint)
write.table(pos_12, file="chr12_sites_02.txt", quote=FALSE, row.names = FALSE)

pos_13 <- subset(df_13, SweeD_13.Likelihood > cutpoint)
write.table(pos_13, file="chr13_sites_02.txt", quote=FALSE, row.names = FALSE)

### this is the 0.01% cutoff
cutpoint <- 2.921672

### writing a file with sites above 0.01% cutoff for every chromosome

pos_1 <- subset(df_1, SweeD_1.Likelihood > cutpoint)
write.table(pos_1, file="chr1_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_2 <- subset(df_2, SweeD_2.Likelihood > cutpoint)
write.table(pos_2, file="chr2_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_3 <- subset(df_3, SweeD_3.Likelihood > cutpoint)
write.table(pos_3, file="chr3_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_4 <- subset(df_4, SweeD_4.Likelihood > cutpoint)
write.table(pos_4, file="chr4_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_5 <- subset(df_5, SweeD_5.Likelihood > cutpoint)
write.table(pos_5, file="chr5_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_6 <- subset(df_6, SweeD_6.Likelihood > cutpoint)
write.table(pos_6, file="chr6_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_7 <- subset(df_7, SweeD_7.Likelihood > cutpoint)
write.table(pos_7, file="chr7_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_8 <- subset(df_8, SweeD_8.Likelihood > cutpoint)
write.table(pos_8, file="chr8_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_9 <- subset(df_9, SweeD_9.Likelihood > cutpoint)
write.table(pos_9, file="chr9_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_10 <- subset(df_10, SweeD_10.Likelihood > cutpoint)
write.table(pos_10, file="chr10_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_11 <- subset(df_11, SweeD_11.Likelihood > cutpoint)
write.table(pos_11, file="chr11_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_12 <- subset(df_12, SweeD_12.Likelihood > cutpoint)
write.table(pos_12, file="chr12_sites_01.txt", quote=FALSE, row.names = FALSE)

pos_13 <- subset(df_13, SweeD_13.Likelihood > cutpoint)
write.table(pos_13, file="chr13_sites_01.txt", quote=FALSE, row.names = FALSE)
##########################################################################
##########################################################################


##########################################################################
##########################################################################
# now get random positions -- used to validate that positiosn considered
# selective sweeps are not just correlated with environmental variables
# by chance

setwd("/Users/richiehodel/Desktop/Amborella_ENM/random_sites/")

rand_1 <- subset(df_1, SweeD_1.Likelihood == 0.000)
rand_1a <- sample(rand_1$SweeD_1.Position, 1000, replace=FALSE)
write.table(rand_1a, file="rand_1_sites.txt", quote=FALSE, row.names = FALSE)

rand_2 <- subset(df_2, SweeD_2.Likelihood == 0.000)
rand_2a <- sample(rand_2$SweeD_2.Position, 1000, replace=FALSE)
write.table(rand_2a, file="rand_2_sites.txt", quote=FALSE, row.names = FALSE)

rand_3 <- subset(df_3, SweeD_3.Likelihood == 0.000)
rand_3a <- sample(rand_3$SweeD_3.Position, 1000, replace=FALSE)
write.table(rand_3a, file="rand_3_sites.txt", quote=FALSE, row.names = FALSE)

rand_4 <- subset(df_4, SweeD_4.Likelihood == 0.000)
rand_4a <- sample(rand_4$SweeD_4.Position, 1000, replace=FALSE)
write.table(rand_4a, file="rand_4_sites.txt", quote=FALSE, row.names = FALSE)

rand_5 <- subset(df_5, SweeD_5.Likelihood == 0.000)
rand_5a <- sample(rand_5$SweeD_5.Position, 1000, replace=FALSE)
write.table(rand_5a, file="rand_5_sites.txt", quote=FALSE, row.names = FALSE)

rand_6 <- subset(df_6, SweeD_6.Likelihood == 0.000)
rand_6a <- sample(rand_6$SweeD_6.Position, 1000, replace=FALSE)
write.table(rand_6a, file="rand_6_sites.txt", quote=FALSE, row.names = FALSE)

rand_7 <- subset(df_7, SweeD_7.Likelihood == 0.000)
rand_7a <- sample(rand_7$SweeD_7.Position, 1000, replace=FALSE)
write.table(rand_7a, file="rand_7_sites.txt", quote=FALSE, row.names = FALSE)

rand_8 <- subset(df_8, SweeD_8.Likelihood == 0.000)
rand_8a <- sample(rand_8$SweeD_8.Position, 1000, replace=FALSE)
write.table(rand_8a, file="rand_8_sites.txt", quote=FALSE, row.names = FALSE)

rand_9 <- subset(df_9, SweeD_9.Likelihood == 0.000)
rand_9a <- sample(rand_9$SweeD_9.Position, 1000, replace=FALSE)
write.table(rand_9a, file="rand_9_sites.txt", quote=FALSE, row.names = FALSE)

rand_10 <- subset(df_10, SweeD_10.Likelihood == 0.000)
rand_10a <- sample(rand_10$SweeD_10.Position, 1000, replace=FALSE)
write.table(rand_10a, file="rand_10_sites.txt", quote=FALSE, row.names = FALSE)

rand_11 <- subset(df_11, SweeD_11.Likelihood == 0.000)
rand_11a <- sample(rand_11$SweeD_11.Position, 1000, replace=FALSE)
write.table(rand_11a, file="rand_11_sites.txt", quote=FALSE, row.names = FALSE)

rand_12 <- subset(df_12, SweeD_12.Likelihood == 0.000)
rand_12a <- sample(rand_12$SweeD_12.Position, 1000, replace=FALSE)
write.table(rand_12a, file="rand_12_sites.txt", quote=FALSE, row.names = FALSE)

rand_13 <- subset(df_13, SweeD_13.Likelihood == 0.000)
rand_13a <- sample(rand_13$SweeD_13.Position, 1000, replace=FALSE)
write.table(rand_13a, file="rand_13_sites.txt", quote=FALSE, row.names = FALSE)

##########################################################################
##########################################################################
##########################################################################

setwd("/Users/richiehodel/Desktop/Amborella_ENM/")

##########################################################################
### plotting chromosome 1

plot = ggplot(data=df_1) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 1") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_1.Position, SweeD_1.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo1.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")


### plotting chromosome 2

plot2 = ggplot(data=df_2) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 2") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_2.Position, SweeD_2.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo2.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")



### plotting chromosome 3

plot3 = ggplot(data=df_3) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 3") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_3.Position, SweeD_3.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo3.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 4

plot4 = ggplot(data=df_4) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 4") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_4.Position, SweeD_4.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo4.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 5

plot5 = ggplot(data=df_5) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 5") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_5.Position, SweeD_5.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo5.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 6

plot6 = ggplot(data=df_6) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 6") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_6.Position, SweeD_6.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo6.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 7

plot = ggplot(data=df_7) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 7") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_7.Position, SweeD_7.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo7.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 8

plot = ggplot(data=df_8) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 8") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_8.Position, SweeD_8.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo8.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 9

plot = ggplot(data=df_9) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 9") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_9.Position, SweeD_9.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo9.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 10

plot = ggplot(data=df_10) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 10") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_10.Position, SweeD_10.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo10.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 11

plot = ggplot(data=df_11) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 11") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_11.Position, SweeD_11.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo11.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 12

plot = ggplot(data=df_12) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 12") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_12.Position, SweeD_12.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo12.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

### plotting chromosome 13

plot = ggplot(data=df_13) +
  xlab("Position") + 
  ylab("Likelihood Ratio") +
  ggtitle("Chromosome 13") + geom_hline(yintercept=cutpoint, linetype="dashed", color = "red") +
  geom_point(aes(SweeD_13.Position, SweeD_13.Likelihood),alpha=0.5, shape=19, size=0.5) +
  theme_bw()
ggsave("SweeD_chromo13.png", width=7, height=3.2, dpi = 300) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  theme(legend.position="top")

