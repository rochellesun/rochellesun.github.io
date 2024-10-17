# ------------------------------------------------------------------------ #
# Title: Starter script for R
# Author: Rochelle Sun
# Date: October 17, 2024
# ------------------------------------------------------------------------ #

# Clear working environment
rm(list = ls())

# Working directory root
f.path <- "your/file/path/"
in.path <- paste0(f.path, "input/") # a COPY of raw data should live here
out.path <- paste0(f.path, "output/") # where you will output results, tables, figures

# Checks if package is installed, and then loads
load_packages <- function(package_list) {
  for (package in package_list) {
    if (!require(package, character.only = TRUE)) {
      message(paste("Installing package:", package))
      install.packages(package)
      library(package, character.only = TRUE)
    }
  }
}

# Full list of packages
# You can keep updating this and rerunning load_packages without issue
package_list <- c("data.table", "tidyverse", "ggplot2", "haven")
load_packages(package_list)

# Change for raw data file type
raw_data <- read_csv(paste0(in.path, "rawdatafile.csv"))

# Global ggplot theme for consistency :) 
gg_theme <- function(legend.position = "bottom") {
  p <- theme_bw() +
    theme(plot.title = element_text(hjust = 0.5),
          panel.grid = element_line(colour = "grey92"),
          panel.grid.minor.x = element_blank(),
          text = element_text(size = 12),
          strip.text = element_text(face = "bold"),
          strip.background = element_blank(),
          panel.border = element_blank(),
          legend.position = legend.position)}