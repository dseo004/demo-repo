########################################
## title: make-shots-data-script
## description: Read in the data and create a global chart that contains all the data.
##              Generate output pdf file and png file for each seperate charts and 
##              the global charts.
## input(s): shots-data.csv
## output(s): andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, 
##            kevin-durant-shot-chart.pdf, klay-thompson-shot-chart.pdf, 
##            stephen-curry-shot-chart.pdf, gsw-shot-charts.pdf,
##            gsw-shot-charts.png
########################################

data_types = c("team_name"="character", "game_date"="character", "season" = "integer", "period"="integer",
               "minutes_remaining"="integer", "seconds_remaining"="integer", "shot_made_flag"="character",
               "action_type"="factor", "shot_type"="factor", "shot_distance"="integer", "opponent"="character",
               "x"="integer", "y"="integer")

iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE, colClasses = data_types)
curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE, colClasses = data_types)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = data_types)
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = data_types)
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = data_types)

#part 1.
iguodala$name <- "Andre Iguodala"
curry$name <- "Stephen Curry"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
green$name <- "Draymond Green"

#part 2. 
iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]<-"shot no"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]<-"shot yes"

curry$shot_made_flag[curry$shot_made_flag=="n"]<-"shot no"
curry$shot_made_flag[curry$shot_made_flag=="y"]<-"shot yes"

durant$shot_made_flag[durant$shot_made_flag=="n"]<-"shot no"
durant$shot_made_flag[durant$shot_made_flag=="y"]<-"shot yes"

thompson$shot_made_flag[thompson$shot_made_flag=="n"]<-"shot no"
thompson$shot_made_flag[thompson$shot_made_flag=="y"]<-"shot yes"

green$shot_made_flag[green$shot_made_flag=="n"]<-"shot no"
green$shot_made_flag[green$shot_made_flag=="y"]<-"shot yes"

#part 3.
iguodala$minute <- 12*iguodala$period - iguodala$minutes_remaining

curry$minute <- 12*curry$period - curry$minutes_remaining

durant$minute <- 12*durant$period - durant$minutes_remaining

thompson$minute <- 12*thompson$period - thompson$minutes_remaining

green$minute <- 12*green$period - green$minutes_remaining

#part 4.
sink(file = "output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "output/stephen-curry-summary.txt")
summary(curry)
sink()

sink(file = "output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "output/draymond-green-summary.txt")
summary(green)
sink()

bindbindcrackers <- rbind(iguodala,curry,durant,thompson,green)

write.csv(bindbindcrackers, file="data/shots-data.csv")

sink(file = "output/shot-data-summary.txt")
summary(bindbindcrackers)
sink()

