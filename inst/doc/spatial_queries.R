## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE
)
library(arcpullr)
library(sf)
sf::sf_use_s2(FALSE)

## ----echo = FALSE-------------------------------------------------------------
#<img src='../man/figures/logo.png' width="160" height="180" style="border: none; float: right"/>

## ----url_setup, eval = FALSE--------------------------------------------------
# 
# #WDNR Server
# server <- "https://dnrmaps.wi.gov/arcgis/rest/services/"
# server2 <- "https://dnrmaps.wi.gov/arcgis2/rest/services/"
# 
# #River URL
# layer <- "TS_AGOL_STAGING_SERVICES/EN_AGOL_STAGING_SurfaceWater_WTM/MapServer/2"
# river_url <- paste0(server2,layer)
# 
# #Country URL
# layer <- "DW_Map_Dynamic/EN_Basic_Basemap_WTM_Ext_Dynamic_L16/MapServer/3"
# county_url <- paste0(server,layer)
# 
# #Trout URL
# layer <- "FM_Trout/FM_TROUT_HAB_SITES_WTM_Ext/MapServer/0"
# trout_url <- paste0(server,layer)
# 
# #Watershed URL
# layer <- "WT_SWDV/WT_Federal_Hydrologic_Units_WTM_Ext/MapServer/0"
# watershed_url <- paste0(server,layer)
# 
# #get layers for queries
# mke_river <- get_spatial_layer(
#   river_url,
#   where = "RIVER_SYS_NAME = 'Milwaukee River'"
# )
# 
# trout_hab_project_pts <- get_spatial_layer(
#   trout_url,
#   where = "WATERBODYNAMECOMBINED = 'Sugar Creek' and FISCALYEAR = 2017"
# )
# 
# trout_hab_project_pt <- trout_hab_project_pts[1, ]
# 
# # get watershed layer for Cook Creek
# cook_creek_ws <- get_spatial_layer(
#   watershed_url,
#   where = "HUC12_NAME = 'Cook Creek'"
# )

## ----pull_by_line, eval = FALSE, echo = FALSE---------------------------------
# mke_river_counties <- get_layer_by_line(url = county_url, geometry = mke_river)

## ----echo = FALSE-------------------------------------------------------------
mke_river_counties <- sf::st_filter(
  wis_counties, 
  mke_river, 
  .pred = sf::st_intersects
)

## ----show_by_line, ref.label=c("pull_by_line", "plot_by_line"), eval = FALSE----
# mke_river_counties <- get_layer_by_line(url = county_url, geometry = mke_river)
# plot_layer(mke_river, outline_poly = mke_river_counties)

## ----plot_by_line, echo = FALSE-----------------------------------------------
plot_layer(mke_river, outline_poly = mke_river_counties)

## ----pull_by_point, eval = FALSE, echo = FALSE--------------------------------
# trout_stream <- get_layer_by_point(url = river_url, geometry = trout_hab_project_pt)

## ----echo = FALSE, mesage = FALSE---------------------------------------------
trout_stream <- sf::st_filter(
  sugar_creek, 
  sf::st_buffer(trout_hab_project_pt, 0.0001), 
  .pred = sf::st_intersects
)

## ----show_by_point, ref.label=c("pull_by_point", "plot_by_point"), eval = FALSE----
# trout_stream <- get_layer_by_point(url = river_url, geometry = trout_hab_project_pt)
# plot_layer(trout_stream) +
#   ggplot2::geom_sf(data = trout_hab_project_pt, color = "red", size = 2)

## ----plot_by_point, echo = FALSE----------------------------------------------
plot_layer(trout_stream) +
  ggplot2::geom_sf(data = trout_hab_project_pt, color = "red", size = 2)

## ----pull_by_multipoint, eval = FALSE, echo = FALSE---------------------------
# restored_streams <- get_layer_by_point(url = river_url, geometry = trout_hab_project_pts)

## ----show_by_multipoint, ref.label=c("pull_by_multipoint", "plot_by_multipoint"), eval = FALSE----
# restored_streams <- get_layer_by_point(url = river_url, geometry = trout_hab_project_pts)
# plot_layer(restored_streams) +
#   ggplot2::geom_sf(data = trout_hab_project_pts, color = "blue")

## ----echo = FALSE-------------------------------------------------------------
restored_streams <- sugar_creek

## ----plot_by_multipoint, fig.height = 7, fig.width = 7, echo = FALSE----------
plot_layer(restored_streams) + 
  ggplot2::geom_sf(data = trout_hab_project_pts, color = "blue")

## ----pull_by_poly, eval = FALSE, echo = FALSE---------------------------------
# cook_creek_streams <- `get_layer_by_poly(river_url, cook_creek_ws)

## ----show_by_poly, ref.label=c("pull_by_poly", "plot_by_poly"), eval = FALSE----
# cook_creek_streams <- `get_layer_by_poly(river_url, cook_creek_ws)
# plot_layer(cook_creek_streams, cook_creek_ws)

## ----plot_by_poly, echo = FALSE-----------------------------------------------
plot_layer(cook_creek_streams, cook_creek_ws)

## ----pull_by_env, eval = FALSE, echo = FALSE----------------------------------
# cook_creek_env <- get_layer_by_envelope(river_url, cook_creek_ws)
# 

## ----show_by_env, ref.label=c("pull_by_env", "plot_by_env"), eval = FALSE-----
# cook_creek_env <- get_layer_by_envelope(river_url, cook_creek_ws)
# 
# # example of the envelope to visualize how it spatially queries
# example_env <- sf::st_as_sfc(sf::st_bbox(cook_creek_ws))
# 
# plot_layer(cook_creek_env, cook_creek_ws) +
#   ggplot2::geom_sf(data = example_env, fill = NA)

## ----plot_by_env, echo = FALSE------------------------------------------------
# example of the envelope to visualize how it spatially queries
example_env <- sf::st_as_sfc(sf::st_bbox(cook_creek_ws))

plot_layer(cook_creek_env, cook_creek_ws) + 
  ggplot2::geom_sf(data = example_env, fill = NA)

## ----pull_sp_rel_contains, eval = FALSE, echo = FALSE-------------------------
# example_poly <- sf_polygon(
#   c(-90.62, 43.76),
#   c(-90.62, 43.77),
#   c(-90.61, 43.77),
#   c(-90.61, 43.76),
#   c(-90.62, 43.76)
# )
# poly_streams_contains <- get_layer_by_poly(river_url, example_poly)

## ----show_sp_rel_contains, ref.label=c("pull_sp_rel_contains", "plot_sp_rel_contains"), eval = FALSE----
# example_poly <- sf_polygon(
#   c(-90.62, 43.76),
#   c(-90.62, 43.77),
#   c(-90.61, 43.77),
#   c(-90.61, 43.76),
#   c(-90.62, 43.76)
# )
# poly_streams_contains <- get_layer_by_poly(river_url, example_poly)
# plot_layer(poly_streams_contains, outline_poly = example_poly)

## ----plot_sp_rel_contains, echo = FALSE---------------------------------------
plot_layer(poly_streams_contains, outline_poly = example_poly)

## ----pull_sp_rel_crosses, eval = FALSE, echo = FALSE--------------------------
# poly_streams_crosses <- get_layer_by_poly(river_url, example_poly, sp_rel = "crosses")

## ----show_sp_rel_crosses, ref.label=c("pull_sp_rel_crosses", "plot_sp_rel_crosses"), eval = FALSE----
# poly_streams_crosses <- get_layer_by_poly(river_url, example_poly, sp_rel = "crosses")
# plot_layer(poly_streams_crosses, outline_poly = example_poly)

## ----plot_sp_rel_crosses, echo = FALSE----------------------------------------
plot_layer(poly_streams_crosses, outline_poly = example_poly)

## ----echo = FALSE-------------------------------------------------------------
sp_rel_lookup %>%
  DT::datatable()

## ----echo = FALSE-------------------------------------------------------------
sp_rel_valid %>%
  DT::datatable()


## ----echo = TRUE--------------------------------------------------------------

valid_sp_rel("line","line")


