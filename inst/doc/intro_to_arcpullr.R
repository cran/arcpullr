## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(arcpullr)

## ---- eval = FALSE------------------------------------------------------------
#  # url <- some url from an ArcGIS REST API layer
#  layer <- get_spatial_layer(url)

## ---- eval = FALSE------------------------------------------------------------
#  wdnr_base_url <- "https://dnrmaps.wi.gov/arcgis/rest/services"
#  streams_layer_url <- "WT_Inland_Water_Resources_WTM_Ext_v2/MapServer/2"
#  streams_url <- paste(wdnr_base_url, service_url, streams_layer_url, sep = "/")
#  mke_waters <- get_layer_by_poly(url = streams_url, mke_county)

## ---- eval = FALSE------------------------------------------------------------
#  service_url <- "WT_SWDV"
#  open_water_layer_url <- "WT_Inland_Water_Resources_WTM_Ext_v2/MapServer/3"
#  hydro_url <- paste(wdnr_base_url, service_url, open_water_layer_url, sep = "/")
#  wi_river <- get_spatial_layer(hydro_url,
#    where = "WATERBODY_ROW_NAME = 'Wisconsin River'"
#  )

## -----------------------------------------------------------------------------
sql_where(ROW_WATERBODY_NAME = 'Wisconsin River', HYDROCODE = 7011)

