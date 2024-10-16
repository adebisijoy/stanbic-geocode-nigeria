# Stanbic IBTC Bank Branch Geocoding Project

## Overview
This project aims to geocode the addresses of Stanbic IBTC Bank branches located throughout Nigeria. The primary objectives include:
- **Data Loading**: Reading branch data from a CSV file.
- **Geocoding**: Converting textual addresses into geographical coordinates (latitude and longitude) using the Google Geocoding API.
- **Data Cleaning**: Ensuring only valid geographic data is retained for further analysis.
- **Visualization**: Displaying the geocoded locations on interactive maps, allowing for easy identification and exploration of branch locations.

The project utilizes R and several libraries to facilitate data manipulation, geocoding, and mapping. The final output includes both a simple interactive map and a more customizable leaflet map.

## Installation

### R and RStudio
Ensure that you have R version 4.0 or higher and RStudio installed on your machine. You can download R from [CRAN](https://cran.r-project.org/) and RStudio from [RStudio's website](https://www.rstudio.com/products/rstudio/download/).

### Required R Packages
To run this project, you need to install several R packages. These packages provide essential functions for data manipulation, geocoding, and visualization. Install the required packages by running the following command in your R console:

```r
install.packages(c("tidyverse", "tidygeocoder", "sf", "leaflet", "mapview", "usethis"))
