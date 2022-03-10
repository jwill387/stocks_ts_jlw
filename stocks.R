library(fpp3)
library(dplyr)
library(tidyverse)
library(tsibble)

# Read data
stocks <- read.csv("nyse_stocks.csv")

#Convert to tsibble()
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)

# 
# # Plotting 1 stock
# selected_stock <- "AAPL"
# 
# stocks %>%
#   filter(symbol == selected_stock) %>%
#   autoplot(volume) +
#   labs(title = selected_stock)
# 
# # Plotting multiple stocks
# selected_stocks <- c("GOOG", "AAPL")
# 
# stocks %>%
#   filter(symbol %in% selected_stocks) %>%
#   autoplot(volume)
