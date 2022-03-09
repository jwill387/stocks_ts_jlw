server <- function(input, output) {
  output$abbr <- renderPrint({
    input$selected_stock
    
    stocks[stocks$symbol == input$selected_stock, ]
  })
  
  output$ts.plot <- renderPlot({
    stocks %>%
      filter(symbol == input$selected_stock & date >= input$selected_date_range[1] & date <= input$selected_date_range[2]) %>%
      autoplot(volume) +
      labs(title = input$selected_stock)
  })
}
