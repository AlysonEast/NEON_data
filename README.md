repository of lightweight NEON data processing on local machine

#AOP Tiles
NEON AOP data is all mosaiced in a consistant formate in 1km tiles within the flight paths. These tiles are helpful to have as a shapefile when working with AOP data, but are not readily avilable. 
## Map_NEON_Tiles.R
- uses a list of downloaded tiles from the NEON data portal this download has to be manual in order to use key word and file extension filtering
	- Name filter: merged_tiles
	- Type: .shp, .shx, .dbf, .prj
	- Years: 2019 - 2022
- Gernerates output LiDAR_Tiles.shp and associated files 
