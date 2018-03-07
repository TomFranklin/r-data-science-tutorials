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

install.packages("titanic") # pg. 9 install
install.packages("skimr") # pg. 12 install
install.packages("dplyr") # pg.16 install

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

