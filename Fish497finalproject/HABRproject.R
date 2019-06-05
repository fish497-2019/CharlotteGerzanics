#This is my R project on Harmful Algal Blooms 

library(dplyr)
library(ggplot2)
library(tidyr)
install.packages("tmap")
library(tmap)
install.packages("ggmap")
library(ggmap)

#------ upload data------
HAB_data<- read.csv("data/habsos_20190211.csv")
print(HAB_data)


#-----plots------
#this creates a scatterplot of sample depth and cell count
ggplot(HAB_data, aes(x=sample_depth, y=cellcount)) + 
  geom_point(size=3, color = "blue", alpha = 0.5)

#this creates a scatterplot of salinity and cellcount 
ggplot(HAB_data, aes(x=salinity, y=cellcount)) + #create plot of sample date and salinity
  geom_point(size=3, color = "blue", alpha = 0.5) +
  labs(x = "salinity (ppt)", y = "cell count")

#----mutatations----
head(HAB_data)
HAB_datamutated <- 
  HAB_data%>% mutate(water_temp_qa = NULL)+ 
  HAB_data%>% mutate(wind_dir_qa = NULL)+
  HAB_datamutated%>%separate(sample_date, into = c("year", "month", "day"), sep = "-") #this one uses the tidyr package


#-----map-----

#this gives me a scatter plot with dots but it isnt a map
ggplot(HAB_data, aes(x= latitude, y = longitude))+
  geom_point(color='darkblue')


#----these give me errors----
#tmap_mode("plot")
#tm_shape(HAB_data)+
  #tm_symbols(col= "red", scale = .5)

#ggmap::register_google(key = "CHAR")
#map<-get_map(location = c(lon= - 88.06, lat = 26.78), 
        #zoom = "auto", scale = "auto", maptype = c("terrain"), source = "google")


#floridamap = ggmap(get_googlemap(center = c(lon = - 88.06, lat = 26.78), maptype = "terrain")) + 
  #geom_point(aes(x = Longitude, y = Latitude,  colour = Initial.Type.Group, data = HAB_data, size = 0.5))





