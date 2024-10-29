getwd()
setwd("/Users/dennisgoldstein/Documents/BASC0056/Project")

# Boxplots for Job_Density
boxplot(full_data2012$Job_Density, 
        main = "Box Plot for Job Density (Full Dataset)", 
        ylab = "Median Rent Price", 
        col = "lightblue")  

filtered_data <- full_data2012[-c(7),]
boxplot(filtered_data$Job_Density, 
        main = "Box Plot for Job Density (ex-City of London)", 
        ylab = "Median Rent Price", 
        col = "lightblue")    

rownames(filtered_data) <- NULL
View(filtered_data)
filtered_data2 <- filtered_data[-c(32),]
View(filtered_data2)
boxplot(filtered_data2$Job_Density, 
        main = "Box Plot for Job Density (ex-City of London and Westminster)", 
        ylab = "Median Rent Price", 
        col = "lightblue")  

# calculating Z-Scores for outliers
mean_job_density <- mean(full_data2012$Job_Density, na.rm = TRUE)
sd_job_density <- sd(full_data2012$Job_Density, na.rm = TRUE)
print(mean_job_density)
print(sd_job_density)
city_of_london_job_density <- 92.41
z_score_city_of_london <- (city_of_london_job_density - mean_job_density) / sd_job_density
print(z_score_city_of_london)

camden_job_density <- 2.12
westminster_job_density <- 4.26
z_score_westminster <- (westminster_job_density - mean_job_density) / sd_job_density
print(z_score_westminster)
z_score_camden <- (camden_job_density - mean_job_density) / sd_job_density
print(z_score_camden)

# ex city of London
mean_job_density_ex_city <- mean(filtered_data$Job_Density, na.rm = TRUE)
sd_job_density_ex_city <- sd(filtered_data$Job_Density, na.rm = TRUE)
print(mean_job_density_ex_city)
print(sd_job_density_ex_city)

z_score_westminster2 <- (westminster_job_density - mean_job_density_ex_city) / sd_job_density_ex_city
print(z_score_westminster2)
z_score_camden2 <- (camden_job_density - mean_job_density_ex_city) / sd_job_density_ex_city
print(z_score_camden2)

View(filtered_data2)

# ex city of london and Westminster
mean_job_density_ex_city_westminster <- mean(filtered_data2$Job_Density, na.rm = TRUE)
sd_job_density_ex_city_westminster <- sd(filtered_data2$Job_Density, na.rm = TRUE)

print(mean_job_density_ex_city_westminster)
print(sd_job_density_ex_city_westminster)

zscore_camden3 <- (camden_job_density - mean_job_density_ex_city_westminster)/sd_job_density_ex_city_westminster
print(zscore_camden3)

filtered_data3 <- filtered_data2[-c(6),]
View(filtered_data3)


# boxplot ex-outliers
boxplot(filtered_data3$Job_Density, 
        main = "Box Plot for Job Density (ex-outliers)", 
        ylab = "Median Rent Price", 
        col = "lightblue")  
hillingdon_job_density <- 1.15
islington_job_density <- 1.30
kensignton_and_chelsea <- 1.28 
southwark <- 1.25
mean_job_density_ex_outliers <- mean(filtered_data3$Job_Density, na.rm = TRUE)
sd_job_density_ex_outliers <- sd(filtered_data3$Job_Density, na.rm = TRUE)
print(mean_job_density_ex_outliers)
print(sd_job_density_ex_outliers)
zscore_hillingdon <- (hillingdon_job_density - mean_job_density_ex_outliers)/sd_job_density_ex_outliers
zscore_islington <- (islington_job_density - mean_job_density_ex_outliers)/sd_job_density_ex_outliers
zscore_kensignton_and_chelsea <- (kensignton_and_chelsea - mean_job_density_ex_outliers)/sd_job_density_ex_outliers
zscore_southwark <- (southwark - mean_job_density_ex_outliers)/sd_job_density_ex_outliers


#outlier analysis for median monthly rent
full_data2012 <- read.csv('fulldata_2012.csv')
View(full_data2012)
full_data2012$MonthlyRent_Median <- as.numeric(gsub(",", "", full_data2012$MonthlyRent_Median))

# Boxplots for MonthlyRent_Median
boxplot(full_data2012$MonthlyRent_Median, 
        main = "Box Plot for Median Monthly Rent (Full Dataset)", 
        ylab = "Median Rent Price", 
        col = "lightblue")  

filtered_data4<-full_data2012[-c(33,20),]
View(filtered_data4)
boxplot(filtered_data3$MonthlyRent_Median, 
        main = "Box Plot for Median Monthly Rent (ex-outliers)", 
        ylab = "Median Rent Price", 
        col = "lightblue")  

# z-scored median monthly rent
mean_MonthlyRent_Median <- mean(full_data2012$MonthlyRent_Median, na.rm = TRUE)
sd_MonthlyRent_Median <- sd(full_data2012$MonthlyRent_Median, na.rm = TRUE)
print(mean_MonthlyRent_Median)
print(sd_MonthlyRent_Median)
westminster_MonthlyRent_Median <-1907
kensignton_and_chelsea_MonthlyRent_Median <- 2167
z_score_westminster3 <- (westminster_MonthlyRent_Median - mean_MonthlyRent_Median) / sd_MonthlyRent_Median
print(z_score_westminster3)
z_score_kensignton_and_chelsea <- (kensignton_and_chelsea_MonthlyRent_Median - mean_MonthlyRent_Median) / sd_MonthlyRent_Median
print(z_score_kensignton_and_chelsea)
