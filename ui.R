ui <- dashboardPage(
  dashboardHeader(title = "Stock Information"),
  dashboardSidebar(
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
    
    numericInput(
      inputId = "investment",
      label = "Enter Initial Investment:",
      value = 100
    ),
    
    checkboxInput(
      inputId = "trendline",
      label = "Trend Line",
      value = TRUE
    )
  ),
  dashboardBody(
    plotlyOutput("ts.plot"),
    infoBoxOutput("invest.out"),
    infoBoxOutput("max.invest"),
    infoBoxOutput("min"),
    infoBoxOutput("max"),
    infoBoxOutput("stock.growth"),
    infoBoxOutput("industry.growth"),
    infoBoxOutput("industry")
  )
)