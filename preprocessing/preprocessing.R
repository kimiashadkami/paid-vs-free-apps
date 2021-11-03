#get data, please put in your own directory
getwd()
setwd("D:/DDSE project/data/")
getwd()
dataset = read.csv("Google-Playstore.csv", na.strings = c("", "NA"), header=TRUE)

#for later
options(scipen = 999999999)

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

#no outliers
no_outliers_free_high_rated <- free_high_rated[!(free_high_rated$Rating %in% c(free_outliers_rating) | 
                                                  free_high_rated$Rating.Count %in% c(free_outliers_ratingcount) |
                                                  as.integer(free_high_rated$Minimum.Android) %in% c(free_outliers_minandroid)), ]
nrow(free_high_rated)
nrow(no_outliers_free_high_rated)

no_outliers_paid_high_rated <- paid_high_rated[!(paid_high_rated$Rating %in% c(paid_outliers_rating) | 
                                                  paid_high_rated$Rating.Count %in% c(paid_outliers_ratingcount) |
                                                  as.integer(paid_high_rated$Minimum.Android) %in% c(paid_outliers_minandroid)), ]
nrow(paid_high_rated)
nrow(no_outliers_paid_high_rated)

##installs, removing the + and , sign
preprocessing_installs <- function(dt){
  installs <- which(colnames(dt)=="Installs")
  dt$Installs <- as.character(dt$Installs)
  for(i in 1:nrow(dt)){
    dt[i,installs] <- substr(dt[i,installs], 1, nchar(as.character(dt[i,installs]))-1)
  }
  dt$Installs <- as.numeric(gsub("\\,", "", dt$Installs))  
  dt$Installs <- as.factor(dt$Installs)
}

preprocessing_installs(free_high_rated)
preprocessing_installs(paid_high_rated)
preprocessing_installs(no_outliers_free_high_rated)
preprocessing_installs(no_outliers_paid_high_rated)

##size, turning M to 1000000 and K to 1000 and varries with device to -1
preprocessing_size <- function(dt){
  dt <- dt[(dt$Size != "Varies with device"), ]
  #removing commas
  dt$Size <- as.character(gsub("\\,", "", dt$Size))
  size <- which(colnames(dt)=="Size")
  for(i in 1:nrow(dt)){
    last_char <- strsplit(dt[i,size], '')[[1]][nchar(dt[i,size])]
    if(last_char == "M" || last_char =="m"){
      temp <- dt[i,size]
      temp <- as.numeric(substr(temp, 1, nchar(temp)-1))
      dt[i,size] <- temp*1000000
    }
    else if(last_char == "K" || last_char == "k"){
      temp <- dt[i,size]
      temp <- as.numeric(substr(temp, 1, nchar(temp)-1))
      dt[i,size] <- temp*1000
    }
    else if(last_char == "G" || last_char == "g"){
      print("H")
      dt[i, size] <- -1
    }
  }
  dt <- subset(dt, Size!=-1)
  dt$Size <- as.numeric(dt$Size)
  
}

preprocessing_size(free_high_rated)
preprocessing_size(paid_high_rated)
preprocessing_size(no_outliers_free_high_rated)
preprocessing_size(no_outliers_paid_high_rated)



#saving them
write.csv(free_high_rated, file="D:/DDSE project/data/free_high_rated.csv")
saveRDS(free_high_rated, file="D:/DDSE project/data/free_high_rated.rds")

write.csv(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated.csv")
saveRDS(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated.rds")

write.csv(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated.csv")
saveRDS(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated.rds")
