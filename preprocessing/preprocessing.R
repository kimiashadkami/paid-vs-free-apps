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

#######################saving datasets#######################

write.csv(free_high_rated, file="D:/DDSE project/data/free_high_rated.csv")
saveRDS(free_high_rated, file="D:/DDSE project/data/free_high_rated.rds")

write.csv(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated.csv")
saveRDS(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated.rds")

write.csv(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated.csv")
saveRDS(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated.rds")

#######################discretization for SPMF#######################

universal_k <- 0

#category, factor to numeric values
require(plyr)
preprocessing_category <- function(dt_category, k1){
  dt_category$Category <- revalue(x = dt_category$Category, c("Action" = k1+1, "Adventure" = k1+2, "Arcade" = k1+3, "Art & Design" = k1+4, "Auto & Vehicles" = k1+5,
                                                              "Beauty" = k1+6, "Board" = k1+7, "Book1s & Reference" = k1+8, "Business" = k1+9, "Card" = k1+10,
                                                              "Casino" = k1+11, "Casual" = k1+12, "Comics" = k1+13, "Communication" = k1+14, "Dating" = k1+15,
                                                              "Education" = k1+16, "Educational" = k1+17, "Entertainment" = k1+18, "Events" = k1+19, "Finance" = k1+20,
                                                              "Food & Drink1" = k1+21,  "Health & Fitness" = k1+22, "House & Home" = k1+23, "Libraries & Demo" = k1+24, 
                                                              "Lifestyle" = k1+25, "Maps & Navigation" = k1+26, "Medical" = k1+27, "Music" = k1+28, "Music & Audio" = k1+29,
                                                              "News & Magazines" = k1+30, "Parenting" = k1+31, "Personalization" = k1+32, "Photography" = k1+33, 
                                                              "Productivity" = k1+34, "Puzzle" = k1+35, "Racing" = k1+36, "Role Playing" = k1+37, "Shopping" = k1+38, 
                                                              "Simulation" = k1+39, "Social" = k1+40, "Sports" = k1+41, "Strategy" = k1+42, "Tools" = k1+43, 
                                                              "Travel & Local" = k1+44, "Trivia" = k1+45, "Video Players & Editors" = k1+46, "Weather" = k1+47, "Word" = k1+48 ))
  dt_category$Category <- as.numeric(dt_category$Category)
}

free_high_rated$Category <- preprocessing_category(free_high_rated, universal_k)
paid_high_rated$Category <- preprocessing_category(paid_high_rated, universal_k)
no_outliers_free_high_rated$Category <- preprocessing_category(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Category <- preprocessing_category(no_outliers_paid_high_rated, universal_k)

sink(paste0("D:/DDSE project/R code/postprocessing_category.txt"))
categories <- levels(clean_dataset$Category)

for(i in 1:length(level(clean_dataset$Category))){
  cat(i)
  cat("\n")
  cat(categories[universal_k+i])
  cat("\n")
}
sink();

universal_k <- universal_k + length(level(clean_dataset$Category))

#rating count, numeric values to numeric ranges
#get the quarters to discretisize it
preprocessing_ratingcount <- function(dt_ratingcount, k2){
  ratingcount <- which(colnames(dt_ratingcount)=="Rating.Count")
  q0 <- quantile(dt_ratingcount$Rating.Count, 0)
  q1 <- quantile(dt_ratingcount$Rating.Count, .25)
  q2 <- quantile(dt_ratingcount$Rating.Count, 0.5)
  q3 <- quantile(dt_ratingcount$Rating.Count, .75)
  q4 <- quantile(dt_ratingcount$Rating.Count, 1)
  
  print(deparse(substitute(dt_ratingcount)))
  print(quantile(dt_ratingcount$Rating.Count))
  
  for(i in 1:nrow(dt_ratingcount)){
    if(dt_ratingcount[i, ratingcount] < q1){
      dt_ratingcount[i, ratingcount] = k2+1
    }
    else if(q1 <= dt_ratingcount[i, ratingcount] && dt_ratingcount[i, ratingcount] < q2){
      dt_ratingcount[i, ratingcount] = k2+2
    }
    else if(q2 <= dt_ratingcount[i, ratingcount] && dt_ratingcount[i, ratingcount] < q3){
      dt_ratingcount[i, ratingcount] = k2+3
    }
    else{
      dt_ratingcount[i, ratingcount] = k2+4
    }
  }
  dt_ratingcount$Rating.Count <- as.integer(dt_ratingcount$Rating.Count)
}

free_high_rated$Rating.Count = preprocessing_ratingcount(free_high_rated, universal_k)
paid_high_rated$Rating.Count = preprocessing_ratingcount(paid_high_rated, universal_k)
no_outliers_free_high_rated$Rating.Count = preprocessing_ratingcount(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Rating.Count = preprocessing_ratingcount(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_ratingcount.txt")
cat(universal_k+1, universal_k+2, universal_k+3, universal_k+4)
cat("\n")
cat("Rating.Count")
sink()

universal_k <- universal_k + 4

##installs, removing the + and , sign
preprocessing_installs <- function(dt_install, k3){
  installs <- which(colnames(dt_install)=="Installs")
  dt_install$Installs <- as.character(dt_install$Installs)
  for(i in 1:nrow(dt_install)){
    dt_install[i,installs] <- substr(dt_install[i,installs], 1, nchar(as.character(dt_install[i,installs]))-1)
  }
  dt_install$Installs <- gsub("\\,", "", dt_install$Installs)
  #levels
  dt_install$Installs <- revalue(x = dt_install$Installs, c("0" = k3+1, "1" = k3+2, "5" = k3+3, "10" = k3+4,
                                                            "50" = k3+5, "100" = k3+6, "500" = k3+7, "1000" = k3+8,
                                                            "5000" = k3+9, "10000" = k3+10, "50000" = k3+11, "100000" = k3+12,
                                                            "500000" = k3+13, "1000000" = k3+14, "5000000" = k3+15, "10000000" = k3+16,
                                                            "50000000" = k3+17, "100000000" = k3+18, "500000000" = k3+19, "1000000000" = k3+20,
                                                            "5000000000" = k3+21, "10000000000" = k3+22))
}

free_high_rated$Installs <- preprocessing_installs(free_high_rated, universal_k)
paid_high_rated$Installs <- preprocessing_installs(paid_high_rated, universal_k)
no_outliers_free_high_rated$Installs <- preprocessing_installs(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Installs <- preprocessing_installs(no_outliers_paid_high_rated, universal_k)

install_levels <- c("0", "1", "5", "10",
                    "50", "100", "500", "1000",
                    "5000", "10000", "50000", "100000",
                    "500000", "1000000", "5000000", "10000000",
                    "50000000", "100000000", "500000000", "1000000000",
                    "5000000000", "10000000000")

sink("D:/DDSE project/R code/postprocessing_installs.txt")
for(i in 1:length(levels(clean_dataset$Installs))){
  cat(universal_k+i)
  cat("\n")
  cat(install_levels[i])
  cat("\n")
}
sink();

universal_k <- universal_k + length(levels(clean_dataset$Installs))

#price, numeric values to numeric ranges
#round up, to integer, and use quarters
preprocessing_price <- function(dt_price, k4){
  dt_price$Price <- round(dt_price$Price)
  priceindex <- which(colnames(dt_price)=="Price")

  q1 <- quantile(dt_price$Price, .25)
  q2 <- quantile(dt_price$Price, 0.5)
  q3 <- quantile(dt_price$Price, .75)
  
  for(i in 1:nrow(dt_price)){
    if(dt_price[i, priceindex] < q1){
      dt_price[i, priceindex] = k4+1
    }
    else if(q1 <= dt_price[i, priceindex] && dt_price[i, priceindex] < q2){
      dt_price[i, priceindex] = k4+2
    }
    else if(q2 <= dt_price[i, priceindex] && dt_price[i, priceindex] < q3){
      dt_price[i, priceindex] = k4+3
    }
    else{
      dt_price[i, priceindex] = k4+4
    }
  }
  dt_price$Price <- as.integer(dt_price$Price)
}

free_high_rated$Price <- preprocessing_price(free_high_rated, universal_k)
paid_high_rated$Price <- preprocessing_price(paid_high_rated, universal_k)
no_outliers_free_high_rated$Price <- preprocessing_price(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Price <- preprocessing_price(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_price.txt")
cat(universal_k+1, universal_k+2, universal_k+3, universal_k+4)
cat("\n")
cat("Price")
sink()

universal_k <- universal_k + 4

##size, turning M to 1000000 and K to 1000 and varries with device to -1
#use quarters
preprocessing_size <- function(dt_size, k5){
  dt_size$Size <- as.character(gsub("\\,", "", dt_size$Size))
  dt_size$Size[dt_size$Size == "Varies with device"] <- "-1"
  #removing commas
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
  
  q1 <- quantile(dt_size$Size, .25)
  q2 <- quantile(dt_size$Size, .5)
  q3 <- quantile(dt_size$Size, .75)
  
  for(i in 1:nrow(dt_size)){
    if(dt_size[i, size] < q1){
      dt_size[i, size] = k5+1
    }
    else if(q1 <= dt_size[i, size] && dt_size[i, size] < q2){
      dt_size[i, size] = k5+2
    }
    else if(q2 <= dt_size[i, size] && dt_size[i, size] < q3){
      dt_size[i, size] = k5+3
    }
    else{
      dt_size[i, size] = k5+4
    }
  }
  dt_size$Size <- as.integer(dt_size$Size)
}

free_high_rated$Size <- preprocessing_size(free_high_rated, universal_k)
paid_high_rated$Size <- preprocessing_size(paid_high_rated, universal_k)
no_outliers_free_high_rated$Size <- preprocessing_size(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Size <- preprocessing_size(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_size.txt")
cat(universal_k+1, universal_k+2, universal_k+3, universal_k+4)
cat("\n")
cat("Size")
sink()

universal_k <- universal_k + 4

##min.android getting the minimum
preprocessing_minandroid <- function(dt_minandroid, k6){
  print(k6)
  dt_minandroid$Minimum.Android <- as.character(dt_minandroid$Minimum.Android)
  dt_minandroid$Minimum.Android[dt_minandroid$Minimum.Android == "Varies with device"] <- "-1"
  minandroid <- which(colnames(dt_minandroid) == "Minimum.Android")
  for(i in 1:nrow(dt_minandroid)){
    if(dt_minandroid[i,minandroid] != "-1"){
      first_char <- strsplit(dt_minandroid[i,minandroid], '')[[1]][1]
      dt_minandroid[i,minandroid] <- first_char
    }
  }
  print(dt_minandroid$Minimum.Android)
  dt_minandroid$Minimum.Android <- as.factor(dt_minandroid$Minimum.Android)
  print(dt_minandroid$Minimum.Android)
  
  dt_minandroid$Minimum.Android <- revalue(x = dt_minandroid$Minimum.Android,
                                           c("-1" = k6+1, "2" = k6+2, "3" = k6+3, "4" = k6+4, "5" = k6+5, "6" = k6+6, "7" = k6+7, "8" = k6+8))
  print(dt_minandroid$Minimum.Android)
}

free_high_rated$Minimum.Android <- preprocessing_minandroid(free_high_rated, universal_k)
paid_high_rated$Minimum.Android <- preprocessing_minandroid(paid_high_rated, universal_k)
no_outliers_free_high_rated$Minimum.Android <- preprocessing_minandroid(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Minimum.Android <- preprocessing_minandroid(no_outliers_paid_high_rated, universal_k)

minandroid_levels <- c("-1", "2", "3", "4", "5", "6", "7", "8")
sink("D:/DDSE project/R code/postprocessing_minandroid.txt")
for(i in 1:length(minandroid_levels)){
  cat(universal_k+i)
  cat("\n")
  cat(minandroid_levels[i])
  cat("\n")
}
sink();

universal_k <- universal_k + length(minandroid_levels)

#release, date to years
preprocessing_release <- function(dt_release){
  released <- which(colnames(dt_release) == "Released")
  dt_release$Released <- as.character(dt_release$Released)
  for(i in 1:nrow(dt_release)){
    year <- substr(dt_release[i, released], nchar(dt_release[i, released])-3, nchar(dt_release[i, released]))
    dt_release[i, released] <- year
  }
  dt_release$Released <- as.numeric(dt_release$Released)
}

free_high_rated$Released <- preprocessing_release(free_high_rated)
paid_high_rated$Released <- preprocessing_release(paid_high_rated)
no_outliers_free_high_rated$Released <- preprocessing_release(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Released <- preprocessing_release(no_outliers_paid_high_rated)

#last.update, date to years
preprocessing_lastupdate <- function(dt_lastupdate){
  lastupdate <- which(colnames(dt_lastupdate) == "Last.Updated")
  dt_lastupdate$Last.Updated <- as.character(dt_lastupdate$Last.Updated)
  for(i in 1:nrow(dt_lastupdate)){
    year <- substr(dt_lastupdate[i, lastupdate], nchar(dt_lastupdate[i, lastupdate])-3, nchar(dt_lastupdate[i, lastupdate]))
    year0 <- paste0("9", year)
    dt_lastupdate[i, lastupdate] <- year0
  }
  dt_lastupdate$Last.Updated <- as.numeric(dt_lastupdate$Last.Updated)
}

free_high_rated$Last.Updated <- preprocessing_lastupdate(free_high_rated)
paid_high_rated$Last.Updated <- preprocessing_lastupdate(paid_high_rated)
no_outliers_free_high_rated$Last.Updated <- preprocessing_lastupdate(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Last.Updated <- preprocessing_lastupdate(no_outliers_paid_high_rated)

#content.rating, factor levels to numeric values
#"Adults only 18+" "Everyone"        "Everyone 10+"    "Mature 17+"      "Teen"            "Unrated"
preprocessing_contentrating <- function(dt_contentrating, k7){
  dt_contentrating$Content.Rating <- as.factor(dt_contentrating$Content.Rating)
  dt_contentrating$Content.Rating <- revalue(x = dt_contentrating$Content.Rating, c("Adults only 18+" =  k7+1, "Everyone" = k7+2,
                                                                     "Everyone 10+" = k7+3, "Mature 17+" = k7+4,
                                                                     "Teen" = k7+5, "Unrated" = k7+6))
}

free_high_rated$Content.Rating <- preprocessing_contentrating(free_high_rated, universal_k)
paid_high_rated$Content.Rating <- preprocessing_contentrating(paid_high_rated, universal_k)
no_outliers_free_high_rated$Content.Rating <- preprocessing_contentrating(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Content.Rating <- preprocessing_contentrating(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_contentrating.txt")
contentrating_levels <- levels(clean_dataset$Content.Rating)
for(i in 1:length(contentrating_levels)){
  cat(universal_k+i)
  cat("\n")
  cat(contentrating_levels[i])
  cat("\n")
}
sink()

universal_k <- universal_k + length(contentrating_levels)

#ad-support, boolean to numeric
preprocessing_ad <- function(dt_ad, k8){
  dt_ad$Ad.Supported <- as.factor(dt_ad$Ad.Supported)
  dt_ad$Ad.Supported <- revalue(x = dt_ad$Ad.Supported, c("True" = k8+1, "False" = k8+2))
}

free_high_rated$Ad.Supported <- preprocessing_ad(free_high_rated, universal_k)
paid_high_rated$Ad.Supported <- preprocessing_ad(paid_high_rated, universal_k)
no_outliers_free_high_rated$Ad.Supported <- preprocessing_ad(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Ad.Supported <- preprocessing_ad(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_adsupported.txt")
adsupported_levels <- levels(clean_dataset$Ad.Supported)
for(i in 1:length(adsupported_levels)){
  cat(universal_k+i)
  cat("\n")
  cat(adsupported_levels[i])
  cat("\n")
}
sink()

universal_k <- universal_k + length(adsupported_levels)

#in-app purchases, boolean to numeric
preprocessing_inapp <- function(dt_inapp, k9){
  dt_inapp$In.App.Purchases <- as.factor(dt_inapp$In.App.Purchases)
  dt_inapp$In.App.Purchases <- revalue(x = dt_inapp$In.App.Purchases, c("True" = k9+1, "False" = k9+2))
}

free_high_rated$In.App.Purchases <- preprocessing_inapp(free_high_rated, universal_k)
paid_high_rated$In.App.Purchases <- preprocessing_inapp(paid_high_rated, universal_k)
no_outliers_free_high_rated$In.App.Purchases <- preprocessing_inapp(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$In.App.Purchases <- preprocessing_inapp(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_inapp_purchases.txt")
inapp_levels <- levels(clean_dataset$In.App.Purchases)
for(i in 1:length(inapp_levels)){
  cat(universal_k+i)
  cat("\n")
  cat(inapp_levels[i])
  cat("\n")
}
sink()

universal_k <- universal_k + length(inapp_levels)

#editor choice, boolean to numeric
preprocessing_editor <- function(dt_editor, k10){
  dt_editor$Editors.Choice <- as.factor(dt_editor$Editors.Choice)
  dt_editor$Editors.Choice <- revalue(x = dt_editor$Editors.Choice, c("True" = k10+1, "False" = k10+2))
}

free_high_rated$Editors.Choice <- preprocessing_editor(free_high_rated, universal_k)
paid_high_rated$Editors.Choice <- preprocessing_editor(paid_high_rated, universal_k)
no_outliers_free_high_rated$Editors.Choice <- preprocessing_editor(no_outliers_free_high_rated, universal_k)
no_outliers_paid_high_rated$Editors.Choice <- preprocessing_editor(no_outliers_paid_high_rated, universal_k)

sink("D:/DDSE project/R code/postprocessing_editorchoice.txt")
editorchoice_levels <- levels(clean_dataset$Editors.Choice)
for(i in 1:length(editorchoice_levels)){
  cat(universal_k+i)
  cat("\n")
  cat(editorchoice_levels[i])
  cat("\n")
}
sink()

universal_k <- universal_k + length(editorchoice_levels)

#######################saving datasets#######################

write.csv(free_high_rated, file="D:/DDSE project/data/free_high_rated_spmf.csv")
saveRDS(free_high_rated, file="D:/DDSE project/data/free_high_rated_spmf.rds")

write.csv(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated_spmf.csv")
saveRDS(no_outliers_free_high_rated, file="D:/DDSE project/data/no_outliers_free_high_rated_spmf.rds")

write.csv(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated_spmf.csv")
saveRDS(no_outliers_paid_high_rated, file="D:/DDSE project/data/no_outliers_paid_high_rated_spmf.rds")

#it needs to be the same type otherwise when it is returning the column it will be null, if e.g. it is returning a factor for a numeric :)
