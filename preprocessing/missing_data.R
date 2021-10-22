#get data
getwd()
#please put in your own directory
setwd("D:/DDSE project/data/")
getwd()
dataset = read.csv("Google-Playstore.csv", header=TRUE)
#View(dataset)

#column and row
column_num <- ncol(dataset)
row_num <- nrow(dataset)

print(column_num)
print(row_num)

#the classes of each column
for(i in 1:column_num){
  print(class(dataset[,i])) 
}

#seeing if there is any null value in the data
for(i in 1:column_num){
  if(any(is.na(dataset[,i]))){
    print(i)
    k = 0
    print(names(dataset[i]))
    for(j in 1:row_num){
      if(any(is.na(dataset[j,i]))){
        k = k+1
      }
    }
    print(k)
  }
}

#1
#"App.Name"
#1

#4
#"Rating"
#22883

#5
#"Rating.Count"
#22883

#7
#"Minimum.Installs"
#107

#removing the null
clean_dataset <- na.omit(dataset)

#column and row for clean dataset
clean_column_num <- ncol(clean_dataset)
clean_row_num <- nrow(clean_dataset)

print(clean_column_num)
print(clean_row_num)

#checking to see if there is any null value in the data
for(i in 1:clean_column_num){
  if(any(is.na(clean_dataset[,i]))){
    print(i)
    k = 0
    print(names(clean_dataset[i]))
    for(j in 1:clean_row_num){
      if(any(is.na(clean_dataset[j,i]))){
        k = k+1
      }
    }
    print(k)
  }
}

#saving the data
#please put in your own directory
write.csv(clean_dataset, file="D:/DDSE project/data/clean_dataset.csv")
saveRDS(clean_dataset, file="D:/DDSE project/data/clean_dataset_rds.rds")
