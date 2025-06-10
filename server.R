# Project:     PSI Schools Outreach Program -- developer capacity demonstration
# Author:      Cornelius Tanui (kiplimocornelius@gmail.com)
# Data source: N/A
# Database:    N/A
# File name:   server.R
# Purpose      Logic definition 
# Date:        10 June 2025
# Version:     1

## load packages
library(ggplot2)        # histogram
library(purrr)          # functional programming tools - map2 etc

# load globals
source("./globals/funcs.R")

# define server side processing
server <- function(input, output, session) {
  
  # Reactive simulation whenever inputs change or resimulate button pressed
  sim_data <- reactive({
    input$resimulate
    isolate({
      scores <- rnorm(input$n, mean = input$mean, sd = input$sd)
      scores[scores < 0] <- 0
      scores[scores > 10] <- 10
      scores
    })
  })
  
  # Create a pictogram
  output$pictogram <- renderUI({
    tryCatch({
      scores   <- sim_data()
      emojis   <- pain_to_emoji(scores)
      colours  <- pain_to_colour(scores)
      
      boxes <- map2(emojis, colours, ~ span(
        class = "emoji-box",
        style = paste0("background:", .y, ";"),
        title = paste("Score =", .x),
        .x
      ))
      
      # display emojis in a flexible grid
      div(style = "display: grid;
      grid-template-columns: repeat(auto-fill, minmax(2.2rem, 1fr));
      gap: 4px;
      max-width: 100%;
      margin-left: auto;
      margin-right: auto;", tagList(boxes))
      
    }, error = function(e) {
      div(style = "color:red;", paste("UI render error:", e$message))
    })
  })
  
  # output number of bins
  output$bins <- renderText({
    paste0("Histogram of pain scores (bins = ", input$bins, ")")
  })

  # Create a histogram
  output$hist <- renderPlot({
    ggplot2::ggplot(data.frame(score = sim_data()), ggplot2::aes(score)) +
      ggplot2::geom_histogram(bins = input$bins, fill = "#FA6D6D", colour = "#FFF") +
      labs(x = "Pain score", y = "Count") +
      theme_minimal(base_family = "Nunito", base_size = 14) +
      scale_x_continuous(breaks = 0:10) +
      theme(panel.grid.minor = element_blank(),
            panel.background = element_rect(fill = "#D2DCE9", color = NA),
            plot.background  = element_rect(fill = "#D2DCE9", color = "#D2DCE9"),
            axis.line = element_line(color = "#7A89B1", linewidth = 1),
            axis.text = element_text(color = "#7A89B1", size = 13),
            axis.title.x = element_text(color = "#7A89B1", size = 13, face = "bold"),
            axis.title.y = element_text(color = "#7A89B1", size = 13, face = "bold")
            )
  })
}
