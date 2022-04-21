server <- function(input, output, session) {
  
  rctv <- reactiveValues()
  
  observeEvent(input$submit, {
    
    
    
    withProgress(min = 0,max = 100,value = 10,message = paste0("Asking: ", input$question), {
      
      Sys.sleep(.6)
      
      incProgress(
        amount = 30,
        message = "Consulting the stars..."
      )
      
      Sys.sleep(.6)
      
      incProgress(
        amount = 30,
        message = "Checking birth charts..."
      )
      
      Sys.sleep(.6)
      
      incProgress(
        amount = 20,
        message = "Reading horoscope..."
      )
      
      
      Sys.sleep(.6)
      
      incProgress(
        amount = 10,
        message = ""
      )
      
      rctv$question <- input$question  
      rctv$answer <- sample(answers$answer,1)
      
      
      
    })
    
    
    
  })
  
  
  output$answer <- renderUI({
    req(rctv$answer)
    wellPanel(
      fluidRow(
        column(12,
               h5("The Magic 8 Ball has answered:")),
        column(12,
               strong(rctv$question)),hr(),
        column(width = 12,
               rctv$answer)
        
      ))
    
    
  })
  
  
}