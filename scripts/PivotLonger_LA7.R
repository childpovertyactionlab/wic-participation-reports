library(tidyverse)
library(rio)

#### Changing to Tall Format ####
wic_localagency <- import("data/LA7 Monthly Clinic Participation Report Wide.csv") %>%
  janitor::clean_names(.) %>%
  pivot_longer(!(site:site_name), names_to = "date", values_to = "participation") %>%
  mutate(date = str_remove(date, "x"),
         date = as.Date(paste0(date, "_01"), format = "%y_%b_%d"))

export(wic_localagency, "data/LA7 Monthly Clinic Participation Report Long.csv")
export(wic_localagency, "C:/Users/micha/CPAL Dropbox/Basic Needs/02_Data/LA 7 Monthly Clinic Participation Reports/LA7 Monthly Clinic Participation Report Long.csv")
str(wic_localagency)
names(wic_localagency)
