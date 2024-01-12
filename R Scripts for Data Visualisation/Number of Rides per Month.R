library("tidyverse")

options(scipen = 999)
monthly_rides <- read_csv("C:/Users/Bing Xuan/Desktop/Stuff/Google Data Analytics Certificate Resources/Case Study/Tables Obtained/Number of Rides Per Month.csv")
line_graph <- ggplot(data = monthly_rides) +
              geom_line(mapping = aes(x = month, y = number_of_rides_casual, color = "Casual"), linewidth = 1) +
              geom_line(mapping = aes(x = month, y = number_of_rides_member, color = "Member"), linewidth = 1) +
              geom_line(mapping = aes(x = month, y = number_of_rides_total, color = "Total"), linewidth = 1) +
              scale_x_continuous(breaks = seq(1, 12, by = 1)) +
              xlab("Month") +
              ylab("Number of Rides") +
              labs(title = "Number of Monthly Rides By Group") +
              scale_color_manual(name = "Groups", values = c(Casual = "blue", Member = "red", Total = "black"))
line_graph
