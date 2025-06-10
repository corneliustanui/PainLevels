# Project:     PSI Schools Outreach Program -- developer capacity demonstration
# Author:      Cornelius Tanui (kiplimocornelius@gmail.com)
# Data source: N/A
# Database:    N/A
# File name:   app.R
# Purpose      Combine app elements 
# Date:        10 June 2025
# Version:     1

# load UI definitions
source("./ui.R")

# load server definitions
source("./server.R")

# combine app elements
shinyApp(ui = ui, server = server)
