server <- function(input, output) {
  output$abbr <- renderText({
    stocks[stocks$symbol == input$selected_stock, ]
  })
  
  
  output$ts.plot <- renderPlot({
    stockplot <- stocks %>%
      filter(stocks$symbol == input$selected_stock
             & stocks$date >= input$selected_date_range[1]
             & stocks$date <= input$selected_date_range[2]) %>%
      autoplot(close) +
      labs(title = input$selected_stock)
    if (input$trendline == TRUE) {
      stockplot <- stockplot + geom_smooth(method = lm)
    }
    stockplot
  })
  
  
  output$min <- renderText({
    min(stocks[stocks$symbol == input$selected_stock
               & stocks$date >= input$selected_date_range[1]
               & stocks$date <= input$selected_date_range[2], ]$close)
  })
  
  
  output$max <- renderText({
    max(stocks[stocks$symbol == input$selected_stock
               & stocks$date >= input$selected_date_range[1]
               & stocks$date <= input$selected_date_range[2], ]$close)
  })
  
  
  output$stock.growth <- renderText({
    stock.sub <- subset(stocks,
                        stocks$symbol == input$selected_stock
                        & stocks$date >= input$selected_date_range[1]
                        & stocks$date <= input$selected_date_range[2])
    
    stock.closes <- stock.sub[stock.sub$date == input$selected_date_range[1]
                              | stock.sub$date == input$selected_date_range[2], ]$close
    
    stock.closes[2] / stock.closes[1]
  })
  
  
  output$industry.growth <- renderText({
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
    
    stock.growth - industry.growth
  })
  
  
  output$industry <- renderText({
    unique(stocks[stocks$symbol == input$selected_stock, ]$gics_sector)
  })
}
