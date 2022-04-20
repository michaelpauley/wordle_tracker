# 1.0 Library required packages ---- 

library(shiny)   
library(dplyr)  
library(lubridate)
#library(shinydashboard)
library(stringr)
library(plotly)
library(rvest)


#read from the html data
wordle <- read_html("https://game8.co/games/Wordle/archives/369779") %>% html_table() 

#isolate the table
wordle <- rbind(wordle[[1]],wordle[[2]]) %>% 
  arrange(desc(-No.))

#fix date column
wordle$Date <- seq(mdy('06-19-2021'),by="days",length.out = nrow(wordle))

#check for mult letters
double_list <- str_split(wordle$Answer,"")


wordle$unique_chars <- NA
for (i in 1:nrow(wordle)){
  wordle$unique_chars[i] <- length(unique(double_list[[i]]))
  
  #count the number of letters  
  wordle_tally <- data.frame(letter = letters,
                             count = NA)
  
  for (i in 1:nrow(wordle_tally)){
    wordle_tally$count[i] <- sum(str_count(wordle$Answer,wordle_tally$letter[i]))
  }
}

double_letters <- sum(wordle$unique_chars == 4)
triple_letters <- sum(wordle$unique_chars == 3)

#check most common letters
com_let <- wordle_tally %>% 
  arrange(count) %>% slice(1,2,3,24,25,26) %>% 
  mutate(letter = toupper(letter))

most_com_lets <- paste0(com_let$letter[4],", ",com_let$letter[5],", ",com_let$letter[6])
least_com_lets <- paste0(com_let$letter[1],", ",com_let$letter[2],", ",com_let$letter[3])
