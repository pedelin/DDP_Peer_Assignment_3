#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(datasets)
# Define server logic required to plot
shinyServer(function(input, output, session) {
        observe({
                if (input$DataS != "") {
                        # suppress warnings  
                        storeWarn<- getOption("warn")
                        options(warn = -1) 
                        
                        label_choices <- colnames(eval(parse(text = input$DataS )))
                        updateSelectInput(session, "x_label", choices=label_choices)
                        updateSelectInput(session, "y_label", choices=label_choices)
                        output$Plot <- renderPlotly({
                                # PLOT
                                plot_ly(eval(parse(text = input$DataS )),x=~eval(parse(text = input$DataS ))[,input$x_label]
                                        , y=~eval(parse(text = input$DataS ))[,input$y_label],mode = "markers") %>%
                                        layout(title = input$DataS,xaxis = list(title = input$x_label),yaxis = list(title = input$y_label))
                                })
                        #restore warnings, delayed so plot is completed
                        shinyjs::delay(expr =({ 
                                options(warn = storeWarn) 
                        }) ,ms = 100)
                }
                else {
                        output.Plot <- 	
                                
                                plotly_empty()}
                })
})
