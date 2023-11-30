ui <- fluidPage(
  titlePanel("Test"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "year",
        label = "Year of WC",
        min = 1930,
        max = 2014,
        value = 2014,
        step = 4,
        sep = "",
        ticks = FALSE
      ),
      checkboxInput(
        inputId = "all_years",
        label = "All Years",
        value = FALSE
      )
    ), 
    mainPanel(
      plotOutput(outputId = "Attend_plot")
    )
  )
)
