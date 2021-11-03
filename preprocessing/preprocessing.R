#get data, please put in your own directory
getwd()
setwd("D:/DDSE project/data/")
getwd()
dataset = read.csv("Google-Playstore.csv", na.strings = c("", "NA"), header=TRUE)

#removing the missing data
clean_dataset <- na.omit(dataset)

#removing the duplicates
clean_dataset <- clean_dataset[!duplicated(clean_dataset), ]

#saving the data, please put in your own directory
write.csv(clean_dataset, file="D:/DDSE project/data/clean_dataset.csv")
saveRDS(clean_dataset, file="D:/DDSE project/data/clean_dataset_rds.rds")

#feature selection, free, high rated apps
free_high_rated <- clean_dataset[(clean_dataset$Free == "True" ) & (clean_dataset$Rating >= 4) & (as.integer(clean_dataset$Installs) >= 10), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Price", "Currency", "Scraped.Time")
free_high_rated <- free_high_rated[ , !(names(free_high_rated) %in% drops) ]

#feature selection, paid, high rated apps
paid_high_rated <- clean_dataset[(clean_dataset$Free == "False" ) & (clean_dataset$Rating >= 4) & (as.integer(clean_dataset$Installs) >= 10), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Free", "Scraped.Time")
paid_high_rated <- paid_high_rated[ , !(names(paid_high_rated) %in% drops) ]

#outliers

###rating: 0
free_outliers_rating <- boxplot.stats(free_high_rated$Rating)$out
length(free_outliers_rating)

paid_outliers_rating <- boxplot.stats(paid_high_rated$Rating)$out
length(paid_outliers_rating)

###rating count
free_outliers_ratingcount <- boxplot.stats(free_high_rated$Rating.Count)$out
length(free_outliers_ratingcount)

paid_outliers_ratingcount <- boxplot.stats(paid_high_rated$Rating.Count)$out
length(paid_outliers_ratingcount)

###price
outliers_price <- boxplot.stats(paid_high_rated$Price)$out
length(outliers_price)

###min android
free_outliers_minandroid <- boxplot.stats(as.integer(free_high_rated$Minimum.Android))$out
length(free_outliers_minandroid)

paid_outliers_minandroid <- boxplot.stats(as.integer(paid_high_rated$Minimum.Android))$out
length(paid_outliers_minandroid)

no_outiers_free_high_rated <- free_high_rated[!(free_high_rated$Rating %in% c(free_outliers_rating) | 
                                                  free_high_rated$Rating.Count %in% c(free_outliers_ratingcount) |
                                                  as.integer(free_high_rated$Minimum.Android) %in% c(free_outliers_minandroid)), ]
nrow(free_high_rated)
nrow(no_outiers_free_high_rated)

#no outliers
no_outiers_paid_high_rated <- paid_high_rated[!(paid_high_rated$Rating %in% c(paid_outliers_rating) | 
                                                  paid_high_rated$Rating.Count %in% c(paid_outliers_ratingcount) |
                                                  as.integer(paid_high_rated$Minimum.Android) %in% c(paid_outliers_minandroid)), ]
nrow(paid_high_rated)
nrow(no_outiers_paid_high_rated)


##installs, removing the + and , sign
#free_high_rated
installs1 <- which(colnames(free_high_rated)=="Installs")
free_high_rated$Installs <- as.character(free_high_rated$Installs)
for(i in 1:nrow(free_high_rated)){
  free_high_rated[i,installs1] <- as.factor(substr(free_high_rated[i,installs1], 1, nchar(as.character(free_high_rated[i,installs1]))-1))
  free_high_rated[i, installs1] <- as.numeric(gsub("\\,", "", free_high_rated[i, installs1]))  
}
free_high_rated$Installs <- as.factor(free_high_rated$Installs)

#no_outiers_free_high_rated
installs2 <- which(colnames(no_outiers_free_high_rated)=="Installs")
no_outiers_free_high_rated$Installs <- as.character(no_outiers_free_high_rated$Installs)
for(i in 1:nrow(no_outiers_free_high_rated)){
  no_outiers_free_high_rated[i,installs2] <- as.factor(substr(no_outiers_free_high_rated[i,installs2]
                                                              , 1, nchar(as.character(no_outiers_free_high_rated[i,installs2]))-1))
  no_outiers_free_high_rated[i, installs2] <- as.numeric(gsub("\\,", "", no_outiers_free_high_rated[i, installs2]))  
}
no_outiers_free_high_rated$Installs <- as.factor(no_outiers_free_high_rated$Installs)

#paid_high_rated
installs3 <- which(colnames(paid_high_rated)=="Installs")
paid_high_rated$Installs <- as.character(paid_high_rated$Installs)
for(i in 1:nrow(paid_high_rated)){
  paid_high_rated[i,installs3] <- as.factor(substr(paid_high_rated[i,installs3], 1, nchar(as.character(paid_high_rated[i,installs3]))-1))
  
  paid_high_rated[i, installs3] <- as.numeric(gsub("\\,", "", paid_high_rated[i, installs3]))  
}
paid_high_rated$Installs <- as.factor(paid_high_rated$Installs)

#no_outiers_paid_high_rated
installs4 <- which(colnames(no_outiers_paid_high_rated)=="Installs")
no_outiers_paid_high_rated$Installs <- as.character(no_outiers_paid_high_rated$Installs)
for(i in 1:nrow(no_outiers_paid_high_rated)){
  no_outiers_paid_high_rated[i,installs4] <- substr(no_outiers_paid_high_rated[i,installs4]
                                                              , 1, nchar(as.character(no_outiers_paid_high_rated[i,installs4]))-1)
  no_outiers_paid_high_rated[i, installs4] <- as.numeric(gsub("\\,", "", no_outiers_paid_high_rated[i, installs4]))  
}
no_outiers_paid_high_rated$Installs <- as.factor(no_outiers_paid_high_rated$Installs)

#saving them
write.csv(free_high_rated, file="D:/DDSE project/data/free_high_rated.csv")
saveRDS(free_high_rated, file="D:/DDSE project/data/free_high_rated.rds")

write.csv(no_outiers_free_high_rated, file="D:/DDSE project/data/no_outiers_free_high_rated.csv")
saveRDS(no_outiers_free_high_rated, file="D:/DDSE project/data/no_outiers_free_high_rated.rds")

write.csv(no_outiers_paid_high_rated, file="D:/DDSE project/data/no_outiers_paid_high_rated.csv")
saveRDS(no_outiers_paid_high_rated, file="D:/DDSE project/data/no_outiers_paid_high_rated.rds")
