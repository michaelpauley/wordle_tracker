library(shiny)

fluidPage(
  strong("This app is meant to test AWS"),hr(),
  selectInput(inputId = "select",label = "Did this page load for you", choices = c("Yes","No")),hr(),
  textOutput("text")
  
  
  
)
