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
                                        h3("Methods"),
                                        p("I collected and analyzed data from four subreddits:",
                                          a(href="http://www.reddit.com/r/IAmA","I Am A,"),
                                          a(href="http://www.reddit.com/r/explainlikeimfive","Explain Like I'm Five (ELI5),"),
                                          a(href="http://www.reddit.com/r/news","News,"),
                                          "and",
                                          a(href="reddit.com/r/space","Space."),
                                          "I chose the first two subreddits because they followed different versions 
of a question-and-answer format, and the second two subreddits because they followed different versions of a community-of-interest format. Below, I describe the key features I identified that 
distinguished the subreddits from each other. First, I describe the key features that the subreddits shared."),
                                        h4("Subreddit Choices"),
                                        p("All subreddits had the same interface and basic functions that characterize Reddit; a simple, text- and link-dominated user interface that allows users to create, vote on, and comment on posts.
                                          The type of content included in posts varies from subreddit to subreddit (and in some cases even within subreddits, as discussed below). According to site norms displayed on the subreddit pages, on Reddit,
                                          votes are not intended to be used as a tool for voicing agreement or disagreement with the content of the post -- that is what comments are for. Instead, votes enable users to note whether the 
                                          post is of interest or value to the subreddit community -- they act as a crowd-powered quality control device. In theory, users would upvote (or at least refrain from downvoting) a post expressing an opinion
                                          with which they disagreed, as long as it was on-topic and met other community standards of quality."),
                                        p(strong("'I Am A' Subreddit Design Features"), "In I Am A, each post was dedicated to asking a particular user questions. That user was someone -- often an expert or a celebrity -- with unique knowledge that the community wished to probe.",
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Type(s) of Post</strong> Two types: (1) AMA (ask me anything) posts, in which an expert or celebrity answers users' questions, and (2) AMA requests, in which users post about which celebrities or experts they wish would do an AMA.</li>
                                                        <li><strong>Underlying Structure(s)</strong> One type: Question-and-answer. In this case, questions were comments on the initial post announcing the AMA, and answers were comments on those question comments (on Reddit, users can comments on comments as well as posts).</li>
                                                        <li><strong>Role of Facilitator</strong> Highly involved: facilitators (called moderators on Reddit) were responsible for policing community standards in the subreddit, but also for doing the work of verifying celebrity and expert identities and setting up high-profile AMAs.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p(strong("'ELI5' Subreddit Design Features"), "In ELI5, users created posts asking for simple explanations to complicated questions. Then, other users offered their best answers, and endorsed or critiqued the answers given by others.",
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Type(s) of Post</strong> One type: Questions, in the format, 'ELI5: Why does Congress decide how much to pay themselves?'</li>
                                                        <li><strong>Underlying Structure(s)</strong> One type: Question-and-answer. In this case, questions were posts, and answers were comments on those posts.</li>
                                                        <li><strong>Role of Facilitator</strong> Less involved: facilitators (called moderators on Reddit) were responsible for policing community standards in the subreddit, but did not need to do other orchestration tasks.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p(strong("'News' Subreddit Design Features"), "In News, users posted links to news stories and discussed those stories.",
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Type(s) of Post</strong> One type: Links to news articles.</li>
                                                        <li><strong>Underlying Structure(s)</strong> One type: Community of interest. Users posted links to and discussed content that was related to a topic of interest -- in this case, news.</li>
                                                        <li><strong>Role of Facilitator</strong> Less involved: facilitators (called moderators on Reddit) were responsible for policing community standards in the subreddit, but did not need to do other orchestration tasks.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p(strong("'Space' Subreddit Design Features"), "In Space, users posted links about and discussed space, astronomy, and physics.",
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Type(s) of Post</strong> One type: Links to articles and resources about space.</li>
                                                        <li><strong>Underlying Structure(s)</strong> Two types: Mainly community of interest, with an element of question-and-answer. Users posted links to and discussed content that was related to a topic of interest -- in this case, space. But the first post in the subreddit was always a post in which commenters asked questions about space, and other users answered their questions.</li>
                                                        <li><strong>Role of Facilitator</strong> Less involved: facilitators (called moderators on Reddit) were responsible for policing community standards in the subreddit, but did not need to do other orchestration tasks.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        h4("Sample and Data Collection"),
                                        p("The raw data I captured were images of the subreddit home pages and the comment conversations attached to posts. Home pages listed 25 posts per page (except for Space, which listed 26 on its first page and 25 on later pages), and posts had between 0 and thousands of comments.
                                          I captured images of the first two pages of each subreddit, resulting in a high-level sampling of 50 posts per subreddit. I also captured images of the comments on two posts per subreddit -- the first and last of those fifty posts.
                                          I did this for each subreddit on two separate days, resulting in a sample of 402 posts captured at a high level, of which 16 were captured in-depth by also looking at comments."),
                                        h4("Analysis"),
                                        p("I performed a content analysis of the data in two steps. First, I coded the data. Then, I created spreadsheets with entries describing interesting facets of the data, imported those spreadsheets into R, and conducted an exploratory quantitative analysis of the data."),
                                        p("In order to code the data, I began by open coding the comments on two posts. In order to make it possible to look at a variety of posts, I only coded the first 200 comments on each post. This is the number of comments Reddit shows automatically, unless a user clicks a button to show more comments.
                                          Given that I wanted to understand how the majority of people interact with Reddit in order to engage in discourse, it made sense to focus on the comments that the largest number of users would be interacting with. I organized the codes from open coding into a preliminary coding scheme, which I continued to refine as I used it to code the remaining data. The final coding scheme is below. The italicized abbreviations after the code names are the identifiers used in the plots in the Findings section:"),
                                        p(strong("Claim-making"),
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Claim, no reference to credibility</strong> <em>[No cred]</em> User making a claim without attempting to establish credibility.</li>
                                                        <li><strong>Claim, acknowledging lack of credibility</strong> <em>[Ack no cred]</em> User making a claim and acknowledging that it may not be credible or accurate.</li>
                                                        <li><strong>Claim, referencing credibility (experience)</strong> <em>[Experience]</em> User making a claim and backing it up by referencing their experience, personal or professional.</li>
                                                        <li><strong>Claim, referencing credibility (credential)</strong> <em>[Credential]</em> User making a claim and backing it up with a credential (i.e. degree or title).</li>
                                                        <li><strong>Claim, referencing credibility (source)</strong> <em>[Source]</em> User making a claim and backing it up with an explicitly referenced source.</li>
                                                        <li><strong>Claim, credibility already referenced</strong> <em>[Refd cred]</em> User making a claim, having already attempted to establish credibility in another comment.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p(strong("Reacting to claims"),
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Accepting the credibility of a claim</strong> <em>[Accept]</em> User vocalizing acceptance or appreciation (implicit acceptance) of the claim.</li>
                                                        <li><strong>Rejecting the credibility of a claim</strong> <em>[Reject]</em> User vocalized criticism of the claim's credibility.</li>
                                                        <li><strong>Following up</strong> <em>[Follow-up]</em> User asked a follow-up question to claim-maker; unclear whether they accepted or rejected the initial claim.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p(strong("Elaborating"),
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Elaborating on credibility (experience)</strong> User responding to a follow-up or rejection of credibility by elaborating on their credibility.</li>
                                                        <li><strong>Elaborating on credibility (credential)</strong> User responding to a follow-up or rejection of credibility by elaborating on their credibility.</li>
                                                        <li><strong>Elaborating on credibility (source)</strong> User responding to a follow-up or rejection of credibility by elaborating on their credibility.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p("In addition to coding the comments on the 16 collected posts, I used the 402 posts (those captured at a high level on the first two pages of each subreddit for each day) to record the number of votes and comments on each post, as well as the amount of time since it was posted."),
                                        p("Next, I created four spreadsheets. The first three contained 402 entries (one for each post) which gave a value for votes, comments, or time since posted, as well as a value noting which page, of which subreddit, on which day, the entry came from.
                                          The final spreadsheet contained a table with 422 entries: one for each claim-response pairing identified in the comments on posts. For claims with multiple responses, multiple entries were created. For claims with no responses, a single entry was created with the response type marked as 'None.'"),
                                        p("To interpret the data these tables contained, I wrote R scripts that further processed the data and then drew interactive graphs to allow me to make descriptive observations about the data and to compare frequencies of different types of claim-response pairs across subreddit, subreddit page, and day.
                                          These interactive graphs can be found in the Findings section. The spreadsheet data and code for this app (which contains the code for creating the graphs) are publicly available at",a(href="https://github.com/spencercarlson/redditstudy","https://github.com/spencercarlson/redditstudy"),".")
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