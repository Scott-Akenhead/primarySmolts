# Dec 1 2022
# Braden Judson


# Wenatchee - filling in missing smolt data.


setwd("~/wenatchee/data_report")

library(dplyr)

smolts <- read.csv("smolts.csv") 

(ests <- smolts %>% 
  filter(!is.na(Age.1)) %>% 
  filter(Smolt.migration.year. != "1997") %>% 
  mutate(Age1toAge2 = Age.2/lag(Age.1),
         Age2toAge3 = Age.3/lag(Age.1)))

mean(ests$Age1toAge2, na.rm = T)  # 0.15313
sd(ests$Age1toAge2, na.rm = T)    # 0.19700 (128.5% of mean)
mean(ests$Age2toAge3, na.rm = T)  # 0.00074
sd(ests$Age2toAge3, na.rm = T)    # 0.00260 (>3500% of mean!)

# Estimate for 2012.

smolts[smolts$Smolt.migration.year. == "2011", c("Age.1")] * 0.15313
smolts[smolts$Smolt.migration.year. == "2011", c("Age.1")] * 0.19700

# Age-1 smolts in 2012: 180628 +/- 232376.1.

smolts[smolts$Smolt.migration.year. == "2011", c("Age.1")] * 0.00074
smolts[smolts$Smolt.migration.year. == "2011", c("Age.1")] * 0.00260

# Age-2 smolts in 2012: 873 +/- 3067.

