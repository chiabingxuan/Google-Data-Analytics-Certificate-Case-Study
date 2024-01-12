library("tidyverse")

monthly_rides <- read_csv("C:/Users/Bing Xuan/Desktop/Stuff/Google Data Analytics Certificate Resources/Case Study/Tables Obtained/Rideable Types.csv")
pie_chart <- ggplot(data = monthly_rides) +
  geom_bar(mapping = aes(x = "", y = casual_percentage, fill = rideable_type), stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  labs(title = "Proportion of Rideable Types (Casual)") +
  theme_void()
pie_chart

pie_chart <- ggplot(data = monthly_rides) +
  geom_bar(mapping = aes(x = "", y = member_percentage, fill = rideable_type), stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  labs(title = "Proportion of Rideable Types (Member)") +
  theme_void()
pie_chart
