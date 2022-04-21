server <- function(input, output) {
  
  output$letter_plot <- renderPlot({  
    
    wordle2 <- read_html("https://game8.co/games/Wordle/archives/369779") %>% html_table() 
    
    #isolate the table
    wordle2 <- rbind(wordle2[[1]],wordle2[[2]]) %>% 
      arrange(desc(-No.))
    
    wordle_tally2 <- data.frame(letter = letters,
                               count = NA)
    
    for (i in 1:nrow(wordle_tally2)){
      wordle_tally2$count[i] <- sum(str_count(as.character(wordle2$Answer),wordle_tally2$letter[i]))
    }
    
    
   barplot(count ~ letter,data = wordle_tally, col=rgb(0.2,0.4,0.6,0.6))
    
    })
  

  
  
  
  
}
