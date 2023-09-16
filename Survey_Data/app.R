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
      selectInput("Plot", "Select the Plot type", choices = c("Scatter", "Histogram", "Boxplot1", "Stacked Bar","Facet Boxplot","Line Chart","Boxplot3"))
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
    else if (input$Plot == "Boxplot1") {
      ggplot(surveys, aes(x = weight, y = species_id)) +
        geom_boxplot(aes(color = species_id))
    }
    else if (input$Plot == "Stacked Bar") {
      ggplot(surveys, aes(x = species_id, fill = sex)) +
        geom_bar(position = "stack")
    }
    else if (input$Plot == "Facet Boxplot"){
    ggplot(surveys,aes(x=species_id, y =weight))+
      geom_boxplot(aes(color = species_id))+
      labs(title = "Distribution of weight w.r.t Species", x="Species",y="Weights")+
      facet_wrap(~species_id)+
      theme_bw()
    }
    else if (input$Plot == "Boxplot3"){
      ggplot(surveys,aes(x=hindfoot_length, y =species_id))+
        geom_boxplot(aes(color = species_id))+
        labs(title = "Distribution of weight w.r.t Species", x="Hindfoot_length",y="Weights")+
        theme_classic()
    }
    else if (input$Plot == "Line Chart"){
      yearly_count<-aggregate(record_id ~ year , data= surveys, FUN=function(x)(length(x)))
      ggplot(yearly_count,aes(x=year,y=record_id))+
        geom_line()+
        labs(title = "Trend analysis year wise", x="Year",y="Record_id")+
        theme_bw()
    }
    
    
  })
}

shinyApp(ui = ui, server = server)
