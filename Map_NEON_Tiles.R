# Load required packages
library(neonUtilities)
library(httr)
library(jsonlite)
library(sf)
library(dplyr)
library(purrr)
library(raster)

setwd("/media/aly/Penobscot/NEON")

file_list<-list.files("./LiDAR_merge_tiles_2019-2022/", pattern = ".shp", recursive = TRUE)

df<-data.frame(file_list = file_list, stringsAsFactors = FALSE)

df$site<-substr(df$file_list, 38, 41)
df$year<-as.numeric(substr(df$file_list, 57, 60))

sites_years <- df %>%
  group_by(site) %>%
  filter(year == max(year)) %>%
  ungroup()

files_to_use<-sites_years$file_list

for (i in 1:length(files_to_use)) {
  shp<-st_read(paste0("./LiDAR_merge_tiles_2019-2022/",files_to_use[i]))
  # Reproject to WGS 84
  shp <- st_transform(shp, crs = 4326)
  st_write(shp, "./LiDAR_Tiles.shp", append = TRUE)
}
