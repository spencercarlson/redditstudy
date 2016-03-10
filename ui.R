library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
        theme = shinytheme("spacelab"),
        # Application title
        titlePanel("Credibility on Reddit"),
        h4("Examining four variations on a system design for computer-supported discourse"),
        tabsetPanel(
                tabPanel("Background",
                         h4("Background"),
                         p("Welcome to the background section.")
                         ),
                tabPanel("Methods",
                         h4("Methods"),
                         p("Welcome to the methods section.")
                         ),
                tabPanel("Findings",
                         h4("Findings"),
                         p("Welcome to the findings section."),
                         #plot1
                         fluidRow(
                                 column(9,
                                        plotOutput(outputId = "plot1")
                                 ),
                                 column(3,
                                        br(),
                                        selectInput(inputId = "metric",
                                                    label = "Metric:",
                                                    choices = c("Comments",
                                                                "Votes",
                                                                "Times"),
                                                    selected = "Comments"),
                                        selectInput(inputId = "breakdown",
                                                    label = "Breakdown:",
                                                    choices = c("Subs",
                                                                "Days",
                                                                "Pages",
                                                                "Formats"),
                                                    selected = "Subs")
                                 )
                        ),
                         
                         plotOutput(outputId = "plot3"),
                         #plot2
                         fluidRow(
                                 column(9,
                                        plotOutput(outputId = "plot2")
                                 ),
                                 column(3,
                                        br(),
                                        selectInput(inputId = "claimtype",
                                                    label = "Type of Claim:",
                                                    choices = c("Ack no cred",
                                                                "Credential",
                                                                "Experience",
                                                                "No cred",
                                                                "Refd cred",
                                                                "Source"),
                                                    selected = "Source"),
                                        selectInput(inputId = "f",
                                                    label = "Breakdown:",
                                                    choices = c("None", "Subs", "Formats", "Days"),
                                                    selected = "None")
                                 ))
                         ),
                tabPanel("References",
                         h4("References"),
                         p("one"),
                         p("two")
                         )
        )
        

))