library(shiny)
library(AgroR)

source("rand/ui.R")
source("rand/server.R")

shinyApp(ui = ui, server = server)
