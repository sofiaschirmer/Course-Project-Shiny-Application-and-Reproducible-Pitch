library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
    headerPanel('Distribution of Length and Width of Petal and Sepal based on Species'),
    sidebarPanel(
        selectInput('Species', 'Select Species', as.character(unique(iris$Species)))
    ),
    mainPanel(
        #Setting the multiplot size as 800x600 for better visibility
        plotOutput('plot1',width = 800, height = 600)
    )
))
