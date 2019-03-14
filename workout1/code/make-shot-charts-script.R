#title: Creating Shot Charts
#description: Depicts the code used to create shot charts on the five starting players on the Golden State Warriors
#input: stephen-curry.csv, klay-thompson.csv, kevin-durant.csv, draymond-green.csv, andre-iguodala.csv, nba-court.jpg
#output: shot-chart.pdf on each player, gsw-shot-charts.pdf, gsw-shot-charts.png

library(jpeg)
library(grid)
library(ggplot2)

data <- read.csv('../data/shots-data.csv', stringsAsFactors = FALSE)
curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)


court_file <- '../images/nba-court.jpg'

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'npc')
)

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

pdf(file = '../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
curry_shot_chart
dev.off()

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

pdf(file = '../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
thompson_shot_chart
dev.off()

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

pdf(file = '../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
durant_shot_chart
dev.off()

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

pdf(file = '../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
green_shot_chart
dev.off()

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

pdf(file = '../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

gsw_shot_chart <- ggplot(data = data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, stroke = 0.1)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  facet_wrap(~ name)
  theme_minimal()


pdf(file = '../images/gsw-shot-charts.pdf', width = 8, height = 7)
gsw_shot_chart
dev.off()

png(file = '../images/gsw-shot-charts.png', units = 'in', width = 8, height = 7, res = 200)
gsw_shot_chart
dev.off()