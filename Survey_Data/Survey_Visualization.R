install.packages("ggplot2")
library(ggplot2)
library(dplyr)
surveys <- read.csv("C:/R program/surveys_complete.csv")
View(surveys)
str(surveys)

# Plot1
ggplot(surveys,aes(x=species_id, y =weight))+
  geom_boxplot(aes(color = species_id))+
  labs(title = "Distribution of weight w.r.t Species", x="Species",y="Weights")+
  facet_wrap(~species_id)+
  theme_bw()

# Plot2
ggplot(surveys,aes(x=hindfoot_length, y =species_id))+
  geom_boxplot(aes(color = species_id))+
  labs(title = "Distribution of weight w.r.t Species", x="Hindfoot_length",y="Weights")+
  theme_classic()

# yearly trend of total observation 
# Trend analysis
yearly_count<-aggregate(record_id ~ year , data= surveys, FUN=function(x)(length(x)))
yearly_count
ggplot(yearly_count,aes(x=year,y=record_id))+
  geom_line()+
  labs(title = "Trend analysis year wise", x="Year",y="Record_id")+
  theme_bw()

# Plot4
ggplot(surveys,aes(x=as.factor(plot_id),fill=as.factor(plot_id)))+
  geom_bar()

# Gender wise distribution w.r.t each species
ggplot(surveys,aes(x=species_id,fill=sex))+
  geom_bar(position="stack")

# Distribution of weight with respect to hindfoot_length #x with respect to y
ggplot(surveys,aes(x=weight,y=hindfoot_length))+
  geom_point(stat="identity",aes(color=species_id))

# Distribution of weight with respect to each species
ggplot(surveys,aes(x=weight, y =species_id))+
  geom_boxplot(aes(color = species_id))





