#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(rAmCharts)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$summary <- renderPrint({
        summary(faithful)
    })
    
    output$distPlot <- renderPlot({
        req(input$choixcol)
        # generate bins based on input$bins from ui.R
        x    <- faithful[, input$choixcol]
        
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        amHist(x, breaks = bins, col = input$col, border = 'white', main = input$titre)
        
    });
    
    output$bp <- renderPlot({
        x <- faithful[, input$choixcol]
        boxplot(x, col = input$col)
    });
    
    output$classes <- renderText(
        paste("Nombre de classes : ",input$bins)
    );
    
    output$colonne <- renderUI({
        radioButtons(inputId = 'choixcol', 
                     label = "Choississez la colonne à afficher : ", 
                     choices = colnames(faithful),
                     selected = colnames(faithful)[1]
        )
    })    
    output$dataset_obs <- renderDataTable(faithful)
    
})
