#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
library(ggplotgui) 

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      h1 {
        font-weight: 500;
        color: #48ca3b;
      }
    "))
  ),
  
  headerPanel(
    h1("Birds Survey Visualization", style = "font-weight: 500; color: #4d3a7d;")
  ),
  

  
  sidebarLayout(
    sidebarPanel(
      selectInput("Plot", "Select the Plot type", choices = c("Scatter", "Histogram", "Boxplot", "Stacked Bar"))
    ),
    
    mainPanel(
      DT::dataTableOutput("MyTable"),
      plotOutput("outPlot")
    )
  )
)

server <- function(input, output) {
  
  surveys <- read.csv("C:/R program/surveys_complete.csv")
  
  output$MyTable <- DT::renderDataTable({
    DT::datatable(
      surveys,
      style = "bootstrap",
      options = list(
        pageLength = 10,
        lengthMenu = c(10, 20, 30),
        searching = TRUE,
        ordering = TRUE
      )
    )
  })
  
  output$outPlot <- renderPlot({
    if (input$Plot == "Scatter") {
      ggplot(surveys, aes(x = weight, y = hindfoot_length)) +
        geom_point(stat = "identity", aes(color = species_id))
    }
    else if (input$Plot == "Histogram") {
      ggplot(surveys, aes(x = weight, color = species_id)) +
        geom_histogram(binwidth = 1)
    }
    else if (input$Plot == "Boxplot") {
      ggplot(surveys, aes(x = weight, y = species_id)) +
        geom_boxplot(aes(color = species_id))
    }
    else if (input$Plot == "Stacked Bar") {
      ggplot(surveys, aes(x = species_id, fill = sex)) +
        geom_bar(position = "stack")
    }
  })
}

shinyApp(ui = ui, server = server)
