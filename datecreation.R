#Create start and end dates from date and duration column


dat <- read.table(text="        ID  Date Duration
407 2006-06-01       1
                  408 2006-06-02       1
                  408 2006-06-03       2
                  409 2006-06-04       1
                  409 2006-06-05       2
                  410 2006-06-06       1
                  413 2006-06-07       1
                  413 2006-06-08       2
                  413 2006-06-09       3", header=T)

library(dplyr)
library(lubridate)
library(anytime)

dat$Date <- as.Date(dat$Date)

dat %>%
  group_by(ID) %>%
  summarize(MaxDuration = max(Duration),
            StartDate = min(Date),
            EndDate = if_else(MaxDuration== 1, anydate(StartDate), anydate(StartDate + MaxDuration)))

