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
k <- 0
require(plyr)
preprocessing_category <- function(dt_category){
  dt_category$Category <- revalue(x = dt_category$Category, c("Action" = k+1, "Adventure" = k+2, "Arcade" = k+3, "Art & Design" = k+4, "Auto & Vehicles" = k+5,
                                                              "Beauty" = k+6, "Board" = k+7, "Books & Reference" = k+8, "Business" = k+9, "Card" = k+10,
                                                              "Casino" = k+11, "Casual" = k+12, "Comics" = k+13, "Communication" = k+14, "Dating" = k+15,
                                                              "Education" = k+16, "Educational" = k+17, "Entertainment" = k+18, "Events" = k+19, "Finance" = k+20,
                                                              "Food & Drink" = k+21,  "Health & Fitness" = k+22, "House & Home" = k+23, "Libraries & Demo" = k+24, 
                                                              "Lifestyle" = k+25, "Maps & Navigation" = k+26, "Medical" = k+27, "Music" = k+28, "Music & Audio" = k+29,
                                                              "News & Magazines" = k+30, "Parenting" = k+31, "Personalization" = k+32, "Photography" = k+33, 
                                                              "Productivity" = k+34, "Puzzle" = k+35, "Racing" = k+36, "Role Playing" = k+37, "Shopping" = k+38, 
                                                              "Simulation" = k+39, "Social" = k+40, "Sports" = k+41, "Strategy" = k+42, "Tools" = k+43, 
                                                              "Travel & Local" = k+44, "Trivia" = k+45, "Video Players & Editors" = k+46, "Weather" = k+47, "Word" = k+48 ))
  dt_category$Category <- as.numeric(dt_category$Category)
}

free_high_rated$Category <- preprocessing_category(free_high_rated)
paid_high_rated$Category <- preprocessing_category(paid_high_rated)
no_outliers_free_high_rated$Category <- preprocessing_category(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Category <- preprocessing_category(no_outliers_paid_high_rated)

sink(paste0("D:/DDSE project/R code/postprocessing_category.txt"))
categories <- c("Action", "Adventure", "Arcade", "Art & Design", "Auto & Vehicles", "Beauty", "Board", "Books & Reference", "Business",
                "Card", "Casino", "Casual", "Comics", "Communication", "Dating", "Education", "Educational", "Entertainment", "Events", 
                "Finance", "Food & Drink", "Health & Fitness", "House & Home", "Libraries & Demo", "Lifestyle", "Maps & Navigation", 
                "Medical", "Music", "Music & Audio", "News & Magazines", "Parenting", "Personalization", "Photography", "Productivity", 
                "Puzzle", "Racing", "Role Playing", "Shopping", "Simulation", "Social", "Sports", "Strategy", "Tools", "Travel & Local", 
                "Trivia", "Video Players & Editors", "Weather", "Word")
for(i in 1:48){
  cat(k+i)
  cat("\n")
  cat(categories[i])
  cat("\n")
}
sink();
k <- k+48

#rating count, numeric values to numeric ranges
#get the quarters to discretisize it
preprocessing_ratingcount <- function(dt_ratingcount){
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
      dt_ratingcount[i, ratingcount] = k+1
    }
    else if(q1 <= dt_ratingcount[i, ratingcount] && dt_ratingcount[i, ratingcount] < q2){
      dt_ratingcount[i, ratingcount] = k+2
    }
    else if(q2 <= dt_ratingcount[i, ratingcount] && dt_ratingcount[i, ratingcount] < q3){
      dt_ratingcount[i, ratingcount] = k+3
    }
    else{
      dt_ratingcount[i, ratingcount] = k+4
    }
  }
  dt_ratingcount$Rating.Count <- as.integer(dt_ratingcount$Rating.Count)
}

free_high_rated$Rating.Count = preprocessing_ratingcount(free_high_rated)
paid_high_rated$Rating.Count = preprocessing_ratingcount(paid_high_rated)
no_outliers_free_high_rated$Rating.Count = preprocessing_ratingcount(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Rating.Count = preprocessing_ratingcount(no_outliers_paid_high_rated)

sink("D:/DDSE project/R code/postprocessing_ratingcount.txt")
cat(k+1, k+2, k+3, k+4)
cat("\n")
cat("Category.Count")
sink()

k <- k+4

##installs, removing the + and , sign
preprocessing_installs <- function(dt_install){
  k <- 52
  installs <- which(colnames(dt_install)=="Installs")
  dt_install$Installs <- as.character(dt_install$Installs)
  for(i in 1:nrow(dt_install)){
    dt_install[i,installs] <- substr(dt_install[i,installs], 1, nchar(as.character(dt_install[i,installs]))-1)
  }
  dt_install$Installs <- as.factor(gsub("\\,", "", dt_install$Installs))
  #levels: "5", "50", "100", "500", "5000", "50000", "100000"
  dt_install$Installs <- revalue(x = dt_install$Installs, c("0" = k+1, "1" = k+2, "5" = k+3, "10" = k+4,
                                                            "50" = k+5, "100" = k+6, "500" = k+7, "1000" = k+8,
                                                            "5000" = k+9, "10000" = k+10, "50000" = k+11, "100000" = k+12,
                                                            "500000" = k+13, "1000000" = k+14, "5000000" = k+15, "10000000" = k+16,
                                                            "50000000" = k+17, "100000000" = k+18, "500000000" = k+19, "1000000000" = k+20,
                                                            "5000000000" = k+21, "10000000000" = k+22))
  dt_install$Installs <- as.numeric(dt_install$Installs)
}

free_high_rated$Installs <- preprocessing_installs(free_high_rated)
paid_high_rated$Installs <- preprocessing_installs(paid_high_rated)
no_outliers_free_high_rated$Installs <- preprocessing_installs(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Installs <- preprocessing_installs(no_outliers_paid_high_rated)

#price, numeric values to numeric ranges
#round up, to integer, and use quarters

##size, turning M to 1000000 and K to 1000 and varries with device to -1
#use quarters
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

free_high_rated$Size <- preprocessing_size(free_high_rated)
paid_high_rated$Size <- preprocessing_size(paid_high_rated)
no_outliers_free_high_rated$Size <- preprocessing_size(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Size <- preprocessing_size(no_outliers_paid_high_rated)

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

free_high_rated$Minimum.Android <- preprocessing_minandroid(free_high_rated)
paid_high_rated$Minimum.Android <- preprocessing_minandroid(paid_high_rated)
no_outliers_free_high_rated$Minimum.Android <- preprocessing_minandroid(no_outliers_free_high_rated)
no_outliers_paid_high_rated$Minimum.Android <- preprocessing_minandroid(no_outliers_paid_high_rated)

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
