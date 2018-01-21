#Create start and end dates from date and duration column


dat <- read.table(text="        ID  Date Duration
407 2006-06-01       1
                  408 2006-06-02       1
                  409 2006-06-03       2
                  410 2006-06-04       3
                  411 2006-06-05       1
                  411 2006-06-06       2
                  413 2006-06-07       1
                  414 2006-06-08       4
                  415 2006-06-09       1", header=T)

library(dplyr)
library(lubridate)

dat$Date <- as.Date(dat$Date)

dat2 <- dat %>%
  filter(Duration <=3) %>% 
  group_by(ID, Date) %>% 
  mutate(Start_Date = Date) %>%
  mutate(End_Date = if_else(Duration==1, Date, Date + Duration))

