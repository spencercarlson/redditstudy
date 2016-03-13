library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
        theme = shinytheme("spacelab"),
        # Application title
        titlePanel("Credibility on Reddit"),
        h4("Examining four variations on a system design for credibility-grounded knowledge sharing"),
        tabsetPanel(
                tabPanel("Background",
                         fluidRow(
                                 column(8, offset=1,
                                        h3("Background"),
                                        p("The speed with which new communication technologies have developed over the past several decades has been exciting for many people who have recognized that learning is a social process, and accordingly have hoped that learning could benefit from improved (or at least increased) methods of social interaction. A number of research fields have been developed around this hope, including Computer-Supported Collaborative Learning (CSCL), which seeks to understand how computers and computer systems can be used to help people learn together (Stahl, Koschmann, & Suthers, 2014)."),
                                        p("Early conversations about CSCL were often inspired by the notion that computer systems could be used to support the crucial social behaviors underlying functional learning communities — learning environments that seek to promote individual knowledge building by promoting collective knowledge building (Bielaczyc & Collins, 1999; Scardamalia & Bereiter, 1996). Specifically, it was recognized that learning communities needed members with diverse expertise, and a mechanism for sharing that expertise within the community. In order to develop this mechanism in a way that might be scalable, researchers designed and tested computer systems (e.g. CSILE, Scardamalia & Bereiter, 1996) to facilitate knowledge sharing in learning communities."),
                                        p("However, most of the research on CSCL systems has focused on relatively small-scale communities. While this research has produced theory and design principles for CSCL environments catering to those kinds of communities, there is a dearth of research on the massive kinds of communities that have evolved online as the Internet has become more and more widely used over the past two decades. This is problematic because there are certain issues that are magnified in importance as the number of learners in environments grows exponentially — one of which is how learners assess the credibility of their fellow community members, whom they have almost certainly never met."),
                                        p("This is an issue that has impacted learning and education well beyond the limits of CSCL. As the Internet has connected learners to more and more information (true and false) and experts (real and phony), and as the extremely open and participatory nature of Internet platforms often makes it very difficult to distinguish true information and real experts from false information and phony experts, learners have found themselves in need of a new set of skills for deciding what is credible and what is just noise (Kelly, 2013)."),
                                        p("Furthermore, even when a relatively small number of learners are involved, credibility has been found to matter in CSCL because without a belief in the credibility of other community members, learners do not engage in practices that are important for learning (Simeone & Eneau, 2009)."),
                                        p("Some research has been conducted examining how young people evaluate the credibility of information they find online; one key finding is that some people demonstrate a much more nuanced understanding of how to determine what is credible than do others (Hargittai, Fullerton, Menchen-Trevino, & Thomas, 2010; Menchen-Trevino & Thomas, 2011)."),
                                        p("However, little is known about how to design CSCL environments to support credibility-grounded knowledge sharing in massive learning communities. This is an important area of study because research on learning in forums (a term some researchers use to describe computer supports for communication) such as group discussion spaces and online communities has revealed that the designs of forums mediate the kinds of learning interactions people have while using those forums (Desanctis, Fayard, Roach, & Jiang, 2003). In other words, it is possible that by designing CSCL environments in a certain way, we can encourage learners to engage in credibility-grounded knowledge sharing."),
                                        p("In this study, I begin to address our existing lack of knowledge about how to design CSCL environments to support credibility-grounded knowledge sharing in massive learning communities. I do so by analyzing the interactions of users of four distinct communities within Reddit, a popular website on which millions of users engage in discourse, focusing on how users make claims about what is true, and how those claims are received by other users.")
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
                                          votes are not intended to be used as a tool for voicing agreement or disagreement with the content of the post — that is what comments are for. Instead, votes enable users to note whether the 
                                          post is of interest or value to the subreddit community — they act as a crowd-powered quality control device. In theory, users would upvote (or at least refrain from downvoting) a post expressing an opinion
                                          with which they disagreed, as long as it was on-topic and met other community standards of quality."),
                                        p(strong("'I Am A' Subreddit Design Features"), "In I Am A, each post was dedicated to asking a particular user questions. That user was someone — often an expert or a celebrity — with unique knowledge that the community wished to probe.",
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
                                                        <li><strong>Underlying Structure(s)</strong> One type: Community of interest. Users posted links to and discussed content that was related to a topic of interest — in this case, news.</li>
                                                        <li><strong>Role of Facilitator</strong> Less involved: facilitators (called moderators on Reddit) were responsible for policing community standards in the subreddit, but did not need to do other orchestration tasks.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        p(strong("'Space' Subreddit Design Features"), "In Space, users posted links about and discussed space, astronomy, and physics.",
                                          HTML("
                                               
                                                  <ul>
                                                        <li><strong>Type(s) of Post</strong> One type: Links to articles and resources about space.</li>
                                                        <li><strong>Underlying Structure(s)</strong> Two types: Mainly community of interest, with an element of question-and-answer. Users posted links to and discussed content that was related to a topic of interest — in this case, space. But the first post in the subreddit was always a post in which commenters asked questions about space, and other users answered their questions.</li>
                                                        <li><strong>Role of Facilitator</strong> Less involved: facilitators (called moderators on Reddit) were responsible for policing community standards in the subreddit, but did not need to do other orchestration tasks.</li>
                                                  </ul>
                                               "
                                          )
                                        ),
                                        h4("Sample and Data Collection"),
                                        p("The raw data I captured were images of the subreddit home pages and the comment conversations attached to posts. Home pages listed 25 posts per page (except for Space, which listed 26 on its first page and 25 on later pages), and posts had between 0 and thousands of comments.
                                          I captured images of the first two pages of each subreddit, resulting in a high-level sampling of 50 posts per subreddit. I also captured images of the comments on two posts per subreddit — the first and last of those fifty posts.
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
                                                        <li><strong>Elaborating on credibility (experience)</strong> <em>[Elab experience]</em> User responding to a follow-up or rejection of credibility by elaborating on their credibility.</li>
                                                        <li><strong>Elaborating on credibility (credential)</strong> <em>[Elab credential]</em> User responding to a follow-up or rejection of credibility by elaborating on their credibility.</li>
                                                        <li><strong>Elaborating on credibility (source)</strong> <em>[Elab source]</em> User responding to a follow-up or rejection of credibility by elaborating on their credibility.</li>
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
                                        h3("Findings"),
                                        p("As shown in the plot below, comments, votes, and times did not vary appreciably across days. They had a very slightly wider distribution on day two than day one, though."),
                                        p("As one might expect, comments and votes were consistently higher on the first page of each subreddit, with roughly equivalent distributions. Times did not vary much from page to page — although median times were all but equal, the distribution of times for posts on the first page was skewed to longer times more than was the distribution of times for posts on the second page."),
                                        p("Looking at median values by subreddit, News and I Am A took first and second place for comments and votes. For votes, ELI5 and Space tied for last place; for comments, ELI5 had more than Space. ELI5, News, and Space all had roughly equivalent times with roughly equivalent moderate distributions — but I Am A had a tight distribution of times at the top end of the others’ distributions."),
                                        br()
                                        )),
                         #plot1
                         fluidRow(
                                 column(8, offset=1,
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
                         fluidRow(
                                 column(8, offset=1,
                                        br(),
                                        p("Finally, community of interest formats and question-and-answer formats had roughly the same range of distribution for votes and comments, but the median for communities of interest skewed higher than for question-and-answer. On times, formats had roughly equivalent ranges but question-and-answer’s median skewed a fair bit higher than that for communities of interest."),
                                        p("In short, subreddit design did not have a clear relationship to the number of votes and comments on posts shown on the front two pages of each subreddit — nor on the times since posts had been posted.")
                                 )
                         ),
                         fluidRow(
                                 column(8, offset=1,
                                        h4("Credibility and Knowledge-Sharing as Embedded in Conversation"),
                                        p("In the process of coding I found that there were often large sections of comments that could not be coded as being related to factual claim-making or credibility assessment. In most cases, these comments were humorous or focused on opinion and storytelling rather than ostensibly objective knowledge. Interestingly, it was common for the topic of comment conversations to evolve, until the conversation was no longer clearly related to the topic of the post. Frequently, this shift in topic occurred in non-knowledge-sharing or credibility-focused comments. This indicates that — despite their apparent irrelevance — humorous, opinion-focused, and storytelling comments may be instrumental in facilitating the choosing of topics to discuss more seriously. More research is needed to better understand this possible relationship."),
                                        p("Additionally, the fact that conversations drifted across topics based on the whims of users indicate that Reddit is good at supporting collectively self-directed learning. While learners can elect to constrain themselves within certain topical boundaries by using subreddits such as Space, they still allow each other a certain degree of leeway in discussing the topics that interest them. Because anyone can introduce a topic — and because topics become prominent or disappear based on their grassroots support by other learners — Reddit can be said to have a highly democratic approach to topic selection that is incompatible with the majority of today’s formal learning environments. However, this does not necessarily mean that systems like Reddit should not be used in formal learning environments — only that if formal learning environments incorporate systems like Reddit", em("without changing anything else about the environment,"), "things are not likely to work well. Specifically, formal learning environments need to more thoroughly adopt the principle and implications of self-directed learning if they expect to use systems like Reddit coherently.")
                                 )
                         ),
                         
                         fluidRow(
                                 column(8, offset=1,
                                        h4("Claim Types, Response Types and Design Implications"),
                                        p("As illustrated below, 53.5% of all claims made no reference to the credibility of the poster. 24.2% of all claims made reference to some kind of credibility (either from poster credential, experience, or a source) and another 17.1% came from posters who had already established their credibility elsewhere in the comments. The remaining 5.2% of claims acknowledged their lack of credibility."),
                                        p("News and Space, the two subreddits organized around communities of interest, used posts that linked to third-party resources rather than the text posts used by other subreddits. This seemed to have an impact on the kind of claims made within News and Space — after the omnipresent no-credibility-referenced claims, claims referencing a source were the most common in both subreddits. Therefore, it appears that environments which focus on sharing resources in their posts also foster cultures of resource-sharing in their comments."),
                                        br()
                                 )
                         ),
                         #plot3
                         fluidRow(
                                 column(8, offset=1,
                                        plotOutput(outputId = "plot3")
                                 ),
                                 column(3,
                                        br(),
                                        selectInput(inputId = "breakdown3",
                                                    label = "Breakdown:",
                                                    choices = c("None", "Subs", "Formats", "Days"),
                                                    selected = "None"
                                        )
                                 )
                         ),
                         fluidRow(
                                 column(8, offset=1,
                                        br(),
                                        p("The vast majority of comments by users who had already established their credibility occurred in I Am A — in fact, there were more of those comments than comments in which someone made a claim without establishing their credibility (which is impressive considering that overall, claims without reference to credibility outnumbered claims with already established credibility by a factor of three). This indicates that learning environments that are organized around probing the knowledge of vetted experts (as is I Am A) are more likely to encourage credibility-grounded knowledge sharing than any of the other subreddit designs."),
                                        p("On the other hand, by far the most claims were on posts in ELI5. This meant that in almost every case, ELI5 had more claims referencing each kind credibility (experience, credential, and source) than any other subreddit. However, ELI5 also had a far larger number of claims with no reference to credibility, and claims that acknowledged their lack of credibility. Therefore, it seems that the ELI5 system of asking questions of a crowd simply resulted in more information — both good and bad. In order to tell whether the ELI5 system was useful to learners seeking credible information, it is necessary to know how (or whether) learners reacted differently to posts that referenced credibility, and posts that did not. To be specific, if learners were able to find the credible posts, and accept them or ask follow-up questions — and did not do so for non-credible posts, then the design could be considered successful. However, the interactive plot below demonstrates that this is not what happened for any other claim type than claims that referenced a credential."),
                                        br()
                                 )
                         ),
                         #plot2
                         fluidRow(
                                 column(8, offset=1,
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
                         ),
                         fluidRow(
                                 column(8, offset=1,
                                        br(),
                                        p("For all other claim types, by far the most common type of response was no response at all. From this information, we cannot say what learners made of claims. They may have accepted them, they may have rejected them, or they may have never even read them — the one thing they did not do was provide conclusive evidence of any of those possibilities. Further research is needed in order to better understand how learners responded to different kinds of claims — and by extension, whether the fact that ELI5’s design results in more claims (both credible and non-credible) is beneficial to credibility-grounded knowledge sharing."),
                                        p("In general, the fact that such a large proportion of the claims made went unanswered is curious. Again, by the nature of the observation, we do not have any evidence that can help to explain why it occurred. Therefore, further research is needed to parse the phenomenon of not responding to claims before the overall question of which designs best promote credibility-grounded knowledge sharing can be satisfactorily answered in this context. Most likely, this will require directly engaging learners using interviews or surveys, in addition to observing the interface of the learning environment.")
                                 )
                         )
                ),
                tabPanel("Conclusion",
                         fluidRow(
                                 column(8, offset=1,
                                        h3("Conclusion"),
                                        p("In this study, I began to address our existing lack of knowledge about how to design CSCL environments to support credibility-grounded knowledge sharing in massive learning communities. I analyzed the designs and usage patterns of four learning communities within Reddit to understand whether different designs seemed to support different knowledge-sharing behaviors — specifically, I looked at the role of credibility in knowledge-sharing. I found that (a) knowledge sharing was embedded within broader conversations that included apparently irrelevant diversions that nonetheless may have played an instrumental role in facilitating topic selection for knowledge sharing, (b) subreddit designs that encouraged learners to share resources (and therefore make the credibility of their claims explicit) also seemed to implicitly encourage learners to back up their claims with sources, and (c) subreddit designs that prompted learners to ask questions of a crowd seemed to encourage higher levels of claim-making across all claim types — the benefit of which is unclear until we understand whether learners were able to ignore the non-credible claims and simply benefit from an increased number of credible claims."),
                                        p("These findings do not definitively answer any questions, but rather provide a clear direction for further research; in order to better understand what design features can help promote credibility-grounded knowledge sharing in massive learning communities, we need studies that explain, correspondingly, (a) the role of apparently off-topic banter between bouts of credibility-grounded knowledge sharing, (b) whether encouraging learners to share resources can implicitly encourage them to back up their claims with sources in other circumstances, or if perhaps this is due to other factors related to the topic of the subreddit (news), and (c) what it means when learners do not respond to claims.")
                                 )
                         )
                ),
                tabPanel("References",
                         fluidRow(
                                 column(8, offset=1,
                                        h3("References"),
                                        p("Bielaczyc, K., & Collins, A. (1999). Learning communities in classrooms: A reconceptualization of educational practice.", em("Instructional-design theories and models: A new paradigm of instructional theory,"),"2, 269-292."),
                                        p("DeSanctis, G., Fayard, A. L., Roach, M., & Jiang, L. (2003). Learning in online forums.", em("European Management Journal,"), "21(5), 565-577."),
                                        p("Eneau, J., & Siméone, A. (2009, July). Trust and credibility in an online computer-supported collaborative learning (CSCL) task.", em("In 9th World Conference on Computers in Education-IFIP.")),
                                        p("Hargittai, E., Fullerton, L., Menchen-Trevino, E., & Thomas, K.Y. (2010). Trust online: Young adults’ evaluation of web content.", em("International Journal of Communication. 4,"), "468-494."),
                                        p("Kelly, T. M. (2013).", em("Teaching history in the digital age."), "University of Michigan Press."),
                                        p("Menchen-Trevino, E., & Hargittai, E. (2011). Young adults’ credibility assessment of Wikipedia.", em("Communication and Society,"), "14(1), 24-51."),
                                        p("Scardamalia, M., & Bereiter, C. (1996). Computer support for knowledge-building communities. In T. Koschmann (Ed.),", em("CSCL: Theory and practice of an emerging paradigm"), "(pp. 249-268). Mahwah, NJ: Lawrence Erlbaum Associates."),
                                        p("Stahl, G., Koschmann, T., & Suthers, D. (2014). [Computer-supported collaborative learning]. In R. K. Sawyer (Ed.),", em("The Cambridge handbook of the learning sciences"), "(2nd ed., pp. 751-783). New York, NY: Cambridge University Press.")
                                 )
                         )
                )
        )
)
)