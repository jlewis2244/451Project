ui <- navbarPage("My Application",
  tabPanel(title = "Attendance Plot",
    fluidPage(
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
          plotOutput("Attend_plot")
        )
      )
    )
  ),
  tabPanel(title = "Stage Plot",
           fluidPage(
             sidebarLayout(
               sidebarPanel(
                 sliderInput(
                   inputId = "attendance_slider",
                   label = "Minimum Attendance: ",
                   min = 0,
                   max = 170000,
                   value = 0
                 )
               ),
               mainPanel(plotOutput("stage_plot"))
             )
           )
  ),
  tabPanel(title = "Cities",
           fluidPage(
             titlePanel("Average Attendance by City"),
             sidebarLayout(
               sidebarPanel(
                 selectInput("city_year", "Select Year", 
                             choices = seq(1930, 2014, 4), 
                             selected = 2014)),
               mainPanel(plotOutput("attendancePlot")
                         )
               )))
)

