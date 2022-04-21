# 1.0 Library required packages ---- 

library(shiny) 
library(shinyBS)


answers <- read.csv("answers.csv")

# 1.2 Set app theme ----
app_theme <- bslib::bs_theme(
  version = 4,
  bootswatch = "cerulean",
  primary = "#1589C9",
  secondary = "#F8C02C"
)
