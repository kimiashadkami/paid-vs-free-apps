#lib
library ("purrr")

#get data
getwd()
setwd("D:/DDSE project/data/")
getwd()
dataset = read.csv("Google-Playstore.csv", header=TRUE)
View(dataset)

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

#how many paid apps
nonfree = 0
for(i in 1:row_num){
  if(dataset[i,9]=="False"){
    nonfree = nonfree + 1
  }
}
print(nonfree)
#45068

#how many non-free apps with ratings over 3
nonfree3 = 0
for(i in 1:row_num){
  if(dataset[i,9]=="False" && !is.na(dataset[i,4]) && dataset[i,4] >= 3 ){
    nonfree3 = nonfree3 + 1
  }
}
print(nonfree3)
#24252

#how many non-free apps with ratings over 4
nonfree4 = 0
for(i in 1:row_num){
  if(dataset[i,9]=="False" && !is.na(dataset[i,4]) && dataset[i,4] >= 4 ){
    nonfree4 = nonfree4 + 1
  }
}
print(nonfree4)
#18082

#how many non-free apps with ratings over 4.5
nonfree4_5 = 0
for(i in 1:row_num){
  if(dataset[i,9]=="False" && !is.na(dataset[i,4]) && dataset[i,4] >= 4.5 ){
    nonfree4_5 = nonfree4_5 + 1
  }
}
print(nonfree4_5)
#9182

#how many non-free apps are missing rating data
k = 0
l = 0
m = 0
for(i in 1:row_num){
  if(is.na(dataset[i,4])){
    if(dataset[i,9] == "False"){
      k = k+1
    }
  }
  else if(dataset[i,4]== ''){
    if(dataset[i,9] == "False"){
      l = l+1
    }
  }
  else if(dataset[i,4] == 0){
    if(dataset[i,9] == "False"){
      m = m+1
    }
  }
}
print("k: ")
print(k)
#227

print("l: ")
print(l)
#0

print("m: ")
print(m)
#19294

n = k+l+m
print("sum: ")
print(n)
#19521

############################## free apps

#how many free apps
free = 0
for(i in 1:row_num){
  if(dataset[i,9]=="True"){
    free = free + 1
  }
}
print(free)
#2267876

#how many free apps with ratings over 4
free4 = 0
for(i in 1:row_num){
  if(dataset[i,9]=="True" && !is.na(dataset[i,4]) && dataset[i,4] >= 4 ){
    free4 = free4 + 1
  }
}
print(free4)
#799571

free4_5 = 0
for(i in 1:row_num){
  if(dataset[i,9]=="True" && !is.na(dataset[i,4]) && dataset[i,4] >= 4.5 ){
    free4_5 = free4_5 + 1
  }
}
print(free4_5)
#413833

#how many free apps are missing rating data
o = 0
p = 0
q = 0
for(i in 1:row_num){
  if(is.na(dataset[i,4])){
    if(dataset[i,9] == "True"){
      o = o+1
    }
  }
  else if(dataset[i,4]== ''){
    if(dataset[i,9] == "True"){
      p = p+1
    }
  }
  else if(dataset[i,4] == 0){
    if(dataset[i,9] == "True"){
      q = q+1
    }
  }
}
print("o: ")
print(o)
#22656

print("p: ")
print(p)
#0

print("q: ")
print(q)
#1040468

r = o+p+q
print("sum: ")
print(r)
#1063124
