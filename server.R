server <- function(input, output) {
  
  output$letter_plot <- renderPlotly({  
    
    plot <- ggplot(wordle_tally, aes(x=letter,y=count)) +
      geom_histogram(stat="identity",fill="dodgerblue3")
    
    
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