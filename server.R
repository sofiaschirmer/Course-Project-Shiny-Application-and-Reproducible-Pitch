
library(ggplot2)
library(gridExtra)

shinyServer(
    function(input, output) {
        
        data <- reactive({iris[iris$Species == input$Species,]})
        
        output$plot1 <- renderPlot({
            
            q1 <- ggplot(data(), aes(Sepal.Length))
            q1 <- q1 + geom_histogram(binwidth = .5, fill="red", color = "black",alpha = .2)
            q1 <- q1 + geom_vline(aes(xintercept = mean(data()$Sepal.Length)), colour="red", size=2, alpha=.6)
            q1 <- q1 + labs(x = "Sepal Length")
            q1 <- q1 + labs(y = "Frequency")
            q1 <- q1 + labs(title = paste("Distribution of  Sepal Length")) + theme_classic()
            q1
            
            q2 <- ggplot(data(), aes(Sepal.Width))
            q2 <- q2 + geom_histogram(binwidth = .5, fill="red", color = "black",alpha = .2)
            q2 <- q2 + geom_vline(aes(xintercept = mean(data()$Sepal.Width)), colour="red", size=2, alpha=.6)
            q2 <- q2 + labs(x = "Sepal Width")
            q2 <- q2 + labs(y = "Frequency")
            q2 <- q2 + labs(title = paste("Distribution of Sepal Width")) + theme_classic()
            q2
            
            q3 <- ggplot(data(), aes(Petal.Length))
            q3 <- q3 + geom_histogram(binwidth = .5, fill="purple", color = "black",alpha = .2)
            q3 <- q3 + geom_vline( aes(xintercept = mean(data()$Petal.Length)), colour="red", size=2, alpha=.6)
            q3 <- q3 + labs(x = "Petal Length")
            q3 <- q3 + labs(y = "Frequency")
            q3 <- q3 + labs(title = paste("Distribution of  Petal Length"))+ theme_classic()
            q3
            
            q4 <- ggplot(data(), aes(Petal.Width))
            q4 <- q4 + geom_histogram(binwidth = .5, fill="purple", color = "black",alpha = .2)
            q4 <- q4 + geom_vline( aes(xintercept = mean(data()$Petal.Width)), colour="red", size=2, alpha=.6)
            q4 <- q4 + labs(x = "Petal Width")
            q4 <- q4 + labs(y = "Frequency")
            q4 <- q4 + labs(title = paste("Distribution of Petal Width"))+ theme_classic()
            q4
            
            
            grid.arrange(q1, q2, q3, q4, nrow=2, ncol=2)
        })
    }
)
