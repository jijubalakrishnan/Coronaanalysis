avg_age <- c(India=28,Italy=45,Germany=45,Usa=37,Spain=41)
avg_age
library(RColorBrewer)
coul <- brewer.pal(5, "Set2") 
barplot(avg_age,col=coul)
cities <-c("Newyork","Madrid","trivandrum","Wuhan","Acra","London","Seoul","Tehran","Dublin","Milan","Nairobi","Singapore","Amsterdam","Reyjavavik","Bangok","Cairo")
uv_index <-c(Newyork=1.4,Madrid=5,trivandrum=11,Wuhan=5,Acra=12,London=3.2,Seoul=4,Tehran=5,Dublin=2.5,Milan=2,Nairobi=13,Singapore=12,Amsterdam=4,Reyjavavik=2,Bangok=12,cairo=6)
# Sixteen cities from the world which are on differnt latitudinal positions are selected. 
# Their latest uv data is provided.The cities are capitals of the region where corona outbreak started in the particular country.
testing_numbers <-c(540252,NA,25254,320000,NA,104866,316664,80000,17992,206886,NA,NA,38000,9189,7084,NA)
corona_numbers <- c(85612,57786,761,81340,136,11658,9332,32332,1819,80589,31,683,7431,802,1136,495)
corona_death <- c(1301,4365,20,3292,0,578,139,2378,19,8215,0,2,434,2,5,24)
number_of_days_500 <- c(22,22,23,NA,NA,26,7,10,19,11,NA,NA,13,20,10,NA)
number_of_days_first_death <- c(15,17,26,NA,14,15,6,1,11,6,0,NA,8,23,21,34)
country <- c("Usa","Spain","India","China","Ghana","UK","Korea","Iran","Ireland","Italy","Kenya","Singapore","Netherlands","Iceland","Thailand","Egypt")
names(uv_index) <- country
corona_data <- data.frame(cities,uv_index,testing_numbers,corona_numbers,corona_death,number_of_days_500,number_of_days_first_death)
pop_density <- c(36,91,420,145,354,274,503,52,72,206,94,8358,488,3,354,84)
corona_data$pop_density <- pop_density
corona_data
case_per_million <- c(259,1370,1,57,4,172,182,385,368,1333,1,117,434,2350,16,5)
corona_data$case_per_million <- case_per_million
corona_data
death_pecentage_closed_cases <- c(41,34,22,4,NA,81,3,18,79,44,NA,1,99,2,6,20)
corona_data$death_pecentage_closed_cases <- death_pecentage_closed_cases
str(corona_data)
#install.packages("ggmap")
#install.packages("ggmap")
#library("ggmap")
#install.packages("maps")
#library("tidyverse")
#library("dplyr")
plot(corona_data$uv_index,corona_data$corona_numbers,col="blue",main="Number of cases  vs uv index",xlab="Uv index",ylab="cases")
install.packages("ggpubr")
library("ggpubr")
cor(uv_index,corona_numbers,method = "kendall", use = "complete.obs")
cor(uv_index,corona_numbers,method = "spearman", use = "complete.obs")
cor(uv_index,corona_numbers,method = "pearson", use = "complete.obs")
my_data <- data.frame(uv_index,corona_numbers)
ggscatter(my_data, x = "uv_index", y = "corona_numbers", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Uv Index", ylab = "Cases",col="red")
write.csv(corona_data,file="coronadata.csv")
# Load ggplot2
library(ggplot2)

# Create data
#percentage_of_death <- death_pecentage_closed_cases
#percentage_of_death[is.na(percentage_of_death)] <- 0
#percentage-of-death <- na.omit(percentage_of_death)
percentage_of_death <-sort(percentage_of_death,decreasing=TRUE)
percentage_of_death
data <- data.frame(country,percentage_of_death
)

# Barplot
ggplot(data, aes(x=country, y=percentage_of_death)) + 
  geom_bar(stat = "identity") +
  coord_flip()