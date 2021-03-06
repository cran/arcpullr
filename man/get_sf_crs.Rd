% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities.R
\name{get_sf_crs}
\alias{get_sf_crs}
\title{Return CRS value of an sf object}
\usage{
get_sf_crs(sf_obj)
}
\arguments{
\item{sf_obj}{An object of class sf}
}
\value{
A numeric value referring to the coordinate reference system
}
\description{
Return CRS value of an sf object
}
\examples{
get_sf_crs(iceland_poly)
}
