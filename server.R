server <- function(input, output) {

    match_data <- read.csv("Match.csv")

    output$Attend_plot <- renderPlot({
    filtered_data <- if (input$all_years) {
      Match 
    } else {
      Match %>% filter(Year == as.numeric(input$year))
    }
    
    if (input$year %in% c(1942, 1946)) {
      par(mar = c(5, 5, 5, 5))
      plot(0, type = "n", axes = FALSE, xlab = "", ylab = "", main = "No Data Available")
      text(1, 1, "No data available for the selected year", cex = 1.5, col = "red", font = 2)
      return(NULL)
    }
    
    Average_Attendance <- filtered_data %>%
      arrange(desc(Attendance)) %>%
      mutate(Total.Goals = as.numeric(Home.Team.Goals) + as.numeric(Away.Team.Goals)) %>%
      select(Home.Team.Name, Away.Team.Name, Attendance, Total.Goals, City) %>%
      filter(!is.na(Attendance)) %>%
      group_by(Total.Goals) %>%
      summarize(Average_Attendance = mean(Attendance), Count = n())
    
    ggplot(Average_Attendance, aes(x = Total.Goals, y = Average_Attendance, fill = Count)) +
      geom_bar(stat = "identity") +
      scale_fill_gradient(low = "lightblue", high = "darkblue") +
      labs(title = "Average Attendance for Each Number of Goals",
           x = "Total Goals",
           y = "Average Attendance") +
      theme_minimal() +
      scale_x_continuous(breaks = seq(1, 12, 1))
  })
}
