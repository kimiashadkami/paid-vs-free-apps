#get data, please put in your own directory
getwd()
setwd("D:/eclipse/workspace/paid-vs-free-apps/preprocessing/datalow/")
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
#write.csv(clean_dataset, file="clean_dataset.csv", row.names = FALSE)

#feature selection (phase 1), free, low rated apps
free_low_rated <- clean_dataset[(clean_dataset$Free == "True" ) & (clean_dataset$Rating <= 2) & (clean_dataset$Rating.Count > 10), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Price", "Currency", "Scraped.Time")
free_low_rated <- free_low_rated[ , !(names(free_low_rated) %in% drops) ]

#feature selection (phase 1), paid, low rated apps
paid_low_rated <- clean_dataset[(clean_dataset$Free == "False" ) & (clean_dataset$Rating <= 2) & (clean_dataset$Rating.Count > 10) 
                                 & (clean_dataset$Currency == "USD"), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Free", "Scraped.Time")
paid_low_rated <- paid_low_rated[ , !(names(paid_low_rated) %in% drops) ]

#######################saving datasets#######################

#write.csv(free_low_rated, file="free_low_rated.csv", row.names = FALSE)

#write.csv(paid_low_rated, file="paid_low_rated.csv", row.names = FALSE)

#######################discretization for SPMF#######################
postprocessing_info <- ""

#rating
#preprocessing_rating <- function(dt_rating){
#   dt_rating$Rating <- dt_rating$Rating*10
# }

#free_low_rated$Rating <- preprocessing_rating(free_low_rated)
#paid_low_rated$Rating <- preprocessing_rating(paid_low_rated)

#for(i in 0:20){
#   postprocessing_info <- paste0(postprocessing_info, i, "\n", "Rating: ", i/10, "\n")
# }


universal_k = 20

#category, factor to numeric values
require(plyr)
# preprocessing_category <- function(dt_category, k1){
#   dt_category$Category <- revalue(x = dt_category$Category, c("Action" = k1+1, "Adventure" = k1+2, "Arcade" = k1+3, "Art & Design" = k1+4, "Auto & Vehicles" = k1+5,
#                                                               "Beauty" = k1+6, "Board" = k1+7, "Books & Reference" = k1+8, "Business" = k1+9, "Card" = k1+10,
#                                                               "Casino" = k1+11, "Casual" = k1+12, "Comics" = k1+13, "Communication" = k1+14, "Dating" = k1+15,
#                                                               "Education" = k1+16, "Educational" = k1+17, "Entertainment" = k1+18, "Events" = k1+19, "Finance" = k1+20,
#                                                               "Food & Drink" = k1+21,  "Health & Fitness" = k1+22, "House & Home" = k1+23, "Libraries & Demo" = k1+24, 
#                                                               "Lifestyle" = k1+25, "Maps & Navigation" = k1+26, "Medical" = k1+27, "Music" = k1+28, "Music & Audio" = k1+29,
#                                                               "News & Magazines" = k1+30, "Parenting" = k1+31, "Personalization" = k1+32, "Photography" = k1+33, 
#                                                               "Productivity" = k1+34, "Puzzle" = k1+35, "Racing" = k1+36, "Role Playing" = k1+37, "Shopping" = k1+38, 
#                                                               "Simulation" = k1+39, "Social" = k1+40, "Sports" = k1+41, "Strategy" = k1+42, "Tools" = k1+43, 
#                                                               "Travel & Local" = k1+44, "Trivia" = k1+45, "Video Players & Editors" = k1+46, "Weather" = k1+47, "Word" = k1+48 ))
#   dt_category$Category <- as.numeric(dt_category$Category)
# }

#free
# free_low_rated$Category <- preprocessing_category(free_low_rated, universal_k)

#paid
# paid_low_rated$Category <- preprocessing_category(paid_low_rated, universal_k)

# categories <- c("Action", "Adventure", "Arcade", "Art & Design", "Auto & Vehicles", "Beauty", "Board", "Books & Reference", "Business",
#                 "Card", "Casino", "Casual", "Comics", "Communication", "Dating", "Education", "Educational", "Entertainment", "Events", 
#                 "Finance", "Food & Drink", "Health & Fitness", "House & Home", "Libraries & Demo", "Lifestyle", "Maps & Navigation", 
#                 "Medical", "Music", "Music & Audio", "News & Magazines", "Parenting", "Personalization", "Photography", "Productivity", 
#                 "Puzzle", "Racing", "Role Playing", "Shopping", "Simulation", "Social", "Sports", "Strategy", "Tools", "Travel & Local", 
#                 "Trivia", "Video Players & Editors", "Weather", "Word")
# 
# for(i in 1:length(categories)){
#   postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "Category: ", categories[i], "\n")
# }
# 
# universal_k <- universal_k + length(categories)

#rating count, numeric values to numeric ranges
#get the quarters to discretisize it
preprocessing_ratingcount <- function(dt_ratingcount, k2){
  ratingcount <- which(colnames(dt_ratingcount)=="Rating.Count")
  
  q1 <- quantile(dt_ratingcount$Rating.Count, .25)
  q2 <- quantile(dt_ratingcount$Rating.Count, 0.5)
  q3 <- quantile(dt_ratingcount$Rating.Count, .75)
  
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

#free
quantile_free_ratingcount <- quantile(free_low_rated$Rating.Count)
free_low_rated$Rating.Count = preprocessing_ratingcount(free_low_rated, universal_k)

#paid
quantile_paid_ratingcount <- quantile(paid_low_rated$Rating.Count)
paid_low_rated$Rating.Count = preprocessing_ratingcount(paid_low_rated, universal_k)

#writing the quantiles
sink("ratingcount_quantiles_low.txt")
cat("free low-rated")
cat("\n")
print(quantile_free_ratingcount)
cat("\n")
cat("paid low_rated")
cat("\n")
print(quantile_paid_ratingcount)
cat("\n")
sink()

postprocessing_info <- paste0(postprocessing_info, universal_k+1, " ", universal_k+2, " ", universal_k+3, " ", universal_k+4, "\n", "Rating.Count", "\n")

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

#free
free_low_rated$Installs <- preprocessing_installs(free_low_rated, universal_k)
free_low_rated <- free_low_rated[(free_low_rated$Installs > universal_k+6 ), ]

#paid
paid_low_rated$Installs <- preprocessing_installs(paid_low_rated, universal_k)
paid_low_rated <- paid_low_rated[(paid_low_rated$Installs > universal_k+6 ), ]

install_levels <- c("0", "1", "5", "10",
                    "50", "100", "500", "1000",
                    "5000", "10000", "50000", "100000",
                    "500000", "1000000", "5000000", "10000000",
                    "50000000", "100000000", "500000000", "1000000000",
                    "5000000000", "10000000000")

for(i in 1:length(install_levels)){
  postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "Installs: ", install_levels[i], "\n")
}

universal_k <- universal_k + length(install_levels)

#price, numeric values to numeric ranges
#round up, to integer, and use quarters
preprocessing_price <- function(dt_price, k4){
  print(class(dt_price$Price))
  dt_price$Price <- round(dt_price$Price)
  priceindex <- which(colnames(dt_price)=="Price")
  print(class(dt_price$Price))
  
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

#paid
quantile_paid_price <- quantile(paid_low_rated$Price)
paid_low_rated$Price <- preprocessing_price(paid_low_rated, universal_k)

price1 = universal_k+1
price2 = universal_k+2
price3 = universal_k+3
price4 = universal_k+4

#writing the quantiles
sink("price_quantiles_low.txt")
cat("paid low_rated")
cat("\n")
print(quantile_paid_price)
cat("\n")
sink()

postprocessing_info <- paste0(postprocessing_info, universal_k+1, " ", universal_k+2, " ", universal_k+3, " ", universal_k+4, "\n", "Price", "\n")

universal_k <- universal_k + 4

##size, turning M to 1000000 and K to 1000 and varries with device to -1
#use quarters
preprocessing_size <- function(dt_size, k5){
  dt_size$Size <- gsub("\\,", "", dt_size$Size)
  dt_size$Size[dt_size$Size == "Varies with device"] <- "-1"
  #removing commas
  size <- which(colnames(dt_size)=="Size")
  for(i in 1:nrow(dt_size)){
    last_char <- strsplit(dt_size[i,size], '')[[1]][nchar(dt_size[i,size])]
    if(last_char == "M" || last_char =="m"){
      temp <- dt_size[i,size]
      temp <- substr(temp, 1, nchar(temp)-1)
      temp <- as.numeric(temp)
      temp <- temp*1000000
      dt_size[i,size] <- as.character(temp)
    }
    else if(last_char == "K" || last_char == "k"){
      temp <- dt_size[i,size]
      temp <- substr(temp, 1, nchar(temp)-1)
      temp <- as.numeric(temp)
      temp <- temp*1000
      dt_size[i,size] <- as.character(temp) 
    }
    else if(last_char == "G" || last_char == "g"){
      dt_size[i, size] <- "-2"
    }
  }
  dt_size$Size <- as.numeric(dt_size$Size)
  
  q1 <- quantile(dt_size$Size, .25)
  q2 <- quantile(dt_size$Size, .5)
  q3 <- quantile(dt_size$Size, .75)
  
  q <- quantile(dt_size$Size)
  #writing the quantiles
  print(q)
  
  for(i in 1:nrow(dt_size)){
    if(dt_size[i, size] < q1){
      dt_size[i, size] <- k5+1
    }
    else if(q1 <= dt_size[i, size] && dt_size[i, size] < q2){
      dt_size[i, size] <- k5+2
    }
    else if(q2 <= dt_size[i, size] && dt_size[i, size] < q3){
      dt_size[i, size] <- k5+3
    }
    else{
      dt_size[i, size] <- k5+4
    }
  }
  dt_size$Size <- as.numeric(dt_size$Size)
}

sink("size_quantiles_low.txt")

#free
cat("free low-rated")
cat("\n")
free_low_rated$Size <- preprocessing_size(free_low_rated, universal_k)
cat("\n")

#paid
cat("paid low-rated")
cat("\n")
paid_low_rated$Size <- preprocessing_size(paid_low_rated, universal_k)
cat("\n")

sink();

postprocessing_info <- paste0(postprocessing_info, universal_k+1, " ", universal_k+2, " ", universal_k+3, " ", universal_k+4, "\n", "Size", "\n")

universal_k <- universal_k + 4

##min.android getting the minimum
preprocessing_minandroid <- function(dt_minandroid, k6){
  dt_minandroid$Minimum.Android <- as.character(dt_minandroid$Minimum.Android)
  dt_minandroid$Minimum.Android[dt_minandroid$Minimum.Android == "Varies with device"] <- "-1"
  minandroid <- which(colnames(dt_minandroid) == "Minimum.Android")
  for(i in 1:nrow(dt_minandroid)){
    if(dt_minandroid[i,minandroid] != "-1"){
      first_char <- strsplit(dt_minandroid[i,minandroid], '')[[1]][1]
      dt_minandroid[i,minandroid] <- first_char
    }
  }
  dt_minandroid$Minimum.Android <- as.factor(dt_minandroid$Minimum.Android)
  
  dt_minandroid$Minimum.Android <- revalue(x = dt_minandroid$Minimum.Android,
                                           c("-1" = k6+1, "1" = k6+2, "2" = k6+3, "3" = k6+4, "4" = k6+5, "5" = k6+6, "6" = k6+7, "7" = k6+8, "8" = k6+9))
}

#free
free_low_rated$Minimum.Android <- preprocessing_minandroid(free_low_rated, universal_k)

#paid
paid_low_rated$Minimum.Android <- preprocessing_minandroid(paid_low_rated, universal_k)

minandroid_levels <- c("-1", "1", "2", "3", "4", "5", "6", "7", "8")

for(i in 1:length(minandroid_levels)){
  postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "Minimum.Android: ", minandroid_levels[i], "\n")
}

universal_k <- universal_k + length(minandroid_levels)

#release, date to years
# preprocessing_release <- function(dt_release){
#   released <- which(colnames(dt_release) == "Released")
#   dt_release$Released <- as.character(dt_release$Released)
#   for(i in 1:nrow(dt_release)){
#     year <- substr(dt_release[i, released], nchar(dt_release[i, released])-3, nchar(dt_release[i, released]))
#     dt_release[i, released] <- year
#   }
#   dt_release$Released <- as.numeric(dt_release$Released)
# }

#free
# free_low_rated$Released <- preprocessing_release(free_low_rated)

#paid
# paid_low_rated$Released <- preprocessing_release(paid_low_rated)

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

#free
free_low_rated$Last.Updated <- preprocessing_lastupdate(free_low_rated)

#paid
paid_low_rated$Last.Updated <- preprocessing_lastupdate(paid_low_rated)

#content.rating, factor levels to numeric values
#"Adults only 18+" "Everyone"        "Everyone 10+"    "Mature 17+"      "Teen"            "Unrated"
preprocessing_contentrating <- function(dt_contentrating, k7){
  dt_contentrating$Content.Rating <- as.factor(dt_contentrating$Content.Rating)
  dt_contentrating$Content.Rating <- revalue(x = dt_contentrating$Content.Rating, c("Adults only 18+" =  k7+1, "Everyone" = k7+2,
                                                                                    "Everyone 10+" = k7+3, "Mature 17+" = k7+4,
                                                                                    "Teen" = k7+5, "Unrated" = k7+6))
}

#free
free_low_rated$Content.Rating <- preprocessing_contentrating(free_low_rated, universal_k)

#paid
paid_low_rated$Content.Rating <- preprocessing_contentrating(paid_low_rated, universal_k)

contentrating_levels <- c("Adults only 18+", "Everyone", "Everyone 10+", "Mature 17+", "Teen", "Unrated")
for(i in 1:length(contentrating_levels)){
  postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "Content.Rating: ", contentrating_levels[i], "\n")
}

universal_k <- universal_k + length(contentrating_levels)

#ad-support, boolean to numeric
preprocessing_ad <- function(dt_ad, k8){
  dt_ad$Ad.Supported <- as.factor(dt_ad$Ad.Supported)
  dt_ad$Ad.Supported <- revalue(x = dt_ad$Ad.Supported, c("True" = k8+1, "False" = k8+2))
}

#free
free_low_rated$Ad.Supported <- preprocessing_ad(free_low_rated, universal_k)

#paid
paid_low_rated$Ad.Supported <- preprocessing_ad(paid_low_rated, universal_k)

adsupported_levels <- c("True", "False")
for(i in 1:length(adsupported_levels)){
  postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "Ad.Supported: ", adsupported_levels[i], "\n")
}

universal_k <- universal_k + length(adsupported_levels)

#in-app purchases, boolean to numeric
preprocessing_inapp <- function(dt_inapp, k9){
  dt_inapp$In.App.Purchases <- as.factor(dt_inapp$In.App.Purchases)
  dt_inapp$In.App.Purchases <- revalue(x = dt_inapp$In.App.Purchases, c("True" = k9+1, "False" = k9+2))
}

#free
free_low_rated$In.App.Purchases <- preprocessing_inapp(free_low_rated, universal_k)

#paid
paid_low_rated$In.App.Purchases <- preprocessing_inapp(paid_low_rated, universal_k)

inapp_levels <- c("True", "False")
for(i in 1:length(inapp_levels)){
  postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "In.App.Purchases: ", inapp_levels[i], "\n")
}

universal_k <- universal_k + length(inapp_levels)

#editor choice, boolean to numeric
# preprocessing_editor <- function(dt_editor, k10){
#   dt_editor$Editors.Choice <- as.factor(dt_editor$Editors.Choice)
#   dt_editor$Editors.Choice <- revalue(x = dt_editor$Editors.Choice, c("True" = k10+1, "False" = k10+2))
# }

#free
# free_low_rated$Editors.Choice <- preprocessing_editor(free_low_rated, universal_k)

#paid
# paid_low_rated$Editors.Choice <- preprocessing_editor(paid_low_rated, universal_k)

# editorchoice_levels <- c("True", "False")
# for(i in 1:length(editorchoice_levels)){
#   postprocessing_info <- paste0(postprocessing_info, universal_k+i, "\n", "Editor.Choice: ", editorchoice_levels[i], "\n")
# }
# 
# universal_k <- universal_k + length(editorchoice_levels)

#######################saving datasets#######################
sink("postprocessing_low.txt")
cat(postprocessing_info)
sink()

#free
# write.csv(free_low_rated, file="free_low_rated2.csv", row.names = FALSE)
drops1 <- c("App.Id", "App.Name", "Free", "Developer.Id", "Developer.Website", "Developer.Email", "Privacy.Policy",
            "Category", "Rating", "Released", "Editors.Choice")
free_low_rated <- free_low_rated[ , !(names(free_low_rated) %in% drops1) ]
write.csv(free_low_rated, file="free_low_rated_spmf.csv", row.names = FALSE)

#paid
#write.csv(paid_low_rated, file="paid_low_rated2.csv", row.names = FALSE)
drops2 <- c("App.Id", "App.Name", "Currency", "Developer.Id", "Developer.Website", "Developer.Email", "Privacy.Policy",
            "Category", "Rating", "Released", "Editors.Choice")
paid_low_rated <- paid_low_rated[ , !(names(paid_low_rated) %in% drops2) ]
write.csv(paid_low_rated, file="paid_low_rated_spmf.csv", row.names = FALSE)

#different price ranges
drops3 <- c("Price")

paid_low_rated_price1 <- paid_low_rated[paid_low_rated$Price == price1, ]
paid_low_rated_price1 <- paid_low_rated_price1[, !(names(paid_low_rated_price1) %in% drops3)]
write.csv(paid_low_rated_price1, file="paid_low_rated_price1.csv", row.names = FALSE)

paid_low_rated_price2 <- paid_low_rated[paid_low_rated$Price == price2, ]
paid_low_rated_price2 <- paid_low_rated_price2[, !(names(paid_low_rated_price2) %in% drops3)]
write.csv(paid_low_rated_price2, file="paid_low_rated_price2.csv", row.names = FALSE)

paid_low_rated_price3 <- paid_low_rated[paid_low_rated$Price == price3, ]
paid_low_rated_price3 <- paid_low_rated_price3[, !(names(paid_low_rated_price3) %in% drops3)]
write.csv(paid_low_rated_price3, file="paid_low_rated_price3.csv", row.names = FALSE)

paid_low_rated_price4 <- paid_low_rated[paid_low_rated$Price == price4, ]
paid_low_rated_price4 <- paid_low_rated_price4[, !(names(paid_low_rated_price4) %in% drops3)]
write.csv(paid_low_rated_price4, file="paid_low_rated_price4.csv", row.names = FALSE)

#it needs to be the same type otherwise when it is returning the column it will be null, if e.g. it is returning a factor for a numeric :)