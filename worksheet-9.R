## Vector Data

library(sf)

shp <- 'data/cb_2016_us_county_5m'
counties <- st_read(
    shp,
    stringsAsFactors = FALSE)

class(counties$geometry)
head(counties)

sesync <- st_sfc(st_point(
    c(-76.503394, 38.976546)),
    crs = st_crs(counties))

## Bounding box

library(dplyr)
counties_md <- filter(
    counties,
    STATEFP == '24')

plot(counties_md$geometry)

## Grid

grid_md <- st_make_grid(counties_md,
                        n = 4)

View(grid_md)

## Plot Layers


plot(grid_md)
plot(counties_md['ALAND'],
     add = TRUE)
plot(sesync, col = "green",
     pch = 20, add = TRUE)

st_within(sesync, counties_md)

## Coordinate Transforms

shp <- 'data/huc250k'
huc <- st_read(
    shp,
    stringsAsFactors = FALSE)

prj <- '+proj=aea +lat_1=29.5 +lat_2=45.5 \
    +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0    \
    +ellps=GRS80 +towgs84=0,0,0,0,0,0,0   \
    +units=m +no_defs'

prj <- '+proj=aea +lat_1=29.5 +lat_2=45.5 \
    +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0    \
    +ellps=GRS80 +towgs84=0,0,0,0,0,0,0   \
    +units=m +no_defs'

counties_md <- st_transform(
    counties_md,
    crs = prj)
huc <- st_transform(
    huc,
    crs = prj)
sesync <- st_transform(
    sesync,
    crs = prj)

plot(counties_md$geometry)
plot(huc$geometry,
     border = 'blue', add = TRUE)
plot(sesync, col = 'green',
     pch = 20, add = TRUE)
library(sf)

shp <- 'data/cb_2016_us_county_5m'
counties <- st_read(
    shp,
    stringsAsFactors = FALSE)
sesync <- st_sfc(st_point(
    c(-76.503394, 38.976546)),
    crs = st_crs(counties))
library(dplyr)
counties_md <- filter(
    counties,
    STATEFP == '24')
grid_md <- st_make_grid(counties_md,
                        n = 4)
plot(grid_md)
plot(counties_md['ALAND'],
     add = TRUE)
plot(sesync, col = "green",
     pch = 20, add = TRUE)
shp <- 'data/huc250k'
huc <- st_read(
    shp,
    stringsAsFactors = FALSE)
prj <- '+proj=aea +lat_1=29.5 +lat_2=45.5 \
    +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0    \
    +ellps=GRS80 +towgs84=0,0,0,0,0,0,0   \
    +units=m +no_defs'
plot(counties_md$geometry)
plot(huc$geometry,
     border = 'blue', add = TRUE)
plot(sesync, col = 'green',
     pch = 20, add = TRUE)

## Geometric Operations

state_md <- st_union(counties_md)
plot(state_md)

huc_md <- st_intersection(
    huc,
    state_md)

plot(state_md)
plot(huc_md, border = 'blue',
     col = NA, add = TRUE)
## Raster Data

library(raster)
nlcd <- raster("data/nlcd_agg.grd")
library(raster)
nlcd <- raster("data/nlcd_agg.grd")

## Crop

extent <- matrix(st_bbox(huc_md), nrow=2)
nlcd <- crop(nlcd, extent)
plot(nlcd)
plot(huc_md, col = NA, add = TRUE)

nlcd_attr <- nlcd@data@attributes 
lc_types <- nlcd_attr[[1]]$Land.Cover.Class

## Raster data attributes

nlcd_attr <- nlcd@data@attributes 
lc_types <- nlcd_attr[[1]]$Land.Cover.Class

## Raster math

pasture <- mask(nlcd, nlcd == 81,
    maskvalue = FALSE)
plot(pasture)

pasture <- mask(nlcd, nlcd == 81,
                maskvalue = FALSE)
plot(pasture)

nlcd_agg <- aggregate(nlcd,
                      fact = 25, fun = modal)
nlcd_agg@legend <- nlcd@legend
plot(nlcd_agg)

## Mixing rasters and vectors: prelude

sesync_sp <- as(sesync, "Spatial")
huc_md_sp <- as(huc_md, "Spatial")
counties_md_sp <- as(counties_md, "Spatial")

## Mixing rasters and vectors

plot(nlcd)
plot(sesync_sp, col = 'green',
     pch = 16, cex = 2, add = TRUE)


county_nlcd <- extract(nlcd_agg,
                       counties_md_sp[1,])
modal_lc <- extract(nlcd_agg,
                    huc_md_sp, fun = modal)
huc_md_sp$modal_lc <- lc_types[modal_lc + 1]

## Leaflet

library(leaflet)
leaflet() %>%
    addTiles() %>%
    setView(lng = -77, lat = 39, 
            zoom = 7)

leaflet() %>%
    addTiles() %>%
    ...(
        data = ...) %>%
    setView(lng = -77, lat = 39, 
        zoom = 7)

leaflet() %>%
    addTiles() %>%
    ...(
        "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
        layers = "nexrad-n0r-900913", group = "base_reflect",
        options = WMSTileOptions(format = "image/png", transparent = TRUE),
        attribution = "weather data © 2012 IEM Nexrad") %>%
    setView(lng = -77, lat = 39, 
        zoom = 7)
