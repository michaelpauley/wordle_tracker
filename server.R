server <- function(input, output, session){
  
  
  observeEvent(input$send,{
  output$text <- renderText({
   
    "Thank you for the info"
     
   })
  })
  
  
}


