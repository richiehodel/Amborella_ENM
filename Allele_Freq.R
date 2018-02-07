# script by Richie Hodel (richiehodel@gmail.com) #


setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs/")

####################################################################
####################################################################
install.packages('stringr')
library('stringr')

#First need to get commands for vcftools to get allele frequencies
#First do chromosomes 1-9

for (counter in 1:9){

chr_num <- counter  
file_name <- paste("chr",chr_num,"_sites_01.txt", sep="")
file_name
chr <- read.table(file=file_name, header=TRUE)

first <- paste("vcftools --vcf out_all12_freebayes_chr",chr_num,
    ".recode.vcf --chr AT_V4_CHR0",chr_num," --recode --out chr", chr_num,
    "_loc",sep="")
second <- "_4000 --from-bp "
third <- " --to-bp "
fourth <- paste("vcftools --vcf chr",chr_num,"_loc")
fifth <- paste("_4000.recode.vcf --012 --out chr",chr_num,"_loc")
sixth <- "_4000"
printer <- NULL
printer2 <- NULL
for (j in 1:nrow(chr))
{
  printer <- paste(first,chr[j,1],second,chr[j,1]-2000,third,chr[j,1]+2000, 
                   sep="")
  printer <- paste(printer,fourth,sep="\n")
  printer <- paste(printer,chr[j,1],fifth,chr[j,1],sixth, sep="")
  printer2[j] <- printer
}

vcf_name <- paste("vcf_commands_chr",chr_num,".txt",sep="")
vcf_name
write.table(printer2, file=vcf_name, quote=FALSE, 
            row.names = FALSE,col.names = FALSE)

}
####################################################################

# Now chromosomes 10-13:

for (counter in 10:13){
  
  chr_num <- counter  
  file_name <- paste("chr",chr_num,"_sites_01.txt", sep="")
  file_name
  chr <- read.table(file=file_name, header=TRUE)
  
  first <- paste("vcftools --vcf out_all12_freebayes_chr",chr_num,
                 ".recode.vcf --chr AT_V4_CHR",chr_num," --recode --out chr", chr_num,
                 "_loc",sep="")
  second <- "_4000 --from-bp "
  third <- " --to-bp "
  fourth <- paste("vcftools --vcf chr",chr_num,"_loc")
  fifth <- paste("_4000.recode.vcf --012 --out chr",chr_num,"_loc")
  sixth <- "_4000"
  printer <- NULL
  printer2 <- NULL
  for (j in 1:nrow(chr))
  {
    printer <- paste(first,chr[j,1],second,chr[j,1]-2000,third,chr[j,1]+2000, 
                     sep="")
    printer <- paste(printer,fourth,sep="\n")
    printer <- paste(printer,chr[j,1],fifth,chr[j,1],sixth, sep="")
    printer2[j] <- printer
  }
  
  vcf_name <- paste("vcf_commands_chr",chr_num,".txt",sep="")
  vcf_name
  write.table(printer2, file=vcf_name, quote=FALSE, 
              row.names = FALSE,col.names = FALSE)
  
}

## Commands for vcftools are now complete.  Run the commands in vcftools
## and move output files to a directory, one for each chromosome
# (e.g., 'chr1' or 'chr8').


##########   generating  ####################################################
##########    freqs      ####################################################

###################################################################
###################################################################
setwd("/Users/richiehodel/Desktop/Amborella_ENM/")

#only once
inds <- read.table("out.012.indv")
# get list of individual names (for use in naming rows, below)
ind_names <- as.vector(inds$V1)
df <- data.frame(ind_names)


####################################################################
####################################################################


setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr1")
sizes1 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr1/"))
min(sizes1)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr1 <- read.table(file="chr1_sites_01.txt", header=TRUE)
chr1_names <- as.character(chr1$SweeD_1.Position)
chr1_names <- paste("chr1_loc",chr1_names,sep="")
colnames(chr1) <- c("Position","Likelihood")

chr_all <- chr1
colnames(chr_all) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr2")
sizes2 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr2/"))
min(sizes2)
# no sites_01 for chr2
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr2 <- read.table(file="chr2_sites_01.txt", header=T)
chr2_names <- as.character(chr2$SweeD_3.Position)
chr2_names <- paste("chr2_loc",chr2_names,sep="")
colnames(chr2) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr3")
sizes3 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr3/"))
min(sizes3)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr3 <- read.table(file="chr3_sites_01.txt", header=T)
chr3_names <- as.character(chr3$SweeD_3.Position)
chr3_names <- paste("chr3_loc",chr3_names,sep="")
colnames(chr3) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr4")
sizes4 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr4/"))
min(sizes4)
# no sites_01 for chr4
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr4 <- read.table(file="chr4_sites_01.txt", header=T)
chr4_names <- as.character(chr4$SweeD_4.Position)
chr4_names <- paste("chr4_loc",chr4_names,sep="")
colnames(chr4) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr5")
sizes5 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr5/"))
min(sizes5)
# no sites_01 for chr5
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr5 <- read.table(file="chr5_sites_01.txt", header=T)
chr5_names <- as.character(chr5$SweeD_5.Position)
chr5_names <- paste("chr5_loc",chr5_names,sep="")
colnames(chr5) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr6")
sizes6 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr6/"))
min(sizes6)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr6 <- read.table(file="chr6_sites_01.txt", header=T)
chr6_names <- as.character(chr6$SweeD_6.Position)
chr6_names <- paste("chr6_loc",chr6_names,sep="")
colnames(chr6) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr7")
sizes7 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr7/"))
min(sizes7)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr7 <- read.table(file="chr7_sites_01.txt", header=T)
chr7_names <- as.character(chr7$SweeD_7.Position)
chr7_names <- paste("chr7_loc",chr7_names,sep="")
colnames(chr7) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr8")
sizes8 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr8/"))
sizes8
min(sizes8) 
# some files have no data
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr8 <- read.table(file="chr8_sites_01.txt", header=T)
chr8_names <- as.character(chr8$SweeD_8.Position)
chr8_names <- paste("chr8_loc",chr8_names,sep="")
colnames(chr8) <- c("Position","Likelihood")

# need to remove these loci with no data from dataset


files8 <- list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr8/")
nozeros8 <- data.frame(files8,sizes8)
nozeros8 <- subset(nozeros8, nozeros8$sizes8!=0)
var1 <- str_split_fixed(nozeros8$files8, "loc", 2)
var1 <- data.frame(var1)
var2 <- str_split_fixed(var1$X2, "_",2)
var2 <- data.frame(var2)
var3 <- str_split_fixed(nozeros8$files8, ".012.",2)
var3 <- data.frame(var3)

var8 <- data.frame(var1,var2,var3)
var8 <- subset(var8, var8$X2.2=="pos")

# now need to find intersection--done
# clean up var names

data_present <- var8$X1.1
chr8 <- chr8[chr8$Position %in% data_present, ]
chr8_names <- as.character(chr8$Position)
chr8_names <- paste("chr8_loc",chr8_names,sep="")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr9")
sizes9 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr9/"))
min(sizes9)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr9 <- read.table(file="chr9_sites_01.txt", header=T)
chr9_names <- as.character(chr9$SweeD_9.Position)
chr9_names <- paste("chr9_loc",chr9_names,sep="")
colnames(chr9) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr10")
sizes10 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr10/"))
min(sizes10)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr10 <- read.table(file="chr10_sites_01.txt", header=T)
chr10_names <- as.character(chr10$SweeD_10.Position)
chr10_names <- paste("chr10_loc",chr10_names,sep="")
colnames(chr10) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr11")
sizes11 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr11/"))
min(sizes11)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr11 <- read.table(file="chr11_sites_01.txt", header=T)
chr11_names <- as.character(chr11$SweeD_11.Position)
chr11_names <- paste("chr11_loc",chr11_names,sep="")
colnames(chr11) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr12")
sizes12 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr12/"))
min(sizes12)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr12 <- read.table(file="chr12_sites_01.txt", header=T)
chr12_names <- as.character(chr12$SweeD_12.Position)
chr12_names <- paste("chr12_loc",chr12_names,sep="")
colnames(chr12) <- c("Position","Likelihood")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr13")
sizes13 <- file.size(list.files("/Users/richiehodel/Desktop/Amborella_ENM/chr13/"))
min(sizes13)
setwd("/Users/richiehodel/Desktop/Amborella_ENM/cutoffs")
chr13 <- read.table(file="chr13_sites_01.txt", header=T)
chr13_names <- as.character(chr13$SweeD_13.Position)
chr13_names <- paste("chr13_loc",chr13_names,sep="")
colnames(chr13) <- c("Position","Likelihood")

chr_all <- rbind(chr_all, chr2, chr3, chr4, chr5, chr6, chr7,
                 chr8, chr9, chr10, chr11, chr12, chr13)

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr1/")
freqs <- NULL
m <- nrow(chr1)
for (k in 1:m){
  dummy <- freq_calc(locus=chr1$Position[k],"chr1")
  df <- cbind(df,dummy)
  rm(dummy)
}
setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr3/")
m <- nrow(chr3)
for (k in 1:m){
  dummy <- freq_calc(locus=chr3$Position[k],"chr3")
  df <- cbind(df,dummy)
  rm(dummy)
}
setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr6/")
m <- nrow(chr6)
for (k in 1:m){
  dummy <- freq_calc(locus=chr6$Position[k],"chr6")
  df <- cbind(df,dummy)
  rm(dummy)
}
setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr7/")
m <- nrow(chr7)
for (k in 1:m){
  dummy <- freq_calc(locus=chr7$Position[k],"chr7")
  df <- cbind(df,dummy)
  rm(dummy)
}

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr8/")
m <- nrow(chr8)
for (k in 1:m){
  dummy <- freq_calc(locus=chr8$Position[k],"chr8")
  df <- cbind(df,dummy)
  rm(dummy)
}

setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr9/")
m <- nrow(chr9)
for (k in 1:m){
  dummy <- freq_calc(locus=chr9$Position[k],"chr9")
  df <- cbind(df,dummy)
  rm(dummy)
}
setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr10/")
m <- nrow(chr10)
for (k in 1:m){
  dummy <- freq_calc(locus=chr10$Position[k],"chr10")
  df <- cbind(df,dummy)
  rm(dummy)
}
setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr11/")
m <- nrow(chr11)
for (k in 1:m){
  dummy <- freq_calc(locus=chr11$Position[k],"chr11")
  df <- cbind(df,dummy)
  rm(dummy)
}
setwd("/Users/richiehodel/Desktop/Amborella_ENM/chr13/")
m <- nrow(chr13)
for (k in 1:m){
  dummy <- freq_calc(locus=chr13$Position[k],"chr13")
  df <- cbind(df,dummy)
  rm(dummy)
}
  
  
  
colnames(df) <- c("ind_names",chr1_names, chr3_names, chr6_names,
                  chr7_names, chr8_names, chr9_names, chr10_names,
                  chr11_names, chr13_names)

setwd("/Users/richiehodel/Desktop/Amborella_ENM/")
write.table(df, file="freq_list.txt", quote=FALSE, row.names=FALSE)




###################################################################
###################################################################
#######################
#####  function   #####

freq_calc <- function(locus="", chromo_num="") {
  loci <- read.table(paste(chromo_num,"_loc",locus,"_4000.012.pos", sep=""))
  inds <- read.table(paste(chromo_num,"_loc",locus,"_4000.012.indv", sep=""))
  loci_names <- as.vector(loci$V2)
  alleles <- read.table(paste(chromo_num,"_loc",locus,"_4000.012", sep=""), row.names=ind_names)
  alleles$V1 <- NULL
  colnames(alleles) <- loci_names
  alleles[alleles == -1] <- 0
  i=1
  for (i in 1:length(inds$V1)) {
    freqs[i] <- sum(alleles[i,])/(2*length(alleles))
    freqs[i] <- 1-freqs[i]
  }
  return(freqs)
  
}

#####  end function   #####
###########################

