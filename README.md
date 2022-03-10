# stocks_ts_jlw

Project Features
1) Time Series Graph
  a. The user selected a stock symbol from a drop-down list and a date range
  b. A reactive time series graph will appear for the stock and date range
  c. The user can hover over the graph to see more information about specific dates on the graph
  d. The user can also click and drag the mouse over the graph to zoom in
    1. Double-click to zoom out to the original zoom setting
  e. The user has the option (via check box) to add a trend line for their generated graph
    1. The trend line also displays information when the user hovers over it
    
2) Maximum and Minimum Share Price Display
  a. The same stock symbol and date range specified by the user are to calculate the maximum and minimum share price
  b. The max and min displayed are also reactive, so they change as the user changes their search criteria
  
3) Stock Growth and Relative Growth Display
 a. The same stock symbol and date range specified by the user are used to calculate the stock and industry growth
 b. The selected stock's growth is shown by dividing the share price on the last selected date divided by the share price on the first        selected date, then multiplied by 100
   1. Displays the stock's growth as a percent over the specified date range
 c. Relative Growth shows the selected stocks growth minus its respective industry's growth, the multiplied by 100
   1. Displays the stock's growth relative to its industry competitors.
    a. Example: AAPL relative growth = 150%, Apple's growth is 1.5 times larger than the Information Technology industry's growth

4) Investment Calculator
 a. The same stock symbol and date range specified by the user are used to calculate the simulated investment
 b. The user inputs a number as their "Initial Investment" at the given start date
 c. 