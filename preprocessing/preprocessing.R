#get data, please put in your own directory
getwd()
setwd("D:/DDSE project/data/")
getwd()
dataset = read.csv("Google-Playstore.csv", na.strings = c("", "NA"), header=TRUE)

#session setting
options(stringsAsFactors = FALSE)
options(scipen = 999999999)

#######################cleaning#######################

#removing the missing data
clean_dataset <- na.omit(dataset)

#removing the duplicates
clean_dataset <- clean_dataset[!duplicated(clean_dataset), ]

#saving the data, please put in your own directory
write.csv(clean_dataset, file="D:/DDSE project/data/clean_dataset.csv")
saveRDS(clean_dataset, file="D:/DDSE project/data/clean_dataset_rds.rds")

#feature selection (phase 1), free, high rated apps
free_high_rated <- clean_dataset[(clean_dataset$Free == "True" ) & (clean_dataset$Rating >= 4) & (as.integer(clean_dataset$Installs) >= 10), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Price", "Currency", "Scraped.Time")
free_high_rated <- free_high_rated[ , !(names(free_high_rated) %in% drops) ]

#feature selection (phase 1), paid, high rated apps
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

#dataset with no outliers
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

#######################discretization for SPMF#######################

#category, factor to numeric values

#rating count, numeric values to numeric ranges

##installs, removing the + and , sign
preprocessing_installs <- function(dt_install){
  installs <- which(colnames(dt_install)=="Installs")
  dt_install$Installs <- as.character(dt_install$Installs)
  for(i in 1:nrow(dt_install)){
    dt_install[i,installs] <- substr(dt_install[i,installs], 1, nchar(as.character(dt_install[i,installs]))-1)
  }
  dt_install$Installs <- as.numeric(gsub("\\,", "", dt_install$Installs))  
}

preprocessing_installs(free_high_rated)
preprocessing_installs(paid_high_rated)
preprocessing_installs(no_outliers_free_high_rated)
preprocessing_installs(no_outliers_paid_high_rated)

#price, numeric values to numeric ranges

##size, turning M to 1000000 and K to 1000 and varries with device to -1
preprocessing_size <- function(dt_size){
  dt_size$Size[dt_size$Size == "Varies with device"] <- "-1"
  #removing commas
  dt_size$Size <- as.character(gsub("\\,", "", dt_size$Size))
  size <- which(colnames(dt_size)=="Size")
  for(i in 1:nrow(dt_size)){
    last_char <- strsplit(dt_size[i,size], '')[[1]][nchar(dt_size[i,size])]
    if(last_char == "M" || last_char =="m"){
      temp <- dt_size[i,size]
      temp <- as.numeric(substr(temp, 1, nchar(temp)-1))
      dt_size[i,size] <- temp*1000000
    }
    else if(last_char == "K" || last_char == "k"){
      temp <- dt_size[i,size]
      temp <- as.numeric(substr(temp, 1, nchar(temp)-1))
      dt_size[i,size] <- temp*1000
    }
    else if(last_char == "G" || last_char == "g"){
      dt_size[i, size] <- -2
    }
  }
  dt_size <- subset(dt_size, Size!=-2)
  dt_size$Size <- as.numeric(dt_size$Size)
  
}

preprocessing_size(free_high_rated)
preprocessing_size(paid_high_rated)
preprocessing_size(no_outliers_free_high_rated)
preprocessing_size(no_outliers_paid_high_rated)

##min.android getting the minimum
preprocessing_minandroid <- function(dt_minandroid){
  dt_minandroid$Minimum.Android <- as.character(dt_minandroid$Minimum.Android)
  dt_minandroid$Minimum.Android[dt_minandroid$Minimum.Android == "Varies with device"] <- "-1"
  minandroid <- which(colnames(dt_minandroid) == "Minimum.Android")
  for(i in 1:nrow(dt_minandroid)){
    if(dt_minandroid[i,minandroid] != "-1"){
      first_char <- strsplit(dt_minandroid[i,minandroid], '')[[1]][1]
      dt_minandroid[i,minandroid] <- first_char
      print(dt_minandroid[i, minandroid])
    }
  }
  dt_minandroid$Minimum.Android <- as.numeric(dt_minandroid$Minimum.Android)
}

preprocessing_minandroid(free_high_rated)
preprocessing_minandroid(paid_high_rated)
preprocessing_minandroid(no_outliers_free_high_rated)
preprocessing_minandroid(no_outliers_paid_high_rated)

#release, date to quarters to numeric values

#last.update, date to quarters to numeric values

#content.rating, factor levels to numeric values

#ad-support, boolean to numeric

#in-app purchases, boolean to numeric

#editor choice, boolean to numeric

#######################saving datasets#######################

write.csv(free_high_rated, file="D:/DDSE project/data/free_high_rated.csv")
saveRDS(free_high_rated, file="D:/DDSE project/data/free_high_rated.rds")

write.csv(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated.csv")
saveRDS(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated.rds")

write.csv(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated.csv")
saveRDS(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated.rds")
