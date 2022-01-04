#Assignment 1
#loading data into enivronment
reports_data <- read.csv("data/reports.csv")
reviews_data <- read.csv("data/reviews.csv")
users_data <- read.csv("data/users.csv")

#comb
library(tidyverse)

#1.1 Average attribute score for brands
# average_brand_score <- mean(reviews_data[, 6-19])
mean_brand_score <- mean(reviews_data[, 4])
data.frame(Name = c(reports_data))

brand_df <- data.frame(brandName = 0, Bold = 0)

for (row in 1:nrow(reports_data)) {
  brandId <- reports_data[row, "ReportId"]
  brandName <- reports_data[row, "Name"]
  for (i in colnames(reviews_data[, 6:19])) {
    print(i)
   groupedReviews <- reviews_data %>%
      group_by(reports_data[row, "ReportId"])
   print(groupedReviews[[i]])
      average <- mean(groupedReviews[[i]])
  print(average)
  newrow <- c(reports_data[row, "Name"], average)
  brand_df <- rbind(brand_df, newrow)
}

