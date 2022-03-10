server <- function(input, output) {
  output$ts.plot <- renderPlotly({
    filtered.stocks <- stocks %>%
      filter(stocks$symbol == input$selected_stock
             & stocks$date >= input$selected_date_range[1]
             & stocks$date <= input$selected_date_range[2])
    
    stockplot <- filtered.stocks %>%
      autoplot(close) +
      labs(title = filtered.stocks$security)
    
    if (input$trendline == TRUE) {
      stockplot <- stockplot + geom_smooth(method = lm)
    }
    
    ggplotly(stockplot)
  })
  
  
  output$invest.out <- renderValueBox({
    stock.sub <- subset(stocks,
                        stocks$symbol == input$selected_stock
                        & stocks$date >= input$selected_date_range[1]
                        & stocks$date <= input$selected_date_range[2])
    
    stock.closes <- stock.sub[stock.sub$date == input$selected_date_range[1]
                              | stock.sub$date == input$selected_date_range[2], ]$close
    
    final.investment <- (stock.closes[2] / stock.closes[1]) * input$investment
    
    valueBox(format_dollars(final.investment),
             "Investment Value",
             color = "green",
             icon = icon("dollar-sign"))
  })
  
  
  output$max.invest <- renderValueBox({
    # browser()
    max.per.share <- max(stocks[stocks$symbol == input$selected_stock
                                & stocks$date >= input$selected_date_range[1]
                                & stocks$date <= input$selected_date_range[2], ]$close)
    
    purchase.price <- stocks[stocks$symbol == input$selected_stock
                             & stocks$date == input$selected_date_range[1], ]$close
    
    maximum.investment <- (max.per.share / purchase.price) * input$investment
    
    valueBox(format_dollars(maximum.investment),
             "Maximum Investment Value",
             color = "green",
             icon = icon("dollar-sign"))
  })
  
  
  output$min <- renderValueBox({
    min.value <- min(stocks[stocks$symbol == input$selected_stock
                            & stocks$date >= input$selected_date_range[1]
                            & stocks$date <= input$selected_date_range[2], ]$close)
    
    valueBox(format_dollars(min.value),
             "Minimum Share Price",
             color = "green",
             icon = icon("dollar-sign"))
  })
  
  
  output$max <- renderValueBox({
    max.value <- max(stocks[stocks$symbol == input$selected_stock
                            & stocks$date >= input$selected_date_range[1]
                            & stocks$date <= input$selected_date_range[2], ]$close)
    
    valueBox(format_dollars(max.value),
             "Maximum Share Price",
             color = "green",
             icon = icon("dollar-sign"))
  })
  
  
  output$stock.growth <- renderValueBox({
    stock.sub <- subset(stocks,
                        stocks$symbol == input$selected_stock
                        & stocks$date >= input$selected_date_range[1]
                        & stocks$date <= input$selected_date_range[2])
    
    stock.closes <- stock.sub[stock.sub$date == input$selected_date_range[1]
                              | stock.sub$date == input$selected_date_range[2], ]$close
    
    growth <- stock.closes[2] / stock.closes[1] * 100
    valueBox(format_percent(growth),
             "Stock Growth",
             icon = icon("percent"))
  })
  
  
  output$industry.growth <- renderValueBox({
    stock.sub <- subset(stocks,
                        stocks$symbol == input$selected_stock)
    
    industry.sub <- subset(stocks,
                           stocks$gics_sector == stock.sub$gics_sector[1]
                           & stocks$symbol != input$selected_stock
                           & stocks$date >= input$selected_date_range[1]
                           & stocks$date <= input$selected_date_range[2])
    
    stock.closes <- stock.sub[stock.sub$date == input$selected_date_range[1]
                               | stock.sub$date == input$selected_date_range[2], ]$close
    
    stock.growth <- stock.closes[2] / stock.closes[1] - 1
    
    industry.closes <- industry.sub[industry.sub$date == input$selected_date_range[1]
                                    | industry.sub$date == input$selected_date_range[2], ]$close
    
    industry.growth <- mean(industry.closes[2]) / mean(industry.closes[1]) - 1
    
    relative.growth <- (stock.growth - industry.growth) * 100
    
    valueBox(format_percent(relative.growth),
             "Stock Growth vs. Industry Growth",
             icon = icon("percent"))
  })
  
  
  output$industry <- renderValueBox({
    stock.industry <- unique(stocks[stocks$symbol == input$selected_stock, ]$gics_sector)
    
    valueBox(tags$p(stock.industry, style = "font-size: 70%;"),
             subtitle = tags$p("Industry", style = "font-size: 100%;"),
             color = "purple",
             icon = icon("bars"))
  })
}