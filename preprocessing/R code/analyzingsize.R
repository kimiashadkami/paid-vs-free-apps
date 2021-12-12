getwd()
setwd("D:/eclipse/workspace/paid-vs-free-apps/preprocessing/data/")
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

#feature selection (phase 1), paid, high rated apps
paid_high_rated <- clean_dataset[(clean_dataset$Free == "False" ) & (clean_dataset$Rating >= 4) & (clean_dataset$Rating.Count > 10) 
                                 & (clean_dataset$Currency == "USD"), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Free", "Scraped.Time")
paid_high_rated <- paid_high_rated[ , !(names(paid_high_rated) %in% drops) ]


#feature selection (phase 1), free, high rated apps
free_high_rated <- clean_dataset[(clean_dataset$Free == "True" ) & (clean_dataset$Rating >= 4) & (clean_dataset$Rating.Count > 10), ]
drops <- c("Minimum.Installs", "Maximum.Installs", "Price", "Currency", "Scraped.Time")
free_high_rated <- free_high_rated[ , !(names(free_high_rated) %in% drops) ]

paid_high_rated$Size <- gsub("\\,", "", paid_high_rated$Size)
paid_high_rated$Size[paid_high_rated$Size == "Varies with device"] <- "-1"

free_high_rated$Size <- gsub("\\,", "", free_high_rated$Size)
free_high_rated$Size[free_high_rated$Size == "Varies with device"] <- "-1"


sum <- 0

size <- which(colnames(paid_high_rated)=="Size")
for(i in 1:nrow(paid_high_rated)){
  last_char <- strsplit(paid_high_rated[i,size], '')[[1]][nchar(paid_high_rated[i,size])]
  if(last_char == "G" || last_char == "g"){
    print(paid_high_rated[i, size])
    sum=sum+1;
  }
}


sum1 <- 0

size <- which(colnames(free_high_rated)=="Size")
for(i in 1:nrow(free_high_rated)){
  last_char <- strsplit(free_high_rated[i,size], '')[[1]][nchar(free_high_rated[i,size])]
  if(last_char == "G" || last_char == "g"){
    #print(free_high_rated[i, size])
    sum1=sum1+1;
  }
}
