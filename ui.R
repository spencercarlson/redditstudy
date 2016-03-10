library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
        theme = shinytheme("readable"),
        # Application title
        titlePanel("Credibility on Reddit"),
        h4("Examining four variations on a system design for computer-supported discourse"),
        tabsetPanel(
                tabPanel("Background",
                         h4("Hello!"),
                         p("Welcome to the background section.")
                         ),
                tabPanel("Methods",
                         h4("Hello!"),
                         p("Welcome to the methods section."),
                         ),
                tabPanel("Findings",
                         h4("Hello!"),
                         p("Welcome to the findings section.")
                         ),
                tabPanel("Graphs",
                         h4("Explore The Data"),
                         h6("Break Down Each of the Metrics by Subreddit, Subreddit Format, Subreddit Page, and Day."),
                         #plot1
                         fluidRow(
                                 column(6,
                                        selectInput(inputId = "metric",
                                                    label = "Metric:",
                                                    choices = c("Comments",
                                                                "Votes",
                                                                "Times"),
                                                    selected = "Comments")
                                 ),
                                 column(6,
                                        selectInput(inputId = "breakdown",
                                                    label = "Breakdown:",
                                                    choices = c("Subs",
                                                                "Days",
                                                                "Pages",
                                                                "Formats"),
                                                    selected = "Subs")
                                 )),
                         
                         plotOutput(outputId = "plot1", height = "500px"),
                         
                         plotOutput(outputId = "plot3", height = "500px"),
                         #plot2
                         fluidRow(
                                 column(6,
                                        selectInput(inputId = "claimtype",
                                                    label = "Type of Claim:",
                                                    choices = c("Ack no cred",
                                                                "Credential",
                                                                "Experience",
                                                                "No cred",
                                                                "Refd cred",
                                                                "Source"),
                                                    selected = "Source")
                                 ),
                                 column(6,
                                        selectInput(inputId = "f",
                                                    label = "Breakdown:",
                                                    choices = c("None", "Subs", "Formats", "Days"),
                                                    selected = "None")
                                 )),
                         
                         plotOutput(outputId = "plot2", height = "500px")
                         )
        )
        

))