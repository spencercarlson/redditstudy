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
                         fluidRow(
                                 column(8, offset=1,
                                         h4("Background"),
                                         p("Welcome to the background section.")
                                        )
                                )
                        ),
                tabPanel("Methods",
                         fluidRow(
                                 column(8, offset = 1,
                                        h4("Methods"),
                                        p("I collected and analyzed data from four subreddits:",
                                          a(href="http://www.reddit.com/r/IAmA","I Am A,"),
                                          a(href="http://www.reddit.com/r/explainlikeimfive","Explain Like I'm Five,"),
                                          a(href="http://www.reddit.com/r/news","News,"),
                                          "and",
                                          a(href="reddit.com/r/space","Space."),
                                          "I chose the first two subreddits because they followed different versions 
of a question-and-answer format, and the second two subreddits because they followed different versions of a community-of-interest format. Below, I describe the key features I identified that 
distinguished the subreddits from each other. First, I describe the key features that the subreddits shared.",
                                          "All subreddits had the same interface and basic functions that characterize Reddit; a simple, text- and link-dominated user interface that allows users to create, vote on, and comment on posts.",
"In I Am A, 
each post was dedicated to asking a particular user questions. That user was someone -- often an expert or a celebrity -- with unique knowledge that the community wished to probe. 
Explain Like I'm Five was a different permutation of the question-and-answer approach. In ELI5 (as it was abbreviated), users created posts asking for simple explanations to 
complicated questions. Then, other users offered their best answers, and endorsed or critiqued the answers given by others."),
                                        p("The community-of-interest subreddits had a broader focus. In the News subreddit, users posted links to news stories
                                          and discussed those stories. In the Space subreddit, users posted links about and discussed space, astronomy, and physics. The major variation between the two formats
                                          was the subject of interest -- in News post topics ranged widely, while in Space, the topics were much more focused."),
                                        strong("Sample and Data Collection"),
                                        p("The raw data I captured were images of the subreddit home pages and thread conversations. Home pages listed 25 threads per page (except for Space, which listed 26 on its first page and 25 on later pages), and thread conversations had between 0 and thousands of comments.
                                          I captured images of the first two pages of each subreddit, resulting in a high-level sampling of 50 threads per subreddit. I also captured images of the comments on two posts per subreddit -- the first and last of those fifty threads.
                                          I did this for each subreddit on two separate days, resulting in a sample of 402 threads captured at a high level, of which 16 were captured in-depth.")
                                         )
                                 )
                         

                         ),
                tabPanel("Findings",
                         fluidRow(
                                 column(8, offset=1,
                                        h4("Findings"),
                                        p("Welcome to the findings section.")
                                 )),
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
                                        )
                                 )
                         ),
                tabPanel("References",
                         fluidRow(
                                 column(8, offset=1,
                                        h4("References"),
                                        p("one"),
                                        p("two")
                                        )
                                 )
                         )
                )
        )
        )