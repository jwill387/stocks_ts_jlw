library(fpp3)
library(dplyr)
library(tidyverse)
library(tsibble)
library(shiny)

ui <- fluidPage(
  selectInput(
    inputId = "selected_stock",
    label = "Select Stock:",
    choices = unique(stocks$symbol)
  ),
  
  dateRangeInput(
    inputId = "selected_date_range",
    label = "Select Date Range:",
    min = min(stocks$date),
    max = max(stocks$date),
    start = min(stocks$date),
    end = max(stocks$date)
  ),
  
  plotOutput("ts.plot"),
  print("Minimum Share Price:"),
 verbatimTextOutput("min"),
  print("Maximum Share Price:"),
  verbatimTextOutput("max"),
)

# renderText()
# textOutput()