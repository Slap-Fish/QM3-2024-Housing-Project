full_data2012 <- read.csv('fulldata_2012') 
library(HistData)
library(tidyverse)
View(full_data2012)
full_data2012$MonthlyRent_Median <- as.numeric(gsub(",", "", full_data2012$MonthlyRent_Median))
model <- lm(MonthlyRent_Median~Job_Density,data=full_data2012)
install.packages('stargazer')
library(stargazer)
stargazer(model, type = "text", 
          title ="Table 1: An OLS model of Job Density on Median Monthly Rent in London Boroughs", 
          dep.var.labels = "Median Monthly Rent", 
          covariate.labels = "Job Density", 
          out = "Table2_OLS_JobDensity.txt")
fulldata_exoutliers <- subset(full_data2012, !Area %in% c("City of London", "Westminster","Camden"))
View(fulldata_exoutliers)
model2 <- lm(MonthlyRent_Median~Job_Density,data=fulldata_exoutliers)
stargazer(model2, type = "text", 
          title ="Table 2: An OLS model of Job Density on Median Monthly Rent in London Boroughs (ex-outliers)", 
          dep.var.labels = "Median Monthly Rent", 
          covariate.labels = "Job Density", 
          out = "Table4_OLS_JobDensity.txt")

par(mfrow=c(1,2))
plot(model2)
plot(model2, which =1)
mean(model2$residuals)
plot(model2, which =1)
