## app.R ##
library(shinydashboard)
source("global.R")

ui <- dashboardPage(
  dashboardHeader(title = "Wordle Tracker"),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      column(width = 12,
      infoBox(
        title = "Today's Word:", value = toupper(tail(wordle$Answer,1)), icon = icon("check"),
        color = "green"
      ),
      infoBox(
        title = "Total Wordle Games:", value = nrow(wordle), icon = icon("hashtag"),
        color = "yellow"
      ),
      infoBox(
        title = "Most Common Letters:", value = most_com_lets, icon = icon("arrow-up"),
        color = "green"
      ),
      infoBox(
        title = "Least Common Letters:",
        value = least_com_lets,
        icon = icon("arrow-down"),
        color = "yellow"
      ),
      infoBox(
        title = "Double Letter Words:",
        value = double_letters,
        icon = icon("asterisk"),
        color = "green"
      ),
      infoBox(
        title = "Triple Letter Words:",
        value = triple_letters,
        icon = icon("flag"),
        color = "yellow"
      ))), hr(),
    fluidRow(
    column(width = 12,
    highchartOutput("letter_plot", width = "100%", height = "400px"))
    ),br(),
    fluidRow(
      column(width = 12,
             div(
             downloadButton("download_wordle", label = "Download Wordle Answers", style="float:right")))
    ),
    "Developed by Mike Pauley - michaelrpauley@gmail.com"
  )
  
)

server <- function(input, output) {
  
  output$letter_plot <-  highcharter::renderHighchart({
    plot <- hchart(wordle_tally, "column", hcaes(x = letter, y = count))
    
    
    plot %>% highcharter::hc_add_theme(highcharter::hc_theme_elementary()) %>%
      highcharter::hc_tooltip(pointFormat = "{point.y:.0f}")
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

shinyApp(ui, server)