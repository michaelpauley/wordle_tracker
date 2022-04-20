server <- function(input, output, session){
  
  output$text <- renderText({
    
    if (input$select == "Yes"){
      
      text <- "I am happy it worked!"
    } else {
      
      text <- "Sorry it looks like something went wrong."
    }
    
    text
  })
  
  
}
