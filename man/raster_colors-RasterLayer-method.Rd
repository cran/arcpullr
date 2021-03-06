% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_raster.R
\name{raster_colors,RasterLayer-method}
\alias{raster_colors,RasterLayer-method}
\title{Convert RasterLayer into data.frame of colors that can be used for plotting}
\usage{
\S4method{raster_colors}{RasterLayer}(x)
}
\arguments{
\item{x}{A RasterLayer object}
}
\value{
A data.frame with 3 columns and \code{length(raster_object)} rows
}
\description{
This function is used internally by \code{\link{plot_layer}} to convert a
RasterLayer object to a data.frame of colors for each pixel that can be used
for plotting with ggplot2
}
\examples{
\dontrun{
wi_landcover <- get_map_layer(wi_landcover_url, wis_poly)
wi_landcover_data <- raster_colors(wi_landcover)
}
}
