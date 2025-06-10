# Project:     PSI Schools Outreach Program -- developer capacity demonstration
# Author:      Cornelius Tanui (kiplimocornelius@gmail.com)
# Data source: N/A
# Database:    N/A
# File name:   app.R
# Purpose      Combine app elements 
# Date:        10 June 2025
# Version:     1

## load packages
library(shiny)
library(shinyWidgets)   # colourful inputs
library(bslib)          # modern bootstrap themes
library(sass)           # sass CSS preprocessor 
library(ggplot2)        # histogram
library(tidyverse)      # data wrangling
library(htmltools)      # for HTML emoji in pictogram
library(purrr)          # functional programming tools - map2 etc

# load globals
source("./globals/funcs.R")

# load UI definitions
source("./ui.R")

# load server definitions
source("./server.R")

# combine app elements
shinyApp(ui = ui, server = server)
