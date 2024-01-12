# Cyclistic: Converting Casual Riders into Annual Members to Boost Profits

## Introduction

### Details on Bike-Share Company

In this case study, I play the role of a junior data analyst working for **Cyclistic**, a bike-share company with a fleet of 5824 bicycles and a network of 692 stations across the city of Chicago, Illinois.

Cyclistic offers three forms of services: 

* Single-ride passes
* Full-day passes
* Annual memberships

It has been shown that casual riders (customers who purchase either single-ride passes or full-day passes) are **less profitable** than annual members.

### Our Goal

To boost profits, we must therefore maximise the number of annual members. Instead of zeroing in on new customers and encouraging them to take up annual memberships, it has been proposed that we focus on **converting existing casual riders to annual members**. As part of this aim, our first objective is to investigate how annual members and casual riders use Cyclistic bikes differently. This goal forms the basis of the case study.

On this note, the statement for our business task is as follows: **Analyse the previous 12 months of Cyclistic trip data to identify the difference in consumer behaviour between casual riders and annual members**. This would allow us to gain a better understanding of the profiles of the two consumer groups. From there, we can craft more targeted marketing methods to entice casual riders to switch to annual memberships.

### Key Stakeholders

* **Cyclistic Marketing Analytics Team**: The Data Analytics team that I am a part of
* **Director of Marketing / Manager**: Person whom I am to report to most frequently
* **Cyclistic Executive Team**: Decides whether or not to implement the marketing program suggested by the Analytics Team

## Acquisition of Data

### Introduction to the Data

I obtained the previous 12 months of Cyclistic trip data (January 2023 to December 2023), which comes in the form of 12 CSV files, one for each month. Note that the data is public, originating from Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).

After downloading and extracting all the relevant zip files, I stored all the resultant folders in a new folder named "2023_cyclistic_trip_data". I also ensured that backups of each original dataset were created and safely kept.

### Composition of Data

For each CSV file, each row corresponded to a given bicycle ride in that month. The file consisted of 13 rows describing each ride as follows:

* **ride_id**: Unique to each ride
* **rideable_type**: Type of bike used in the ride - "electric_bike", "docked_bike" or "classic_bike"
* **started_at**: Date and time of the start of the ride
* **ended_at**: Date and time of the end of the ride
* **start_station_name**: Name of starting station for the ride
* **start_station_id**: ID of starting station for the ride
* **end_station_name**: Name of ending station for the ride
* **end_station_id**: ID of ending station for the ride
* **start_lat**: Starting latitude for the ride
* **start_lng**: Starting longitude for the ride
* **end_lat**: Ending latitude for the ride
* **end_lng**: Ending longitude for the ride
* **member_casual**: Whether the rider is "casual" or a "member"


### Evaluation of Data's Credibility

The data given appeared to be **credible and from a good data source**:

* **Reliable**: Data was a form of internal data taken from Cyclistic's company records, which were likely to have been vetted regularly
* **Original**: Data was taken from Cyclistic's company records, thus being a primary data source
* **Comprehensive**: Data had information on both casual riders and annual members, and was thus enough for us to analyse the difference in consumer behaviour between the two groups, for our business task
* **Current**: Data was from the last 12 months, thus being sufficiently recent
* **Cited**: Data was created and managed by Cyclistic itself, which is the most reliable organisation for our business task (to boost Cyclistic's profits). Data was also current, as justified above

## Changelog for Data Cleaning

**Date: 10 January 2024**

Data cleaning was conducted using SQL, via Google's BigQuery platform. After being uploaded to BigQuery, all 12 CSV files were stored in a dataset named "cyclistic_data".

For each CSV file, the following steps were taken:

* Note that no duplicate data was found
* The `CAST()` function was used to convert all dates to the `datetime` type. It was also used to ensure that **start_station_id** and **end_station_id** were indeed columns containing strings
* The `TRIM()` function was used to remove any leading and ending whitespace, for every column containing strings
* All rows containing `NULL` values were removed
  + **Limitation**: These partially filled rows may still have some useful data within them, and omitting them completely may negatively affect the accuracy of our results. In a real-life scenario, perhaps it would be wise to first consult with my team and manager, before coming to a decision on what to do with these rows.
* 3 new colums were created:
  + **ride_length_in_mins**: Duration of each given ride in minutes. This was created with the help of the `date_diff()` function
  + **day_of_week**: Day of the week corresponding to the start of the ride, with 1 = Sunday and 7 = Saturday
  + **month**: Month corresponding to the start of the ride, with 1 = January 2023 and 12 = December 2023
* All rows where **ride_length_in_mins** was negative were removed

Subsequently, `UNION ALL` was used to gather all the cleaned data into one table. This table was saved as a CSV file named **Cyclistic Data Cleaned.csv**, which was reuploaded to BigQuery.

**Room for improvement**: For each CSV file, more cleaning should have been done. For instance, I noticed that the number of distinct values in **start_station_name** was very slightly different from the number of distinct values in **start_station_id**, which should not be the case. In addition, the number of distinct values in **start_station_name** was observed to be greater than 692, which was the actual number of stations owned by Cyclistic, as mentioned in the introduction.

## Data Analysis

Using SQL on BigQuery, I sieved out 5 tables (CSV files) which were to be used for data analysis:

* **Number of Rides per Month.csv**: Number of rides throughout each month (January 2023 to December 2023), for both casual riders and annual members
* **Day of Week.csv**: Number of rides on each day of the week (Sunday to Saturday), for both casual riders and annual members
* **Top Starting Stations (Casual).csv**: The most popular starting stations among casual riders, alongside the corresponding number of rides
* **Top Starting Stations (Member).csv**: The most popular starting stations among annual members, alongside the corresponding number of rides
* **Rideable Types.csv**: Proportion of rideable types used, for both casual riders and annual members

Note that **Cyclistic Data Cleaned.csv** was also used for data analysis.

**Room for improvement**: In the next step where I used RStudio to produce data visualisations from the tables, I realised that the formatting of these tables was not as convenient as I would have liked. Hence, I used some spreadsheet techniques to improve the formatting, allowing me to access the data using RStudio more effectively. In hindsight, I now know that the SQL queries which I had written were not as optimal as they could have been. Moving forward, I will look to improve on this aspect in future projects.

## Data Visualisations

The following data visualisations were produced by RStudio.

The line graph below shows the number of rides over the last 12 months, for both casual riders and annual members:

<p align="center">
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/57c11f34-947b-4f13-adef-9e3f3b64c07e">
</p>

**Key Findings**: For the last 12 months, the number of rides has followed a similar trend for both casual riders and annual members, increasing from January 2023 to a maximum at around July / August 2023, before decreasing from July / August 2023 to December 2023. The peak number of rides corresponds to the summer break in Chicago - it may be that more casual riders and annual members choose to ride Cyclistic bikes during that holiday period. The low ridership at both the start and end of the year could be due to the lack of holidays in that period of time, meaning that riders have less time to ride Cyclistic bikes for leisure.

The bar chart below shows the number of rides on each day of the week (1 = Sunday, 7 = Saturday), for both casual riders and annual members:

<p align="center">
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/8abab1c3-519c-4dce-b4f4-a562dfb06279">
</p>

**Key Findings**: In this case, there is a clear difference between the riding patterns among casual riders and annual members. Among casual riders, the number of rides are higher during the weekend, and lower during weekdays. However, among annual members, the number of rides are lower during the weekend, and higher during weekdays. It is possible that casual riders mainly cycle for recreational purposes at the end of the week, while annual members generally use Cyclistic bikes to commute to school or work during the week. This is logical, as riders who cycle more regularly (ie. to school or work) are usually more inclined to commit to Cyclistic, in the form of annual memberships. This insight suggests that casual riders who cycle on a regular basis (ie. during weekdays) are most likely to purchase memberships. While this target group may be relatively smaller, it is still significant.

The bar charts below show the 20 most popular starting stations, among both casual riders and annual members:

<p align="center">
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/ba20479a-9416-4ac7-8a8f-a585e79846b2" width="400" height="250" />
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/fb5a1632-7b0b-4096-add5-ea59cf19a6e7" width="400" height="250" /> 
</p>

**Key Findings**: Note that casual riders most frequently start their rides along Grand Ave, Dusable Lake Shore Drive, Michigan Ave and Clark St. On the other hand, annual members are more likely to begin their rides along Kingsbury St, Clinton St, Wells St and Elm St. This suggests that Cyclistic bike usage is most pronounced in these areas. Despite these differences, there are also some commonalities between the two bar charts. The following are starting stations which are popular among both casual riders and annual members:

| Station Name | Popularity among Casual Riders | Popularity among Annual Members |
| --- | --- | --- |
| Streeter Dr & Grand Ave | 1st | 13th |
| Wells St & Concord Ln | 11th | 4th |
| Clark St & Elm St | 16th | 3rd |
| Wells St & Elm St | 18th | 6th |

The pie charts below show the proportion of rideable types used, for both casual riders and annual members:

<p align="center">
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/f3819125-5361-4a6f-b82e-61cab218a0f4" width="500" />
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/caefd84f-c100-4bf6-8051-22bf225e558c" width="500" /> 
</p>

**Key Findings**: For both casual riders and annual members, classic bikes are the most popular cycling option, followed by electric bikes. The proportion of usage of these two bikes are relatively similar, though it can be argued that members are comparatively more likely to favour classic bikes. A notable detail is that while a small percentage of casual riders use docked bikes, zero annual members choose this mode of cycling, which seems suspicious. In a real-life scenario, I would probably first run these findings through my team and manager, so as to confirm that my analysis is indeed correct.

The density curves below show the distribution of ride length, for both casual riders and annual members:

<p align="center">
  <img src="https://github.com/chiabingxuan/Google-Data-Analytics-Certificate-Case-Study/assets/155958349/bf01c1ff-cc24-4e91-98a9-23f6202d84a4">
</p>

**Key Findings**: The distributions of ride length for both casual riders and annual members peak at ride lengths under 10 minutes and stretch off at longer ride lengths. However, the spread of ride lengths for casual riders is larger than that for annual members. Moreover, the peak density for casual riders is to the right of the peak density for annual members. Hence, ride lengths are generally longer among casual riders, compared to annual members.

## Recommendations

Below are 3 suggestions that can be implemented in Cyclistic's marketing strategy, in order to convert existing casual riders to annual members:

* **Marketing time period**: Since ridership peaks around July / August during the summer break, we should intensify the marketing and advertising process just before this annual boom, during the months of May and June for instance. This reminds casual riders of the availability of Cyclistic's bikes right before a time of relaxation, enticing them to make use of them during the holidays. By boosting Cyclistic's popularity among casual riders in this way, they may be more likely to commit to annual memberships and utilise our services in the long run.
* **Emphasise on the use of Cyclistic bikes during weekdays**: As mentioned, it is imperative that we turn our attention to casual riders who cycle during weekdays, because they are more likely to switch to annual memberships. Therefore, we should tailor our marketing strategy to their interests and needs, focusing on promoting the use of Cyclistic services during weekdays. By raising awareness on how Cyclistic bikes can be integrated seamlessly throughout a rider's week, casual riders in this target group can be more driven to continue riding during weekdays, and may even decide to sustain this habit by taking up long-term annual memberships. Not only that, this may even have an effect on casual riders who had not been cycling much during weekdays prior to our marketing, encouraging them to start doing so. By creating a culture of frequent riding, there is a good chance for casual riders to commit to annual memberships in time to come.
* **Marketing location**: We can ramp up our marketing efforts, such as through posters and billboards, in specific areas. Firstly, we should prioritising promoting our services in regions near stations that are popular among both casual riders and annual members, such as the 4 stations identified in the table above. This has the effect of reaching the widest target audience, encouraging more casual riders to convert to annual members, whilst also retaining a larger number of annual members. Simultaneously, we can also increase advertising in other areas that are popular among casual riders (eg. Grand Ave, Dusable Lake Shore Drive, Michigan Ave and Clark St). This would maximise our outreach, getting in touch with as many existing casual riders as possible.

## Conclusion

Below are a few ideas to note moving forward:

* **Indicators of popularity**: A limitation to this data analysis process is that we related the **number of rides** to popularity of Cyclistic's services. While this was not completely incorrect, the **number of users** is another indicator of popularity that we did not take into account. Since multiple rides can be linked to a single user, perhaps our analysis would have been different, had we considered this new indicator instead. Future data analysis projects could be centered around this matter - collecting more data on the **number of users** may give us a better picture about consumer patterns for both casual riders and annual members.
* **Analysing ending stations**: Moving forward, we can also analyse the most popular **ending stations** among casual riders and annual members. For this case study, I had prioritised analysing the most popular starting stations instead, because those are the areas where users actually **decide** to embark on rides, and are thus more reflective of the popularity of our services. However, as a way to sustain our marketing strategy in the long-term, we could additionally identify the most popular ending stations, boosting our advertising efforts in those regions as well.
* **Future projects to find out why casual members purchase memberships**: More data analysis is needed to confirm and explain several cause-and-effect relationships. In other words, we should subsequently focus on discovering the main reasons why casual users switch to annual memberships. For example, we can investigate whether or not cycling regularly is indeed a major contributing factor to users taking up annual memberships. This can be done via surveys.
* **Future projects to find out how best to use digital media as a method of promotion**: So far, we have honed in on physical advertisements as our main medium of communication with Cyclistic's customers. However, future data analysis can be conducted on the topic of digital advertising. We can investigate the effectiveness and desirability of using digital media for marketing, whilst discovering the best ways to incorporate these elements into our own promotion strategies, in an effort to convince casual riders to convert to annual members.
