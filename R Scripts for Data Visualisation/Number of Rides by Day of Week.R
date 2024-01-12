library("tidyverse")

options(scipen = 999)
monthly_rides <- read_csv("C:/Users/Bing Xuan/Desktop/Stuff/Google Data Analytics Certificate Resources/Case Study/Tables Obtained/Day of Week.csv")
bar_graph <- ggplot(data = monthly_rides) +
             geom_bar(stat = "identity", mapping = aes(x = day_of_week, y = number_of_rides, fill = member_casual), position = "dodge") +
             scale_x_continuous(breaks = seq(1, 7, by = 1)) +
             xlab("Day of Week") +
             ylab("Number of Rides") +
             labs(title = "Number of Rides by Day of Week") +
             scale_fill_manual(name = "Groups", values = c("Casual" = "blue", "Member" = "red"))
bar_graph
