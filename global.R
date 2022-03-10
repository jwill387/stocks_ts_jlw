library(fpp3)
library(dplyr)
library(tidyverse)
library(tsibble)
library(readr)
library(shinydashboard)
library(plotly)

# Read data
stocks <- read_csv("nyse_stocks.csv.zip")

#Convert to tsibble()
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)


format_dollars <- function(x) {
  rounded <- sprintf("%.2f", x)
  paste0('$', rounded)
}

format_percent <- function(x) {
  rounded <- sprintf("%.1f", x)
  paste0(rounded, "%")
}