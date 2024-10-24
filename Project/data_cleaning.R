install.packages('tidyverse')
library(tidyverse)
getwd()
setwd("/Users/dennisgoldstein/Documents/BASC0056/Project")
getwd()

avg_rent <-read.csv("voa-average-rent-borough.csv") 
job_density <-read.csv("jobs-and-job-density.csv")

#removing NA's 
avg_rent_clean <- na.omit(avg_rent) 
job_density_clean <- na.omit(job_density)

# cleaning average rent data 
avg_rent_clean <- avg_rent_clean[,c('X','X.1','X12.months.to.Q4.2012','X.26','X.28')]
colnames(avg_rent_clean)<-c("Area_Code","Area","Count_of_Rents","Mean","Median")
view(avg_rent_clean)
avg_rent_cleaned <- avg_rent_clean[-c(1,2, 3), ]
rownames(avg_rent_cleaned) <- NULL
avg_rent_cleaned <-  avg_rent_cleaned[-c(34:51),]
view(avg_rent_cleaned)
view(avg_rent_cleaned)

# cleaning job density data
view(job_density_clean)
job_density_clean <- job_density_clean[,c('Code','Area','X2012')]
colnames(job_density_clean)<-c("Code","Area","2012")
rownames(job_density_clean) <- NULL
job_density_cleaned <- job_density_clean[-c(34:53),]
view(job_density_cleaned)

#merging and renaming data 
full_data <- merge(job_density_cleaned,avg_rent_cleaned, by="Area")
view(full_data)
full_data <- full_data[,-c(4)]
view(full_data)
colnames(full_data)<-c("Area","Code","Job_Density","Count_of_Rents","MonthlyRent_Mean","MonthlyRent_Median")
view(full_data)
full_data2012 <- full_data
view(full_data2012)

#export csv file
write.csv(full_data2012,file="fulldata_2012.csv")
