####################################################################
###################################################################


freqs <- read.table("/Users/richiehodel/Desktop/Amborella_ENM/freq_list.txt",
                    header=TRUE)

freqs$locality <- freqs$ind_names

both <- merge(ambo_data, freqs)

# slope removed because it was uniformative at the 12 sampling locations
both$slope_var <- NULL

library(plyr)
both <- rename(both, c('alt'='Elevation (m)'))
both <- rename(both, c('bio1'='Annual Mean Temperature (ºC)'))
both <- rename(both, c('bio2'='Mean Diurnal Temperature Range (ºC)'))
both <- rename(both, c('bio3'='Isothermality'))
both <- rename(both, c('bio4'='Temperature Seasonality'))
both <- rename(both, c('bio12'='Annual Precipitation (mm)'))
both <- rename(both, c('bio15'='Precipitation Seasonality'))
both <- rename(both, c('soil_var'='Soil Type'))
both <- rename(both, c('asp_n_var'='North Aspect Slope'))
both <- rename(both, c('asp_e_var'='East Aspect Slope'))
both <- rename(both, c('asp_w_var'='West Aspect Slope'))
both <- rename(both, c('asp_s_var'='South Aspect Slope'))
both <- rename(both, c('biomax'='Habitat Suitability'))

# adjusting values to degrees--raw layers are in ((degrees C)*10)
both$`Annual Mean Temperature` <- both$`Annual Mean Temperature`/10
both$`Mean Diurnal Temperature Range` <- both$`Mean Diurnal Temperature Range`/10
both$`Temperature Seasonality` <- both$`Temperature Seasonality`/10

setwd("/Users/richiehodel/Desktop/Amborella_ENM/correlation_plots/")

for (j in 18:138){
    for (i in 4:16){
      
  modd <- lm(both[,i] ~ both[,j])
  placeholder <- summary(modd)

  sig <- placeholder$coefficients[8]
  r2 <-   placeholder$r.squared
  
  if(sig<0.05){
  write.table(colnames(both)[j],file="correlations_significant.txt",quote=F,append=T,
              col.names = F,row.names = F)
   write.table(colnames(both)[i],file="correlations_significant.txt",quote=F,append=T,
                col.names = F,row.names = F)
  write.table(placeholder$coefficients[8],file="correlations_significant.txt",quote=F,
              append=T,col.names = F,row.names = F)

  r2 <- signif(r2, digits=3)
  sig <- signif(sig, digits=3)
  r2title <- paste("R-squared = ",r2, sep="")
  sigtitle <- paste(", p-value = ",sig, sep="")
  title <- paste(colnames(both[j])," (",r2title,sigtitle,")", sep="")
  
  plot = ggplot(data=both) + xlab("Allele Frequency") + 
    ylab(colnames(both[i])) +
    ggtitle(title) +
    theme_bw() +
    geom_point(aes(both[,j], both[,i]),
               alpha=1, shape=19, size=2) +
    geom_smooth(aes(both[,j], both[,i]),method=lm)
  
  plot + theme(axis.ticks = element_blank())  +
    theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
    theme(legend.position="top") + theme(plot.title = element_text(size = 16, face = "bold")) 
  
  #make var to be file name
  both[i]
  file_handle <- paste(colnames(both[i])," vs ",colnames(both[j]),".pdf",sep="")
 # file_handle
  ggsave(file_handle)
  
  
  }
    }
}
########################################################

