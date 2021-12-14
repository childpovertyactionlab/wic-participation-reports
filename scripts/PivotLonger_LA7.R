library(tidyverse)
library(rio)

#### Changing to Tall Format ####
wic_localagency <- import("data/LA7_ParticipationReport.csv") %>%
  janitor::clean_names(.) %>%
  pivot_longer(!(site:site_name), names_to = "date", values_to = "participation") %>%
  mutate(date = lubridate::mdy(date))

export(wic_localagency, "data/LA7_ParticipationReport_Long.csv")

str(wic_localagency)
?pivot_longer
names(wic_localagency)
