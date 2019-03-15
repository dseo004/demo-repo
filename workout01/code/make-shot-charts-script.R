##################################

## title: make-shots-data-script
## description: Read in data and create a global table that contains all the data.
##              Generate output txt file for each seperate tables and global table.
##              G
## input(s): andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, 
##           klay-thompson.csv, stephen-curry.csv
## output(s): andre-iguodala-summary.txt, draymond-green-summary.txt, 
##            kevin-durant-summary.txt, klay-thompson-summary.txt, 
##            stephen-curry-summary.txt, shots-data-summary.txt
##################################

library(dplyr)
library(ggplot2)
library(jpeg)
library(grid)
global <- read.csv("data/shots-data.csv", stringsAsFactors = FALSE)
andre <- subset(global, name == "Andre Iguodala")
graymond <- subset(global, name == "Graymond Green")
kevin <- subset(global, name == "Kevin Durant")
klay <- subset(global, name == "Klay Thompson")
stephen <- subset(global, name == "Stephen Curry")


# scatterplot -------------------------------------------------------------

andre_scatterplot <- ggplot(data = andre) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
andre_scatterplot

graymond_scatterplot <- ggplot(data = graymond) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
graymond_scatterplot

kevin_scatterplot <- ggplot(data = kevin) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
kevin_scatterplot

klay_scatterplot <- ggplot(data = klay) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
klay_scatterplot

stephen_scatterplot <- ggplot(data = stephen) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
stephen_scatterplot


# short chart -------------------------------------------------------------

court_file <- "images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

#andre_shot_chart
andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave(filename = "images/andre-iguodala-shot-chart.pdf",
       plot = andre_shot_chart, width = 6.5, height = 7)

#graymond_shot_chart
graymond_shot_chart <- ggplot(data = graymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Graymond Green (2016 season)') +
  theme_minimal()
ggsave(filename = "images/graymond-green-shot-chart.pdf",
       plot = graymond_shot_chart, width = 6.5, height = 7)

#kevin_shot_chart
kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave(filename = "images/kevin-durant-shot-chart.pdf",
       plot = kevin_shot_chart, width = 6.5, height = 7)

#klay_shot_chart
klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave(filename = "images/klay-thompson-shot-chart.pdf",
       plot = klay_shot_chart, width = 6.5, height = 7)

#stephen_shot_chart
stephen_shot_chart <- ggplot(data = stephen) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave(filename = "images/stephen-curry-shot-chart.pdf",
       plot = stephen_shot_chart, width = 6.5, height = 7)


# facet -------------------------------------------------------------------
gl <- ggplot(data = global) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal()
gsw <- gl + facet_wrap(~name, ncol = 3)
ggsave(filename = "images/gsw-shot-charts.pdf", width = 8, height = 7)
ggsave(filename = "images/gsw-shot-charts.png", width = 8, height = 7)

