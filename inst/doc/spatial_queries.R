## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(arcpullr)
library(sf)

## ---- echo = FALSE------------------------------------------------------------
#<img src='../man/figures/logo.png' width="160" height="180" style="border: none" align="right"/>

## -----------------------------------------------------------------------------

#WDNR Server
server <- "https://dnrmaps.wi.gov/arcgis/rest/services/"
server2 <- "https://dnrmaps.wi.gov/arcgis2/rest/services/"

#River URL
layer <- "TS_AGOL_STAGING_SERVICES/EN_AGOL_STAGING_SurfaceWater_WTM/MapServer/2"
river_url <- paste0(server2,layer)

#Country URL 
layer <- "DW_Map_Dynamic/EN_Basic_Basemap_WTM_Ext_Dynamic_L16/MapServer/3"
county_url <- paste0(server,layer)

#Trout URL 
layer <- "FM_Trout/FM_TROUT_HAB_SITES_WTM_Ext/MapServer/0"
trout_url <- paste0(server,layer)

#Watershed URL
layer <- "WT_SWDV/WT_Inland_Water_Resources_WTM_Ext_v2/MapServer/5"
watershed_url <- paste0(server,layer)

#get layers for queries
brown_county <- wis_counties[wis_counties$county == "brown",]
mke_river <- get_spatial_layer(river_url, 
                               where = "RIVER_SYS_NAME = 'Milwaukee River'")

trout_hab_project<- 
  get_spatial_layer(
    trout_url,
    where = "WATERBODYNAMECOMBINED = 'Little Bois Brule'")

trout_hab_projects<- 
  get_spatial_layer(
    trout_url,
    where = "FISCALYEAR = 2018")


## -----------------------------------------------------------------------------
counties <- get_layer_by_line(url = county_url, geometry = mke_river)

ggplot2::ggplot() + 
  ggplot2::geom_sf(data = counties) +
  ggplot2::geom_sf(data = mke_river,color = "blue")


## -----------------------------------------------------------------------------

trout_streams <-
  get_layer_by_point(url = river_url, geometry = trout_hab_project)

ggplot2::ggplot() +
  ggplot2::geom_sf(data = trout_streams, color = "blue") +
  ggplot2::geom_sf(data = trout_hab_project,color = "red") 



## -----------------------------------------------------------------------------
trout_counties2018 <-
  get_layer_by_multipoint(url = county_url, geometry = trout_hab_projects)

ggplot2::ggplot() +
  ggplot2::geom_sf(data = wis_counties)+
  ggplot2::geom_sf(data = trout_counties2018,
                   fill = "gray75",color = "gray60") +
  ggplot2::geom_sf(data = trout_hab_projects,color = "red") 

## -----------------------------------------------------------------------------
brown_rivers <-get_layer_by_poly(river_url,brown_county)
ggplot2::ggplot()+
  ggplot2::geom_sf(data = brown_county) +
  ggplot2::geom_sf(data = brown_rivers,color = "blue",alpha = 0.25)

## -----------------------------------------------------------------------------
brown_rivers <- get_layer_by_envelope(river_url,brown_county)
ggplot2::ggplot()+
  ggplot2::geom_sf(data = brown_county) +
  ggplot2::geom_sf(data = brown_rivers,color = "blue",alpha = 0.25)


## -----------------------------------------------------------------------------
brown_rivers <- get_layer_by_poly(river_url,
                                  brown_county,
                                  where = "STREAM_ORDER > 3")
ggplot2::ggplot()+
  ggplot2::geom_sf(data = brown_county) +
  ggplot2::geom_sf(data = brown_rivers,color = "blue",alpha = 0.25)

## -----------------------------------------------------------------------------
brown_rivers <-get_layer_by_poly(river_url,brown_county)
ggplot2::ggplot()+
  ggplot2::geom_sf(data = brown_county) +
  ggplot2::geom_sf(data = brown_rivers,color = "blue",alpha = 0.25)


## -----------------------------------------------------------------------------
brown_rivers <-get_layer_by_poly(river_url,brown_county,sp_rel = "esriSpatialRelCrosses")
ggplot2::ggplot()+
  ggplot2::geom_sf(data = brown_county) +
  ggplot2::geom_sf(data = brown_rivers,color = "blue",alpha = 0.25)

## ---- echo = FALSE------------------------------------------------------------
sp_rel_lookup %>%
  DT::datatable()

## ---- echo = FALSE------------------------------------------------------------
sp_rel_valid %>%
  DT::datatable()


## ---- echo = TRUE-------------------------------------------------------------

valid_sp_rel("line","line")


