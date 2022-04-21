### Shiny App Skeleton
### CRITICAL PATH INSTITUTE
### DEVELOPED BY: MICHAEL PAULEY (MPAULEY@C-PATH.ORG)





#source in global file which holds functions/text/and table
source("global.R")

# 1.0 Build UI ----
ui <- fluidPage(

  
  # Initialize navbar page
  shiny::navbarPage(
    title = "MAGIC 8 BALL",
    #theme set on global.R page
    theme = app_theme,
    collapsible = TRUE,

      
      
      
      #create a fluid row for the sidebar/well panel
      shiny::fluidRow(

          
          # Create a well panel

          shiny::wellPanel(
            id = "well_panel_param",
            shiny::h5("MAGIC 8 BALL"),
            height = "600px",
            textAreaInput("question",strong("What is your question?")),
                          bsButton(inputId = "submit",label = "", width = "100%",icon = icon("question"))),hr(),
          
          uiOutput("answer")
          ),
            
            ## 1.1 Inputs used on home page ----
            
          
      
      
      #horizonal row at the end of the page
      shiny::hr()

    
  )
)
#end UI

# Server----

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


shinyApp(ui, server)