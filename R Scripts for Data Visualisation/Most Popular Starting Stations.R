library("tidyverse")

monthly_rides <- read_csv("C:/Users/Bing Xuan/Desktop/Stuff/Google Data Analytics Certificate Resources/Case Study/Tables Obtained/Top Starting Stations (Casual).csv")[1:20,]
monthly_rides$start_station_name <- factor(monthly_rides$start_station_name, levels = monthly_rides$start_station_name[order(monthly_rides$number_of_rides_casual)])
bar_chart <- ggplot(data = monthly_rides) +
  geom_bar(stat = "identity", mapping = aes(x = start_station_name, y = number_of_rides_casual), fill = "blue") +
  xlab("Station Name") +
  ylab("Number of Rides") +
  labs(title = "Most Popular Starting Stations (Casual)") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1), axis.text.y = element_text(size = 8)) +
  coord_flip()
bar_chart

monthly_rides <- read_csv("C:/Users/Bing Xuan/Desktop/Stuff/Google Data Analytics Certificate Resources/Case Study/Tables Obtained/Top Starting Stations (Member).csv")[1:20,]
monthly_rides$start_station_name <- factor(monthly_rides$start_station_name, levels = monthly_rides$start_station_name[order(monthly_rides$number_of_rides_member)])
bar_chart <- ggplot(data = monthly_rides) +
  geom_bar(stat = "identity", mapping = aes(x = start_station_name, y = number_of_rides_member), fill = "red") +
  xlab("Station Name") +
  ylab("Number of Rides") +
  labs(title = "Most Popular Starting Stations (Member)") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1), axis.text.y = element_text(size = 8)) +
  coord_flip()
bar_chart
