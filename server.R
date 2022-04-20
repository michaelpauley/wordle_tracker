server <- function(input, output) {
  
  output$letter_plot <- renderPlot({  
    
    plot <- plot(1,2)
    
    
    plot
  })
  
  output$download_wordle <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(wordle, file)
    }
  )
  
  
  
  
}
