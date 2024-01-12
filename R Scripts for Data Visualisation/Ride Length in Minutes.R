library("tidyverse")

monthly_rides <- read_csv("C:/Users/Bing Xuan/Desktop/Stuff/Google Data Analytics Certificate Resources/Case Study/Tables Obtained/Cyclistic Data Cleaned.csv")
histogram <- ggplot(data = monthly_rides) +
             geom_density(mapping = aes(x = ride_length_in_mins, color = member_casual), linewidth = 1, adjust = 2) +
             scale_x_continuous(breaks = seq(0, 100, by = 20), limits = c(0, 100)) +
             scale_color_manual(name = "Groups", values = c("casual" = "blue", "member" = "red")) +
             xlab("Ride Length / min") +
             labs(title = "Distribution of Ride Length")
histogram
