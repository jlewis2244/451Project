library(tidyverse)
Match <- read.csv('Match.csv')
WC <- read.csv('WC.csv')

server <- function(input, output) {
    output$Attend_plot <- renderPlot({
      
      filtered_data <- if (input$all_years) {
        Match 
        } else {
          Match %>% filter(Year == (input$year))
        }
      
      
      if (as.numeric(input$year) %in% c(1942, 1946)) {
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
    
  output$stage_plot <- renderPlot({
  custom_order <- c("Group Stage", "Round of 32", "Quarter Finals", "Semi-finals", 
                    "Third Place", "Final")
  
  # Read the attendance threshold from the slider input
  min_attendance <- input$attendance_slider
  
  By_stage <- Match %>% 
    mutate(Combined_Stage = case_when(
      Stage %in% c("Group 1", "Group 2", "Group 3", "Group 4", 
                   "Group 5", "Group 6", "Group A", "Group B", 
                   "Group C", "Group D", "Group E", "Group F", 
                   "Group G", "Group H") ~ "Group Stage",
      Stage %in% c("Match for third place", 
                   "Play-off for third place",
                   "Third place") ~ "Third Place",
      Stage %in% c("Quarter-finals", "Round of 16") ~ "Quarter Finals",
      Stage %in% c("First round", "Preliminary round") ~ "Round of 32",
      Stage %in% c("Semi-finals") ~ "Semi-finals",
      Stage %in% c("Final") ~ "Final",
      TRUE ~ "Other"
    )) %>%
    filter(Combined_Stage != "Other") %>%
    filter(Attendance >= min_attendance) %>%  # Filter based on attendance threshold
    group_by(Combined_Stage) %>%
    summarise(Average_Goals = mean(Home.Team.Goals + Away.Team.Goals, na.rm = TRUE))
  
  By_stage$Combined_Stage <- factor(By_stage$Combined_Stage, levels = custom_order)
  
  ggplot(By_stage, aes(x = Combined_Stage, y = Average_Goals)) +
    geom_bar(stat = "identity", size = 1, fill = "skyblue") +
    labs(title = "Average Goals by Stage",
         x = "Stage",
         y = "Average Goals") +
    theme_minimal() + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})
  
  output$attendancePlot <- renderPlot({
    # Filter data based on selected year
    filtered_data <- Match %>%
      filter(!is.na(Year)) %>%
      filter(Year == input$city_year) %>%
      filter(!is.na(Attendance)) %>%
      group_by(City) %>%
      summarise(mean_attendance = mean(Attendance, na.rm = TRUE))
    
    # Create ggplot
    ggplot(filtered_data, aes(x = City, y = mean_attendance, fill = City)) +
      geom_bar(stat = "identity", position = "dodge", color = "black") +
      labs(title = paste("Average Attendance in", input$year),
           x = "City",
           y = "Mean Attendance") +
      theme_minimal() +
      theme(legend.position = "none", axis.text.x = element_text(angle = 45, 
                                                                 hjust = 1,
                                                                 size = 10))
  })
  
}
