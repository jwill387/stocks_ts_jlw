server <- function(input, output) {
  output$abbr <- renderPrint({
    stocks[stocks$symbol == input$selected_stock, ]
  })
  
  output$ts.plot <- renderPlot({
    stocks %>%
      filter(stocks$symbol == input$selected_stock
             & stocks$date >= input$selected_date_range[1]
             & stocks$date <= input$selected_date_range[2]) %>%
      autoplot(close) +
      labs(title = input$selected_stock)
  })
  
  output$min <- renderPrint({
    min(stocks[stocks$symbol == input$selected_stock
               & stocks$date >= input$selected_date_range[1]
               & stocks$date <= input$selected_date_range[2], ]$close)
  })
  
  output$max <- renderPrint({
    max(stocks[stocks$symbol == input$selected_stock
               & stocks$date >= input$selected_date_range[1]
               & stocks$date <= input$selected_date_range[2], ]$close)
  })
}
