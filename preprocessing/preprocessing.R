#get data
getwd()
#please put in your own directory
setwd("D:/DDSE project/data/")
getwd()
dataset = read.csv("Google-Playstore.csv", na.strings = c("", "NA"), header=TRUE)

#removing the missing data
clean_dataset <- na.omit(dataset)

#removing the duplicates
clean_dataset <- clean_dataset[!duplicated(clean_dataset), ]

#saving the data
#please put in your own directory
write.csv(clean_dataset, file="D:/DDSE project/data/clean_dataset.csv")
saveRDS(clean_dataset, file="D:/DDSE project/data/clean_dataset_rds.rds")
