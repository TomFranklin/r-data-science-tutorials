# 08/03/2017
# Tutorial 1 - Univeristy Place, 3.213

####
# Psuedocode ----
# 1. Load libraries and titanic data
# 2. View data and high level summary 
# 3. Data frames and variable classes 
# 4. Introduction to dplyr

#### 
# 1.Load libraries and titanic data ----

#install.packages("titanic") # pg. 9 install
#install.packages("skimr") # pg. 12 install
#install.packages("dplyr") # pg.16 install

library(titanic) # load libraries
library(skimr)
library(dplyr)

raw_data <- titanic_train # taking data from the titanic package and defining it as `raw_data`
                          # in the global environment

####
# 2. View data and high level summary ----

View(raw_data) # look at our dataframe 

skim(raw_data) # summary statistics of data as loaded directly

#### 
# 3. Data frames and variable classes ----

class(raw_data$Fare)

# Changing the class of a variable to a factor (categorical variable)

raw_data$Pclass <- as.factor (raw_data$Pclass)
class (raw_data$Pclass)

#### 
# 4. Introduction to dplyr ----

# Selecting data 

raw_data %>%
  select(Survived, Name) -> selected_data

# Remaning variables data

raw_data %>%
  rename(Gender = Sex) -> renamed_variable_in_data
  
# Arranging data

raw_data %>%
  arrange(desc(Fare)) -> highest_fare_top_data

raw_data %>%
  arrange(Fare) -> lowest_fare_top_data
