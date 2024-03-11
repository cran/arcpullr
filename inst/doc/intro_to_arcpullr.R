## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)
library(arcpullr)

## -----------------------------------------------------------------------------
wdnr_base_url <- "https://dnrmaps.wi.gov/arcgis/rest/services"
streams_layer_url <- "WT_SWDV/WT_Inland_Water_Resources_WTM_Ext_v2/MapServer/2"
streams_url <- paste(wdnr_base_url, streams_layer_url, sep = "/")

# the mke_county polygon is available as an exported object in arcpullr
open_water_layer_url <- "WT_SWDV/WT_Inland_Water_Resources_WTM_Ext_v2/MapServer/3"
hydro_url <- paste(wdnr_base_url, open_water_layer_url, sep = "/")

wis_county_layer_url <- "https://datcpgis.wi.gov/arcgis/rest/services/Base/PolygonsExternal/MapServer/0"

## ---- eval = FALSE------------------------------------------------------------
#  # url <- some url from an ArcGIS REST API layer
#  layer <- get_spatial_layer(url)

## ---- eval = FALSE------------------------------------------------------------
#  mke_waters <- get_layer_by_poly(url = streams_url, mke_county)

## ---- eval = FALSE------------------------------------------------------------
#  wi_river <- get_spatial_layer(hydro_url, where = "WATERBODY_ROW_NAME = 'Wisconsin River'")

## ----pull_county_layer, warning = FALSE, echo = FALSE, eval = FALSE-----------
#  wis_counties <- get_spatial_layer(url = wis_county_url)

## ----show_layer_plotting, ref.block=c("pull_county_layer", "plot_county_layer"), eval = FALSE----
#  NA

## ----plot_county_layer, fig.height = 7, fig.width = 7, echo = FALSE-----------
plot_layer(wis_counties)

