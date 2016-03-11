atlastimes <- read.csv("SubredditsTimes.csv")
atlascomments <- read.csv("SubredditsComments.csv")
atlasvotes <- read.csv("SubredditsVotes.csv")
credData <- read.csv("Data Linking - Sheet1.csv")
library(shiny)
library(reshape2)
library(lubridate)
library(ggplot2)
library(ggthemes)
library(dplyr)
options(shiny.usecairo=FALSE)

shear <- function(string, number_to_shear){
        string <- substr(string,I(number_to_shear+1),nchar(string))
        return(string)
}
rev_shear <- function(string, number_to_shear){
        string <- substr(string, 0, I(number_to_shear-1))
        return(string)
}
expander <- function(dat){
        dat2 <- c()
        for (i in 1:length(dat[,1])) {
                for (j in 1:dat[i,3]) {
                        dat2 <- rbind(dat2,dat[i,])
                }
        }
        return(dat2)
}
sub_ify <- function(dat){
        subs <- c()
        for (i in 1:length(dat[,1])) {
                if (regexpr("ELI5", as.character(dat$Page[i])) != -1) {
                        subs <- c(subs,"ELI5")
                } else if (regexpr("I.Am.A.", as.character(dat$Page[i])) != -1){
                        subs <- c(subs,"IAmA")
                } else if (regexpr("News", as.character(dat$Page[i])) != -1){
                        subs <- c(subs,"News")
                } else if (regexpr("Space", as.character(dat$Page[i])) != -1){
                        subs <- c(subs,"Space")
                }
        }
        return(subs)
}
day_ify <- function(dat){
        days <- c()
        for (i in 1:length(dat[,1])) {
                if (regexpr("Day.1", as.character(dat$Page[i])) != -1) {
                        days <- c(days,"Day 1")
                } else {
                        days <- c(days,"Day 2")
                }
        }
        return(days)
}

page_ify <- function(dat){
        pages <- c()
        for (i in 1:length(dat[,1])) {
                if (regexpr("Page.1", as.character(dat$Page[i])) != -1) {
                        pages <- c(pages,"Page 1")
                } else if (regexpr("page1", as.character(dat$Page[i])) != -1) {
                        pages <- c(pages,"Page 1")
                } else {
                        pages <- c(pages,"Page 2")
                }
        }
        return(pages)
}

format_ify <- function(dat){
        formats <- c()
        for (i in 1:length(dat[,1])) {
                if (dat$Subs[i] == "ELI5" | dat$Subs[i] == "IAmA") {
                        formats <- c(formats,"Q&A")
                } else {
                        formats <- c(formats,"Community of Interest")
                }
        }
        return(formats)
}

times <- melt(atlastimes)
colnames(times) <- c("Time", "Page", "Freq")
times$Time <- as.character(times$Time)
for (i in 1:length(times[,1])) {
        times[i,1] <- shear(times[i,1], 7)
}
### The following code turns the Time column from useless character
### strings into a numeric, with seconds as the unit
for (i in 1:length(times[,1])) {
        if (regexpr("min", times[i,1]) != -1) {
                num <- regexpr(" ", times[i,1])[1]
                times[i,1] <- rev_shear(times[i,1], num)
                times[i,1] <- as.numeric(I(60*as.numeric(times[i,1])))
        } else if (regexpr("hour", times[i,1]) != -1) {
                num <- regexpr(" ", times[i,1])[1]
                times[i,1] <- rev_shear(times[i,1], num)
                times[i,1] <- as.numeric(I(3600*as.numeric(times[i,1])))
        } else if (regexpr("day", times[i,1]) != -1) {
                num <- regexpr(" ", times[i,1])[1]
                times[i,1] <- rev_shear(times[i,1], num)
                times[i,1] <- as.numeric(I(86400*as.numeric(times[i,1])))
        } else if (times[i,1]=="Now") {
                times[i,1] <- 0
        }
}
times$Time <- as.numeric(times$Time)
times <- filter(times, Freq != 0)
times2 <- expander(times)
times2 <- times2[,1:2]
row.names(times2) <- NULL
times2$Subs <- sub_ify(times2)
times2$Days <- day_ify(times2)
times2$Pages <- page_ify(times2)
times2$Page <- NULL
times2$Formats <- format_ify(times2)

votes <- melt(atlasvotes)
colnames(votes) <- c("Votes", "Page", "Freq")
votes$Votes <- as.character(votes$Votes)
for (i in 1:length(votes[,1])) {
        votes[i,1] <- shear(votes[i,1], 8)
}
votes$Votes <- as.numeric(votes$Votes)
votes <- filter(votes, Freq != 0)
votes2 <- expander(votes)
votes2 <- votes2[,1:2]
row.names(votes2) <- NULL
votes2$Subs <- sub_ify(votes2)
votes2$Days <- day_ify(votes2)
votes2$Pages <- page_ify(votes2)
votes2$Page <- NULL
votes2$Formats <- format_ify(votes2)

comments <- melt(atlascomments)
colnames(comments) <- c("Comments", "Page", "Freq")
comments$Comments <- as.character(comments$Comments)
for (i in 1:length(comments[,1])) {
        comments[i,1] <- shear(comments[i,1], 11)
}
comments$Comments <- as.numeric(comments$Comments)
comments <- filter(comments, Freq != 0)
comments2 <- expander(comments)
comments2 <- comments2[,1:2]
row.names(comments2) <- NULL
comments2$Subs <- sub_ify(comments2)
comments2$Days <- day_ify(comments2)
comments2$Pages <- page_ify(comments2)
comments2$Page <- NULL
comments2$Formats <- format_ify(comments2)

metrics <- cbind(votes2[,1],comments2[,1],times2)
colnames(metrics)[1:2] <- c("Votes","Comments")

credData$Subs[credData$Doc.number == 2 |
                      credData$Doc.number == 3 |
                      credData$Doc.number == 25 |
                      credData$Doc.number == 28] <- "ELI5"

credData$Subs[credData$Doc.number == 8 |
                      credData$Doc.number == 9 |
                      credData$Doc.number == 40 |
                      credData$Doc.number == 42] <- "Space"

credData$Subs[credData$Doc.number == 14 |
                      credData$Doc.number == 15 |
                      credData$Doc.number == 34 |
                      credData$Doc.number == 36] <- "News"

credData$Subs[credData$Doc.number == 20 |
                      credData$Doc.number == 23 |
                      credData$Doc.number == 44 |
                      credData$Doc.number == 47] <- "IAmA"

credData$Days[credData$Doc.number == 2 |
                      credData$Doc.number == 3 |
                      credData$Doc.number == 8 |
                      credData$Doc.number == 9 |
                      credData$Doc.number == 14 |
                      credData$Doc.number == 15 |
                      credData$Doc.number == 20 |
                      credData$Doc.number == 23 ] <- "Day 1"

credData$Days[credData$Doc.number == 25 |
                      credData$Doc.number == 28 |
                      credData$Doc.number == 34 |
                      credData$Doc.number == 36 |
                      credData$Doc.number == 40 |
                      credData$Doc.number == 42 |
                      credData$Doc.number == 44 |
                      credData$Doc.number == 47 ] <- "Day 2"

credData$Formats <- format_ify(credData)

credData <- filter(credData, Claim.type != "Elab source")
credData <- filter(credData, Claim.type != "Elab credential")
credData <- filter(credData, Claim.type != "Follow-up")

credData$doc.claim <- paste(credData$Doc.number,credData$Claim.number)
claims <- credData[!duplicated(credData$doc.claim),]

plotstyle <- theme_hc() + theme(legend.position = "none", 
                   text = element_text(size = 12),
                   plot.title = element_text(size = rel(1.5), face = "bold.italic",color="#666666"))

# Define server logic required to draw some pretty pretty charts
shinyServer(function(input, output) {
        
        # Expression that generates a histogram. The expression is
        # wrapped in a call to renderPlot to indicate that:
        #
        #  1) It is "reactive" and therefore should re-execute automatically
        #     when inputs change
        #  2) Its output type is a plot
        
        output$plot1 <- renderPlot({
                if (input$metric == "Comments") {
                        metnum <- 2
                } else if (input$metric == "Votes") {
                        metnum <- 1
                } else if (input$metric == "Times") {
                        metnum <- 3
                }
                if (input$breakdown == "Subs") {
                        breaknum <- 4
                } else if (input$breakdown == "Days") {
                        breaknum <- 5
                } else if (input$breakdown == "Pages") {
                        breaknum <- 6
                } else if (input$breakdown == "Formats") {
                        breaknum <- 7
                }
                g <- ggplot(metrics,aes(metrics[,breaknum], metrics[,metnum])) +
                        geom_boxplot(aes(fill = metrics[,breaknum])) +
                        scale_y_log10() +
                        ylab(paste(input$metric,"(log10 scale)")) +
                        xlab(input$breakdown) +
                        ggtitle("Number of Votes by Subreddit") +
                        plotstyle
                g
        })
        
        
        output$plot2 <- renderPlot({
                
                gg <- ggplot(data = subset(credData,credData$Claim.type == input$claimtype), aes(Response.type)) +
                        geom_bar(aes(fill=Response.type), position = "dodge") +
                        ylab("Number of Claims-Response Pairs") +
                        xlab("Response Type") +
                        ggtitle("Frequency of Response Types by Claim Type") +
                        plotstyle
                if (input$f != "None") {
                        facetz <- paste(input$f,"~.")
                        gg <- gg + facet_grid(facetz)
                }
                # draw the barchart
                gg
        })
        
        output$plot3 <- renderPlot({
                ggg <- ggplot(claims,aes(Claim.type)) +
                        geom_bar(aes(fill = Claim.type)) +
                        xlab("Claim Type") +
                        ylab("Frequency") +
                        ggtitle("Frequency of Claims by Type") +
                        plotstyle
                if (input$breakdown3 != "None") {
                        facetz <- paste(input$breakdown3, "~.")
                        ggg <- ggg + facet_grid(facetz)
                }
                
                ggg
                
        })
})