#title: Data Preparation
#description: Depicts the code used to clean and prepare shot data 
#input: stephen-curry.csv, klay-thompson.csv, kevin-durant.csv, draymond-green.csv, andre-iguodala.csv
#output: shots-data.csv and summaries of original data in txt


library(tidyverse)
setwd('C:/Users/hyshim05/Desktop/hw-stat133/workout1/code')


curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

curry$name <- 'Stephen Curry'
thompson$name <- 'Klay Thompson'
durant$name <- 'Kevin Durant'
green$name <- 'Draymond Green'
iguodala$name <- 'Andre Iguodala'

curry[curry$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
curry[curry$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'
thompson[thompson$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
thompson[thompson$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'
durant[durant$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
durant[durant$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'
green[green$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
green[green$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'
iguodala[iguodala$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
iguodala[iguodala$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'

curry <- mutate(curry, minute = (period*12) - minutes_remaining)
thompson <- mutate(thompson, minute = (period*12) - minutes_remaining)
durant <- mutate(durant, minute = (period*12) - minutes_remaining)
green <- mutate(green, minute = (period*12) - minutes_remaining)
iguodala <- mutate(iguodala, minute = (period*12) - minutes_remaining)

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

data <- rbind(curry, thompson, durant, green, iguodala)
write.csv(data, file = '../data/shots-data.csv')

sink(file = '../output/shots-data-summary.txt')
summary(data)
sink()
