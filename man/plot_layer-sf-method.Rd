% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_layers.R
\name{plot_layer,sf-method}
\alias{plot_layer,sf-method}
\title{Plot an sf object}
\usage{
\S4method{plot_layer}{sf}(
  x,
  outline_poly = NULL,
  outline_size = 1.2,
  outline_color = "gray30",
  plot_pkg = "ggplot",
  ...
)
}
\arguments{
\item{x}{An sf or Raster* object as returned from a
\code{get_*_layer} function}

\item{outline_poly}{Optional. An sf polygon to outline \code{sf_data} for
context}

\item{outline_size}{Numeric argument that controls width of parameter}

\item{outline_color}{A character vector of a valid color}

\item{plot_pkg}{Character. The plotting environment to use. Either "ggplot"
(default) or "base"}

\item{...}{Additional arguments to \code{plot_layer}}
}
\description{
Plot an sf object
}
\examples{
\dontrun{
plot_layer(wis_poly)
}
}
