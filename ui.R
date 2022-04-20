library(shiny)

fluidPage(
  strong("Mike Pauley - Tucson, AZ"),hr(),
  textInput(inputId = "how",label = "How did you find this page?"),
  actionButton(inputId = "send", "Submit"),
  textOutput("text"),hr(),
  a(actionButton(inputId = "email1", label = "Contact Me", 
                 icon = icon("envelope", lib = "font-awesome")),
    href="mailto:michaelrpauley@gmail.com")
  
  
  
)
