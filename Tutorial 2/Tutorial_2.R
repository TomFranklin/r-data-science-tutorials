# 15/03/2017
# Tutorial 2 - Univeristy Place, 3.213

####
# Psuedocode ----
# 1. Load libraries and titanic data
# 2. Clean data 
# 3. Generated new data / recoding data / distinct data
# 4. Summarise data with crosstabulations
# 5. Introduction to mapping

#### 
# 1. Load libraries and titanic data ----

library (titanic) # load libraries
library (skimr)
library (dplyr)

raw_data <- titanic_train # taking data from the titanic package and defining it as `raw_data`
                          # in the global environment

#### 
# 2. Clean data ----

raw_data$Pclass <- as.factor (raw_data$Pclass)

raw_data$Embarked <- as.factor (raw_data$Embarked)

raw_data$Sex <- as.factor (raw_data$Sex)

####
# 3. Generated new data / recoding data / distinct data ----

# i. Generating new variables 

raw_data %>%
  mutate (Fare_Dollars = Fare * 1.37) -> data_with_dollar_info # assuming £1 = $1.37 E/R

raw_data %>%
  mutate (Birth_Year_Estimate = round (1912 - Age)) -> date_birth_estimate

# Conditional new variable generating 

mean(raw_data$Age, na.rm = TRUE)

raw_data %>%
  mutate (Above_Average_Wage = ifelse(Age > 29.69912, 1, 0)) -> age_dummy_data

raw_data %>%
  group_by (Pclass) %>%
  summarise(median(Fare))

raw_data %>%
  mutate (Fare_All = ifelse(Fare == 0 & Pclass == 1, 60,
                     ifelse(Fare == 0 & Pclass == 2, 14,
                     ifelse(Fare == 0 & Pclass == 3, 8, Fare)))) -> fare_data_full

# ii. Recoding data

raw_data %>%
  mutate (Pclass = recode (Pclass, `1` = "1st Class",
                                   `2` = "2nd Class",
                                   `3` = "3rd Class")) -> recoded_data

# iii. Distinct data

raw_data %>%
  distinct (Embarked)

####
# 4. Summarise data with crosstabulations ----

table (raw_data$Sex)

table (raw_data$Sex, raw_data$Survived)

table_1 <- table (raw_data$Sex, raw_data$Survived)
 
prop.table (table_1)

prop.table (table_1, 1)

prop.table (table_1, 2)

colSums (table_1)

rowSums (table_1)

summary (table_1)

ftable(raw_data$Pclass, raw_data$Sex, raw_data$Survived)

####
# 5. Introduction to mapping ----

# install leaflet if needed
# install.packages ("leaflet")

library (leaflet)

map_uom_library <- leaflet () %>%
  addTiles () %>%
  addMarkers (lat = 53.464455, lng = -2.235348, popup = "Univeristy of Manchester Main Library")

map_uom_library # print map

map_titanic_wreck <- leaflet () %>%
  setView (lat = 41.7666636, lng = -50.2333324, zoom = 02) %>%
  addProviderTiles (providers$CartoDB.Positron) %>%
  addMarkers(lat = 41.7666636, lng = -50.2333324, popup = "RMS Titanic")

map_titanic_wreck
