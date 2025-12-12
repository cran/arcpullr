## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)
library(arcpullr)
library(sf)
wi_landcover <- terra::rast(system.file("wi_landcover.png", package = "arcpullr"))
raster_cols <- terra::coltab(wi_landcover)[[1]]
wi_landcover_legend <- 
  wi_landcover_url |>
  get_layer_legend() |>
  match_legend_colors(raster_cols) |>
  dplyr::arrange(.data$value)
attr(wi_landcover, "legend") <- wi_landcover_legend
wi_aerial_imagery <- terra::rast(system.file("wi_aerial_imagery.png", package = "arcpullr"))

## ----echo = FALSE-------------------------------------------------------------
#<img src='../man/figures/logo.png' width="160" height="180" style="border: none; float: right"/>

## -----------------------------------------------------------------------------
# WDNR Server
image_server <- "https://dnrmaps.wi.gov/arcgis_image/rest/services/"

# WI Landcover Type URL
landcover_path <- "DW_Land_Cover/EN_Land_Cover2_Lev2/MapServer"
landcover_url <- paste0(image_server, landcover_path)

# WI Leaf-off Aerial Imagery URL
wi_leaf_off_path <- "DW_Imagery/EN_Image_Basemap_Latest_Leaf_Off/ImageServer"
wi_aerial_imagery_url <- paste0(image_server, wi_leaf_off_path)

# the wis_poly polygon is available as an exported object in arcpullr

## ----map_layer, eval = FALSE, echo = FALSE------------------------------------
# wi_landcover <- get_map_layer(landcover_url, wis_poly)

## ----show_map_plotting, ref.label=c('map_layer', 'plot_map_layer'), eval = FALSE----
# wi_landcover <- get_map_layer(landcover_url, wis_poly)
# plot_layer(wi_landcover)

## ----plot_map_layer, fig.height = 7, fig.width = 7, echo = FALSE--------------
plot_layer(wi_landcover)

## ----image_layer, eval = FALSE, echo = FALSE----------------------------------
# wi_aerial_imagery <- get_image_layer(wi_aerial_imagery_url, wis_poly)

## ----plot_image_layer, fig.height = 5, fig.width = 5, echo = FALSE------------
plot_layer(wi_aerial_imagery)

