# script by Richie Hodel (richiehodel@gmail.com) #

# This script takes as input environmental layers (e.g., Bioclim layers)
# that are either .bil or .asc format.  It stacks and trims all layers
# to the same spatial extent and tests for correlation between layers.
# The output of this script is enivronmental layers in .asc format and
# two .csv files that indicate which layers are correlated with one another.


#install packages (only do it once)
install.packages("maptools")
install.packages("raster")
install.packages("rgdal")
install.packages("sp")
install.packages("maps")
install.packages("mapproj")
install.packages("dismo")
install.packages("shapefiles")

#load the libraries
library(maptools)
library(raster)
library(rgdal)
library(sp)
library(maps)
library(mapproj)
library(dismo)
library(shapefiles)


#set the working directory
setwd("/Users/richiehodel/Desktop/Amborella_ENM/bioclim_30s/")

bio_1 <- raster("bio1-9_30s_bil/bio_1.bil")
bio_2 <- raster("bio1-9_30s_bil/bio_2.bil")
bio_3 <- raster("bio1-9_30s_bil/bio_3.bil")
bio_4 <- raster("bio1-9_30s_bil/bio_4.bil")
bio_5 <- raster("bio1-9_30s_bil/bio_5.bil")
bio_6 <- raster("bio1-9_30s_bil/bio_6.bil")
bio_7 <- raster("bio1-9_30s_bil/bio_7.bil")
bio_8 <- raster("bio1-9_30s_bil/bio_8.bil")
bio_9 <- raster("bio1-9_30s_bil/bio_9.bil")
bio_10 <- raster("bio10-19_30s_bil/bio_10.bil")
bio_11 <- raster("bio10-19_30s_bil/bio_11.bil")
bio_12 <- raster("bio10-19_30s_bil/bio_12.bil")
bio_13 <- raster("bio10-19_30s_bil/bio_13.bil")
bio_14 <- raster("bio10-19_30s_bil/bio_14.bil")
bio_15 <- raster("bio10-19_30s_bil/bio_15.bil")
bio_16 <- raster("bio10-19_30s_bil/bio_16.bil")
bio_17 <- raster("bio10-19_30s_bil/bio_17.bil")
bio_18 <- raster("bio10-19_30s_bil/bio_18.bil")
bio_19 <- raster("bio10-19_30s_bil/bio_19.bil")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/PresLayers/")
alt <- raster("srtm_1km.asc")

bio_1

# richie--here show the projection info for bio_1

#make sure all layers are projected into the same datum

projection(alt) <- "+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs" 

# trim layers to extent appropriate for New Caledonia
clipper <- extent(162.7, 168.8, -23, -19)
a
alt_clip <- crop(alt, clipper)
clipped_1 <- crop(bio_1, clipper)

extent(alt_clip) <- extent(clipped_1)

clipped_2 <- crop(bio_2, clipper)
clipped_3 <- crop(bio_3, clipper)
clipped_4 <- crop(bio_4, clipper)
clipped_5 <- crop(bio_5, clipper)
clipped_6 <- crop(bio_6, clipper)
clipped_7 <- crop(bio_7, clipper)
clipped_8 <- crop(bio_8, clipper)
clipped_9 <- crop(bio_9, clipper)
clipped_10 <- crop(bio_10, clipper)
clipped_11 <- crop(bio_11, clipper)
clipped_12 <- crop(bio_12, clipper)
clipped_13 <- crop(bio_13, clipper)
clipped_14 <- crop(bio_14, clipper)
clipped_15 <- crop(bio_15, clipper)
clipped_16 <- crop(bio_16, clipper)
clipped_17 <- crop(bio_17, clipper)
clipped_18 <- crop(bio_18, clipper)
clipped_19 <- crop(bio_19, clipper)


writeRaster(alt_clip, "alt.asc", format="ascii")

writeRaster(clipped_1, "bio1.asc", format="ascii")
writeRaster(clipped_2, "bio2.asc", format="ascii")
writeRaster(clipped_3, "bio3.asc", format="ascii")
writeRaster(clipped_4, "bio4.asc", format="ascii")
writeRaster(clipped_5, "bio5.asc", format="ascii")
writeRaster(clipped_6, "bio6.asc", format="ascii")
writeRaster(clipped_7, "bio7.asc", format="ascii")
writeRaster(clipped_8, "bio8.asc", format="ascii")
writeRaster(clipped_9, "bio9.asc", format="ascii")
writeRaster(clipped_10, "bio10.asc", format="ascii")
writeRaster(clipped_11, "bio11.asc", format="ascii")
writeRaster(clipped_12, "bio12.asc", format="ascii")
writeRaster(clipped_13, "bio13.asc", format="ascii")
writeRaster(clipped_14, "bio14.asc", format="ascii")
writeRaster(clipped_15, "bio15.asc", format="ascii")
writeRaster(clipped_16, "bio16.asc", format="ascii")
writeRaster(clipped_17, "bio17.asc", format="ascii")
writeRaster(clipped_18, "bio18.asc", format="ascii")
writeRaster(clipped_19, "bio19.asc", format="ascii")


#####       correlation check for Bioclim variables      #######

stacker <- stack(clipped_1, clipped_2, clipped_3, clipped_4, clipped_5,
               clipped_6, clipped_7, clipped_8, clipped_9, clipped_10,
               clipped_11, clipped_12, clipped_13, clipped_14, clipped_15,
               clipped_16, clipped_17, clipped_18, clipped_19)
corr <- layerStats(stacker, 'pearson', na.rm=TRUE)
c <- corr$`pearson correlation coefficient`
write.csv(c, "correlationBioclim.csv")

# now get other layers

#soil from harmonized world soil database
soil <- raster("hwsd.bil")

soil_clip <- crop(soil, clipper)
writeRaster(soil_clip, "soil.asc", format="ascii")

aspect_u <- raster("GloAspectClU_30as.asc")
aspect_u_clip <- crop(aspect_u, clipper)
writeRaster(aspect_u_clip, "Aspect_u_clip.asc", format="ascii")

aspect_e <- raster("GloAspectClE_30as.asc")
aspect_e_clip <- crop(aspect_e, clipper)
writeRaster(aspect_e_clip, "Aspect_e_clip.asc", format="ascii")

aspect_n <- raster("GloAspectClN_30as.asc")
aspect_n_clip <- crop(aspect_n, clipper)
writeRaster(aspect_n_clip, "Aspect_n_clip.asc", format="ascii")

aspect_s <- raster("GloAspectClS_30as.asc")
aspect_s_clip <- crop(aspect_s, clipper)
writeRaster(aspect_s_clip, "Aspect_s_clip.asc", format="ascii")

aspect_w <- raster("GloAspectClW_30as.asc")
aspect_w_clip <- crop(aspect_w, clipper)
writeRaster(aspect_w_clip, "Aspect_w_clip.asc", format="ascii")

# aspect files will be kept separate for ENM

class_1 <- raster("GloSlopesCl1_30as.asc")
class_2 <- raster("GloSlopesCl1_30as.asc")
class_3 <- raster("GloSlopesCl1_30as.asc")
class_4 <- raster("GloSlopesCl1_30as.asc")
class_5 <- raster("GloSlopesCl1_30as.asc")
class_6 <- raster("GloSlopesCl1_30as.asc")
class_7 <- raster("GloSlopesCl1_30as.asc")
class_8 <- raster("GloSlopesCl1_30as.asc")

class_1_clip <- crop(class_1, clipper)
class_2_clip <- crop(class_2, clipper)
class_3_clip <- crop(class_3, clipper)
class_4_clip <- crop(class_4, clipper)
class_5_clip <- crop(class_5, clipper)
class_6_clip <- crop(class_6, clipper)
class_7_clip <- crop(class_7, clipper)
class_8_clip <- crop(class_8, clipper)

class_all <- 0.25*class_1_clip + 1.25*class_2_clip + 3.5*class_3_clip +
  7.5*class_4_clip + 12.5*class_5_clip + 22.5*class_6_clip + 37.5*class_7_clip + 
  72.5*class_8_clip
class_all <- 10*class_all
writeRaster(class_all, "class_all.asc", format="ascii")


########
# import trimmed individual direction aspect files
########

aspect_w_clip <- raster("Aspect_w_clip.asc")
aspect_e_clip <- raster("Aspect_e_clip.asc")
aspect_n_clip <- raster("Aspect_n_clip.asc")
aspect_s_clip <- raster("Aspect_s_clip.asc")


#correlation check
stacker <- stack(aspect_w_clip, aspect_n_clip, aspect_e_clip, aspect_s_clip)
corr <- layerStats(stacker, 'pearson', na.rm=TRUE)
c <- corr$`pearson correlation coefficient`
write.csv(c, "correlation_aspect.csv")


