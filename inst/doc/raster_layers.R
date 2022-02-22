## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)
library(arcpullr)
library(sf)

## ---- echo = FALSE------------------------------------------------------------
#<img src='../man/figures/logo.png' width="160" height="180" style="border: none" align="right"/>

## -----------------------------------------------------------------------------
# WDNR Server
image_server <- "https://dnrmaps.wi.gov/arcgis_image/rest/services/"

# WI Landcover Type URL
landcover_path <- "DW_Land_Cover/EN_Land_Cover2_Lev2/MapServer"
landcover_url <- paste0(image_server, landcover_path)

# WI Leaf-off Aerial Imagery URL
leaf_off_path <- "DW_Image/EN_Image_Basemap_Leaf_Off/ImageServer"
leaf_off_url <- paste0(image_server, leaf_off_path)

# the wis_poly polygon is available as an exported object in arcpullr

## ---- map_layer, fig.height = 7, fig.width = 7--------------------------------
wi_landcover <- get_map_layer(landcover_url, wis_poly)
plot_layer(wi_landcover)

## ---- image_layer, fig.height = 7, fig.width = 7------------------------------
wi_leaf_off <- get_image_layer(leaf_off_url, wis_poly)
plot_layer(wi_leaf_off)

