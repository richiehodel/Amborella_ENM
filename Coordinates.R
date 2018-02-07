# script by Richie Hodel (richiehodel@gmail.com) #

library("dismo")
library("raster")

setwd("/Users/richiehodel/Desktop/Amborella_ENM/layers_USE/")

new15 <- read.table("bio15.asc", skip=6)

# these are the coordinates of NCNAA
new15[317,403]

# these are the coordinates of NCPW
new15[234,267]

# these are the coordinates of NCTOB
new15[219,287]

# these are the coordinates of NCTC
new15[242,305]

# these are the coordinates of NCPO
new15[219,303]

# these are the coordinates of NCAOC
new15[264,313]

# these are the coordinates of NCBA
new15[266,342]

# these are the coordinates of NCBO
new15[292,340]

# these are the coordinates of NCMO
new15[305,358]

# these are the coordinates of NCMF
new15[306,364]

# these are the coordinates of NCAM
new15[314,374]

# these are the coordinates of NCDOB
new15[315,381]


new1 <- read.table("bio1.asc", skip=6)
new2 <- read.table("bio2.asc", skip=6)
new3 <- read.table("bio3.asc", skip=6)
new4 <- read.table("bio4.asc", skip=6)
new12 <- read.table("bio12.asc", skip=6)
newalt <- read.table("alt.asc", skip=6)

asp_e <- read.table("Aspect_e_clip.asc", skip=6)
asp_s <- read.table("Aspect_s_clip.asc", skip=6)
asp_n <- read.table("Aspect_n_clip.asc", skip=6)
asp_w <- read.table("Aspect_w_clip.asc", skip=6)

slope <- read.table("slope_class_all.asc", skip=6)
soil <- read.table("soil.asc", skip=6)

setwd("/Users/richiehodel/Desktop/Amborella_ENM/maxent_output/")

newmax <- read.table("Amborella_trichopoda_avg.asc", skip=6)

locality <- c("NCNAA", "NCPW", "NCTOB", "NCTC", "NCPO", "NCAOC", "NCBA",
                "NCBO", "NCMO", "NCMF", "NCAM", "NCDOB")

gis_row <- c(317,234,219,242,219,264,266,292,305,306,314,315)
gis_col <- c(403,267,287,305,303,313,342,340,358,364,374,381)

bio1 <- c(new1[gis_row[1],gis_col[1]],new1[gis_row[2],gis_col[2]],
          new1[gis_row[3],gis_col[3]],new1[gis_row[4],gis_col[4]],
          new1[gis_row[5],gis_col[5]],new1[gis_row[6],gis_col[6]],
          new1[gis_row[7],gis_col[7]],new1[gis_row[8],gis_col[8]],
          new1[gis_row[9],gis_col[9]],new1[gis_row[10],gis_col[10]],
          new1[gis_row[11],gis_col[11]],new1[gis_row[12],gis_col[12]])

bio2 <- c(new2[gis_row[1],gis_col[1]],new2[gis_row[2],gis_col[2]],
          new2[gis_row[3],gis_col[3]],new2[gis_row[4],gis_col[4]],
          new2[gis_row[5],gis_col[5]],new2[gis_row[6],gis_col[6]],
          new2[gis_row[7],gis_col[7]],new2[gis_row[8],gis_col[8]],
          new2[gis_row[9],gis_col[9]],new2[gis_row[10],gis_col[10]],
          new2[gis_row[11],gis_col[11]],new2[gis_row[12],gis_col[12]])

bio3 <- c(new3[gis_row[1],gis_col[1]],new3[gis_row[2],gis_col[2]],
          new3[gis_row[3],gis_col[3]],new3[gis_row[4],gis_col[4]],
          new3[gis_row[5],gis_col[5]],new3[gis_row[6],gis_col[6]],
          new3[gis_row[7],gis_col[7]],new3[gis_row[8],gis_col[8]],
          new3[gis_row[9],gis_col[9]],new3[gis_row[10],gis_col[10]],
          new3[gis_row[11],gis_col[11]],new3[gis_row[12],gis_col[12]])

bio4 <- c(new4[gis_row[1],gis_col[1]],new4[gis_row[2],gis_col[2]],
          new4[gis_row[3],gis_col[3]],new4[gis_row[4],gis_col[4]],
          new4[gis_row[5],gis_col[5]],new4[gis_row[6],gis_col[6]],
          new4[gis_row[7],gis_col[7]],new4[gis_row[8],gis_col[8]],
          new4[gis_row[9],gis_col[9]],new4[gis_row[10],gis_col[10]],
          new4[gis_row[11],gis_col[11]],new4[gis_row[12],gis_col[12]])

bio12 <- c(new12[gis_row[1],gis_col[1]],new12[gis_row[2],gis_col[2]],
          new12[gis_row[3],gis_col[3]],new12[gis_row[4],gis_col[4]],
          new12[gis_row[5],gis_col[5]],new12[gis_row[6],gis_col[6]],
          new12[gis_row[7],gis_col[7]],new12[gis_row[8],gis_col[8]],
          new12[gis_row[9],gis_col[9]],new12[gis_row[10],gis_col[10]],
          new12[gis_row[11],gis_col[11]],new12[gis_row[12],gis_col[12]])

bio15 <- c(new15[gis_row[1],gis_col[1]],new15[gis_row[2],gis_col[2]],
          new15[gis_row[3],gis_col[3]],new15[gis_row[4],gis_col[4]],
          new15[gis_row[5],gis_col[5]],new15[gis_row[6],gis_col[6]],
          new15[gis_row[7],gis_col[7]],new15[gis_row[8],gis_col[8]],
          new15[gis_row[9],gis_col[9]],new15[gis_row[10],gis_col[10]],
          new15[gis_row[11],gis_col[11]],new15[gis_row[12],gis_col[12]])

alt <- c(newalt[gis_row[1],gis_col[1]],newalt[gis_row[2],gis_col[2]],
          newalt[gis_row[3],gis_col[3]],newalt[gis_row[4],gis_col[4]],
          newalt[gis_row[5],gis_col[5]],newalt[gis_row[6],gis_col[6]],
          newalt[gis_row[7],gis_col[7]],newalt[gis_row[8],gis_col[8]],
          newalt[gis_row[9],gis_col[9]],newalt[gis_row[10],gis_col[10]],
          newalt[gis_row[11],gis_col[11]],newalt[gis_row[12],gis_col[12]])

slope_var <- c(slope[gis_row[1],gis_col[1]],slope[gis_row[2],gis_col[2]],
          slope[gis_row[3],gis_col[3]],slope[gis_row[4],gis_col[4]],
          slope[gis_row[5],gis_col[5]],slope[gis_row[6],gis_col[6]],
          slope[gis_row[7],gis_col[7]],slope[gis_row[8],gis_col[8]],
          slope[gis_row[9],gis_col[9]],slope[gis_row[10],gis_col[10]],
          slope[gis_row[11],gis_col[11]],slope[gis_row[12],gis_col[12]])

soil_var <- c(soil[gis_row[1],gis_col[1]],soil[gis_row[2],gis_col[2]],
          soil[gis_row[3],gis_col[3]],soil[gis_row[4],gis_col[4]],
          soil[gis_row[5],gis_col[5]],soil[gis_row[6],gis_col[6]],
          soil[gis_row[7],gis_col[7]],soil[gis_row[8],gis_col[8]],
          soil[gis_row[9],gis_col[9]],soil[gis_row[10],gis_col[10]],
          soil[gis_row[11],gis_col[11]],soil[gis_row[12],gis_col[12]])

asp_e_var <- c(asp_e[gis_row[1],gis_col[1]],asp_e[gis_row[2],gis_col[2]],
          asp_e[gis_row[3],gis_col[3]],asp_e[gis_row[4],gis_col[4]],
          asp_e[gis_row[5],gis_col[5]],asp_e[gis_row[6],gis_col[6]],
          asp_e[gis_row[7],gis_col[7]],asp_e[gis_row[8],gis_col[8]],
          asp_e[gis_row[9],gis_col[9]],asp_e[gis_row[10],gis_col[10]],
          asp_e[gis_row[11],gis_col[11]],asp_e[gis_row[12],gis_col[12]])

asp_w_var <- c(asp_w[gis_row[1],gis_col[1]],asp_w[gis_row[2],gis_col[2]],
               asp_w[gis_row[3],gis_col[3]],asp_w[gis_row[4],gis_col[4]],
               asp_w[gis_row[5],gis_col[5]],asp_w[gis_row[6],gis_col[6]],
               asp_w[gis_row[7],gis_col[7]],asp_w[gis_row[8],gis_col[8]],
               asp_w[gis_row[9],gis_col[9]],asp_w[gis_row[10],gis_col[10]],
               asp_w[gis_row[11],gis_col[11]],asp_w[gis_row[12],gis_col[12]])

asp_n_var <- c(asp_n[gis_row[1],gis_col[1]],asp_n[gis_row[2],gis_col[2]],
               asp_n[gis_row[3],gis_col[3]],asp_n[gis_row[4],gis_col[4]],
               asp_n[gis_row[5],gis_col[5]],asp_n[gis_row[6],gis_col[6]],
               asp_n[gis_row[7],gis_col[7]],asp_n[gis_row[8],gis_col[8]],
               asp_n[gis_row[9],gis_col[9]],asp_n[gis_row[10],gis_col[10]],
               asp_n[gis_row[11],gis_col[11]],asp_n[gis_row[12],gis_col[12]])

asp_s_var <- c(asp_s[gis_row[1],gis_col[1]],asp_s[gis_row[2],gis_col[2]],
               asp_s[gis_row[3],gis_col[3]],asp_s[gis_row[4],gis_col[4]],
               asp_s[gis_row[5],gis_col[5]],asp_s[gis_row[6],gis_col[6]],
               asp_s[gis_row[7],gis_col[7]],asp_s[gis_row[8],gis_col[8]],
               asp_s[gis_row[9],gis_col[9]],asp_s[gis_row[10],gis_col[10]],
               asp_s[gis_row[11],gis_col[11]],asp_s[gis_row[12],gis_col[12]])


biomax <- c(newmax[gis_row[1],gis_col[1]],newmax[gis_row[2],gis_col[2]],
          newmax[gis_row[3],gis_col[3]],newmax[gis_row[4],gis_col[4]],
          newmax[gis_row[5],gis_col[5]],newmax[gis_row[6],gis_col[6]],
          newmax[gis_row[7],gis_col[7]],newmax[gis_row[8],gis_col[8]],
          newmax[gis_row[9],gis_col[9]],newmax[gis_row[10],gis_col[10]],
          newmax[gis_row[11],gis_col[11]],newmax[gis_row[12],gis_col[12]])


ambo_data <- data.frame(locality, gis_row, gis_col, alt, bio1, bio2, bio3, 
                        bio4, bio12, bio15, slope_var, soil_var, asp_n_var,
                        asp_w_var, asp_s_var, asp_e_var,biomax)

setwd("/Users/richiehodel/Desktop/Amborella_ENM/")

write.table(ambo_data, file="maxent_by_locality.txt", quote=FALSE,
            row.names = FALSE)


