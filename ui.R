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