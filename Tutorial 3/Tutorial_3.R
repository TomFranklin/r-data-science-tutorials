# 22/03/2017
# Tutorial 3 - Roscoe 3.3 

####
# Psuedocode ----
# 1. Load libraries and titanic data
# 2. Clean data 
# 3. Graphics

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

raw_data$Survived <- as.factor (raw_data$Survived)

####
# 3. Graphics

# install.packages ("ggplot2")
library (ggplot2)

skim (raw_data)

ggplot (data = raw_data, aes(x = Pclass)) + 
  geom_bar ()

ggplot (data = raw_data, aes(x = Pclass)) + 
  geom_bar (aes(fill = Survived))

ggplot (data = raw_data, aes(x = Pclass)) + 
  geom_bar (aes(fill = Survived), position = "fill")


#install.packages ("RColorBrewer")
library (RColorBrewer)

ggplot (data = raw_data, aes(x = Pclass)) + 
  geom_bar (aes(fill = Survived), position = "fill") + 
  theme_economist () + 
  scale_fill_brewer (palette = 6)


ggplot (data = raw_data, aes(x = Age, y = Fare)) + 
  geom_point ()


plot_1 <- ggplot (data = raw_data, aes(x = Age, y = Fare, colour = Pclass)) + 
  geom_point (size = 3) + 
  scale_color_manual (values = c("red", "blue", "orange")) + 
  theme_minimal ()

#install.package ("plotly")
library (plotly)

ggplotly (plot_1)


