server <- function(input, output) {
  
  output$letter_plot <- renderPlot({  
    
   barplot(count ~ letter,data = wordle_tally, col=rgb(0.2,0.4,0.6,0.6))
    
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
