#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(datasets)
library(plotly)
library(shinyjs)
options(shiny.suppressMissingContextError=TRUE,shiny.sanitize.errors=FALSE,shiny.error=FALSE)
# Removing all datasets that are not dataframes
datalist <- ls("package:datasets")
DLindex <- rep(FALSE,length(datalist))
for(i in 1:length(datalist)){
        if(is.data.frame(eval(parse(text = datalist[i]))) == TRUE){
                DLindex[i] <- TRUE
        }
                
}
datalist <- datalist[DLindex]
options(shiny.suppressMissingContextError=TRUE)
# Define UI for application that draws a the plots
shinyUI(fluidPage(
        # Application title
        titlePanel("Explore dataset in the datasets() function"),
        # Sidebar with a datasets and lables
        sidebarLayout(
                sidebarPanel(h3("Choose a dataset", position = "left"),
                             selectInput("DataS","Datasets", choices =datalist,selected ="airquality"),
                             h3("Select variable to be on x-axis", position = "left"),
                             selectInput("x_label","X Label", choices =NULL),
                             h3("Select variable to be on y-axis", position = "left"),
                             selectInput("y_label","Y Label", choices =NULL)
                ),
    # Show a plot of the chosen x- and y-axis
                mainPanel(

                        plotlyOutput("Plot")
                )
    )
  )
)
