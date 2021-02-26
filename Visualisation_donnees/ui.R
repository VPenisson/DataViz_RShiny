#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(rAmCharts)
library(colourpicker)
library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    navbarPage(
        title = "Les Jeux Olympiques depuis 1980",
        
        tabPanel(title = "Présentation", 
                 
        ),
        
        
        
        
        tabPanel(title = "Statistiques descriptives",
                 fluidRow(
                     column(width = 2,
                            radioButtons("p2_continents", " Zone géographique:",
                                         c("Monde" = "monde",
                                           "Afrique" = "afrique",
                                           "Amérique du Nord" = "amerique_nord",
                                           "Amérique du Sud" = "amerique_sud",
                                           "Asie" = "asie",
                                           "Europe" = "europe",
                                           "Océanie" = "oceanie")),
                            
                            checkboxGroupInput(inputId = "p2_saison", 
                                               label = "Saison : ",
                                               selected = c("ete", "hiver"),
                                               choices = c("Eté" = "ete", "Hiver" = "hiver"),
                                               inline = TRUE)
                     
                            
                    ),
                           
                     
                     column(width = 9,
                            tabsetPanel(
                                tabPanel("Boxplot",plotOutput("bp")),
                                tabPanel("Histogramme",plotOutput("distPlot"),textOutput("classes"))
                            )
                     )
                     
                 )
        ),
        
        tabPanel(title = "Page 3 : Cartographie",
                 fluidRow(
                     column(width = 3,
                            sliderInput("bins",
                                        "Nombre de classes :",
                                        min = 1,
                                        max = 50,
                                        value = 25),
                            
                            colourInput("col", "Select colour", "purple"),
                            
                            textInput(inputId = 'titre', label = "Entrez le titre de l'histogramme : ", value = ""),
                            
                            uiOutput(outputId = "colonne")),
                     column(width = 9,
                            tabsetPanel(
                                tabPanel("Boxplot",plotOutput("bp")),
                                tabPanel("Histogramme",plotOutput("distPlot"),textOutput("classes"))
                            )
                     )
                     
                 )
        ), 
        
        tabPanel(title = "Page 4 : focus sur un territoire",
                  fluidRow(
                      column(width = 3,
                             sliderInput("bins",
                                         "Nombre de classes :",
                                         min = 1,
                                         max = 50,
                                         value = 25),
                             
                             
                             
                             textInput(inputId = 'titre', label = "Entrez le titre de l'histogramme : ", value = ""),
                             
                             uiOutput(outputId = "colonne")),
                      column(width = 9,
                             tabsetPanel(
                                 tabPanel("Boxplot",plotOutput("bp")),
                                 tabPanel("Histogramme",plotOutput("distPlot"),textOutput("classes"))
                             )
                      )
                      
                  )
        )
        
        
    )
    
))
