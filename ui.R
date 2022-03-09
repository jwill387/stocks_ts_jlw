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
  h3("Minimum Share Price:"),
  h4(textOutput("min")),
  h3("Maximum Share Price:"),
  h4(textOutput("max")),
  h3(print("Stock Growth:")),
  h4(textOutput("stock.growth")),
  h3(print("Stock Growth vs. Industry Growth:")),
  h4(textOutput("industry.growth"))
)