getwd()
install.packages("tidyverse")
install.packages("lubridate")
#Limit the dataframe
head(StormEvents,6)
myvars <-c("BEGIN_DATE_TIME","END_DATE_TIME","EPISODE_ID","EVENT_ID","STATE","STATE_FIPS","CZ_NAME","CZ_TYPE","CZ_FIPS","EVENT_TYPE","SOURCE","BEGIN_LAT","BEGIN_LON","END_LAT","END_LON")
newdata <-  StormEvents[myvars] 
head(newdata,6)

library(lubridate)
library(tidyverse)
newstorms <- mutate(.data = newdata, BEGIN_DATE_TIME = dmy_hms(BEGIN_DATE_TIME), END_DATE_TIME = dmy_hms(END_DATE_TIME))
str_to_title("STATE")
str_to_title("CZ_NAME")
str_pad(newdata$STATE_FIPS, width=3, side = "left", pad = "0")
rename_all(newdata, tolower)
data("state")
us_state_info<-data.frame(state=state.name, region=state.region, area=state.area)
Newset<-data.frame(table(us_state_info$state)) head(Newset)
newset1<-rename(newset, c("state"="Var1"))
merged<-merge(x=newset1,y=us_state_info,by.x="state",by.y="state") head(merged)
newdatasetname<-(mutate_all(df,toupper))

merged<-merge(x=newset1,y=us_state_info,by.x="state",by.y="state") View(merged) head(merged)

library(ggplot2)
storm_plot <- ggplot(state_storms, aes(x = area, y = n)) +
  geom_point(aes(color = region)) + 
  labs(x = "Land area (square miles)",
       y = "# of storm events in 1991") 
storm_plot

                   
                   






