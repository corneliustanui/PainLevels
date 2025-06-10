# Project:     PSI Schools Outreach Program -- developer capacity demonstration
# Author:      Cornelius Tanui (kiplimocornelius@gmail.com)
# Data source: N/A
# Database:    N/A
# File name:   ui.R
# Purpose      User Interface (UI) definition 
# Date:        10 June 2025
# Version:     1

## load packages
library(shiny)
library(shinyWidgets)   # colourful inputs
library(bslib)          # modern bootstrap themes
library(sass)           # sass CSS preprocessor 
library(htmltools)      # for HTML emoji in pictogram

# define UI elements
ui <- fluidPage(
  theme = bs_theme(bootswatch = "morph",
                   primary = "#ff6b6b",
                   base_font = font_google("Nunito")),
  
  tags$style(HTML("
      .emoji-box {font-size: 2rem; line-height: 1.1; display: inline-block;
                   margin: 2px; width: 2.2rem; text-align: center;}
      .panel-title {font-weight: 600; font-size: 1.2rem;}
  ")),
  
  titlePanel("🩹 Pain Levels"),
  sidebarLayout(
    sidebarPanel(
      h4("View pateints pain level!"),
      
      # select sample size
      sliderTextInput(
        inputId = "n", 
        label = "Number of patients",
        choices = seq(10, 150, by = 10), 
        selected = 70, 
        grid = TRUE,
        width = "100%"
      ),
      
      # select mean of pain level
      numericInput(inputId = "mean", 
                   label = "Mean pain score", 
                   value = 5, 
                   min = 0, 
                   max = 10,
                   step = 0.1),
      
      # select variability of pain level
      numericInput(inputId = "sd", 
                   label = "Standard deviation", 
                   value = 2, 
                   min = 0.1, 
                   max = 5,
                   step = 0.1),
      
      # select variability of pain level
      numericInput(inputId = "bins", 
                   label = "Number of bins", 
                   value = 10, 
                   min = 5, 
                   max = 20,
                   step = 1),
      
      br(),
      
      # run the selections
      actionButton(inputId = "resimulate", 
                   label = "🔄 Resimulate!", 
                   class = "btn-success")
    ),
    
    mainPanel(
      tabsetPanel(
        
        # display pictogram
        tabPanel(title = "Pictogram",
                 
                 br(),
                 
                 div(class = "panel-title", 
                     "Every square is a patient – hover to see the score"),
                 
                 uiOutput("pictogram")
        ),
        
        # display histogram
        tabPanel(title = "Histogram",
                 
                 br(),

                 div(class = "panel-title",  textOutput("bins")),
                 
                 div(style = "background-color:#D2DCE9;
                              border: 2px solid #FA6D6D;
                              border-radius: 15px;
                              padding: 10px;",
                     
                   plotOutput("hist", height = "400px")
                 )
             )
          )
      )
   )
)

