#get data, please put in your own directory
getwd()
setwd("D:/eclipse/workspace/paid-vs-free-apps/visualizing/data/")
getwd()

free_data = read.csv("free_high_rated_spmf.csv", na.strings = c("", "NA"), header=TRUE)
paid_data = read.csv("paid_high_rated_spmf.csv", na.strings = c("", "NA"), header=TRUE)
price1_data = read.csv("paid_high_rated_price1.csv", na.strings = c("", "NA"), header=TRUE)
price2_data = read.csv("paid_high_rated_price2.csv", na.strings = c("", "NA"), header=TRUE)
price3_data = read.csv("paid_high_rated_price3.csv", na.strings = c("", "NA"), header=TRUE)
price4_data = read.csv("paid_high_rated_price4.csv", na.strings = c("", "NA"), header=TRUE)

#session setting
options(stringsAsFactors = FALSE)
options(scipen = 999999999)

###################free, high-rated, frequent patterns###################
#installs
free_installs110 <- free_data[(free_data$Installs == 110), ]
write.csv(free_installs110, file="free_installs110.csv", row.names = FALSE)

#rating count
free_ratingcount100 <- free_data[(free_data$Rating.Count == 100), ]
write.csv(free_ratingcount100, file="free_ratingcount100.csv", row.names = FALSE)

free_ratingcount101 <- free_data[(free_data$Rating.Count == 101), ]
write.csv(free_ratingcount101, file="free_ratingcount101.csv", row.names = FALSE)

free_ratingcount102 <- free_data[(free_data$Rating.Count == 102), ]
write.csv(free_ratingcount102, file="free_ratingcount102.csv", row.names = FALSE)

#size
free_size131 <- free_data[(free_data$Size == 131), ]
write.csv(free_size131, file="free_size131.csv", row.names = FALSE)

free_size132 <- free_data[(free_data$Size == 132), ]
write.csv(free_size132, file="free_size132.csv", row.names = FALSE)

#last update
free_lastupdate2020 <- free_data[(free_data$Last.Updated == 92020), ]
write.csv(free_lastupdate2020, file="free_lastupdate2020.csv", row.names = FALSE)

free_lastupdate2021 <- free_data[(free_data$Last.Updated == 92021), ]
write.csv(free_lastupdate2021, file="free_lastupdate2021.csv", row.names = FALSE)

#in-app purchases + ad support + min android + content rating
free_longpattern <- free_data[(free_data$Content.Rating == 143) & (free_data$In.App.Purchases == 151) 
                              & (free_data$Minimum.Android == 137) & (free_data$Ad.Supported == 148), ]
write.csv(free_longpattern, file="free_longpattern.csv", row.names = FALSE)

###################paid, high-rated, frequent patterns###################
#size
paid_size130 <- paid_data[(paid_data$Size == 130), ]
write.csv(paid_size130, file="paid_size130.csv", row.names = FALSE)

paid_size131 <- paid_data[(paid_data$Size == 131), ]
write.csv(paid_size131, file="paid_size131.csv", row.names = FALSE)

paid_size132 <- paid_data[(paid_data$Size == 132), ]
write.csv(paid_size132, file="paid_size132.csv", row.names = FALSE)

#rating count
paid_ratingcount100 <- paid_data[(paid_data$Rating.Count == 100), ]
write.csv(paid_ratingcount100, file="paid_ratingcount100.csv", row.names = FALSE)

paid_ratingcount101 <- paid_data[(paid_data$Rating.Count == 101), ]
write.csv(paid_ratingcount101, file="paid_ratingcount101.csv", row.names = FALSE)

paid_ratingcount102 <- paid_data[(paid_data$Rating.Count == 102), ]
write.csv(paid_ratingcount102, file="paid_ratingcount102.csv", row.names = FALSE)

#last update
paid_lastupdate2021 <- paid_data[(paid_data$Last.Updated == 2021), ]
write.csv(paid_lastupdate2021, file="paid_lastupdate2021.csv", row.names = FALSE)

#installs
paid_installs110 <- paid_data[(paid_data$Installs == 110), ]
write.csv(paid_installs110, file="paid_installs110.csv", row.names = FALSE)

#price
paid_price127 <- paid_data[(paid_data$Price == 127), ]
write.csv(paid_price127, file="paid_price127.csv", row.names = FALSE)

#content rating + installs
paid_contentrating_installs <- paid_data[(paid_data$Content.Rating == 143) & (paid_data$Installs == 110), ]
write.csv(paid_contentrating_installs, file="paid_contentrating_installs.csv", row.names = FALSE)

#min android
paid_minandroid <- paid_data[(paid_data$Minimum.Android == 137), ]
write.csv(paid_minandroid, file="paid_minandroid.csv", row.names = FALSE)

#ad support + in-app purchacase
paid_adsupport_inapp <- paid_data[(paid_data$Ad.Supported == 149) & (paid_data$In.App.Purchases == 151), ]
write.csv(paid_adsupport_inapp, file="paid_adsupport_inapp.csv", row.names = FALSE)

###################price 1, high-rated, frequent patterns###################
#size
price1_size129 <- price1_data[(price1_data$Size == 129), ]
write.csv(price1_size129, file="price1_size129.csv", row.names = FALSE)

price1_size130 <- price1_data[(price1_data$Size == 130), ]
write.csv(price1_size130, file="price1_size130.csv", row.names = FALSE)

#rating count
price1_ratingcount100 <- price1_data[(price1_data$Rating.Count == 100), ]
write.csv(price1_ratingcount100, file="price1_ratingcount100.csv", row.names = FALSE)

price1_ratingcount101 <- price1_data[(price1_data$Rating.Count == 101), ]
write.csv(price1_ratingcount101, file="price1_ratingcount101.csv", row.names = FALSE)

#installs
price1_installs110 <- price1_data[(price1_data$Installs == 110), ]
write.csv(price1_installs110, file="price1_installs110.csv", row.names = FALSE)

#content rating + size
price1_contentrating_size <- price1_data[(price1_data$Content.Rating == 143) & (price1_data$Size == 129), ]
write.csv(price1_contentrating_size, file="price1_contentrating_size.csv", row.names = FALSE)

#content rating + min android
price1_contentrating_minandroid <- price1_data[(price1_data$Content.Rating == 143) & (price1_data$Minimum.Android == 137), ]
write.csv(price1_contentrating_minandroid, file="price1_contentrating_minandroid.csv", row.names = FALSE)

###################price 2, high-rated, frequent patterns###################
#rating count
price2_ratingcount100 <- price2_data[(price2_data$Rating.Count == 100), ]
write.csv(price2_ratingcount100, file="price2_ratingcount100.csv", row.names = FALSE)

price2_ratingcount101 <- price2_data[(price2_data$Rating.Count == 101), ]
write.csv(price2_ratingcount101, file="price2_ratingcount101.csv", row.names = FALSE)

price2_ratingcount102 <- price2_data[(price2_data$Rating.Count == 102), ]
write.csv(price2_ratingcount102, file="price2_ratingcount102.csv", row.names = FALSE)

#last update
price2_lastupdate2020 <- price2_data[(price2_data$Last.Updated == 92020), ]
write.csv(price2_lastupdate2020, file="price2_lastupdate2020.csv", row.names = FALSE)

price2_lastupdate2021 <- price2_data[(price2_data$Last.Updated == 92021), ]
write.csv(price2_lastupdate2021, file="price2_lastupdate2021.csv", row.names = FALSE)

#size
price2_size132 <- price2_data[(price2_data$Size == 132), ]
write.csv(price2_size132, file="price2_size132.csv", row.names = FALSE)

#installs
price2_installs <- price2_data[(price2_data$Installs == 110), ]
write.csv(price2_installs, file="price2_installs.csv", row.names = FALSE)

#content rating + min android
price2_contentrating_minandroid <- price2_data[(price2_data$Content.Rating == 143) & (price2_data$Minimum.Android == 137), ]
write.csv(price2_contentrating_minandroid, file="price2_contentrating_minandroid.csv", row.names = FALSE)

###################price 3, high-rated, frequent patterns###################
#last update
price3_lastupdate2020 <- price3_data[(price3_data$Last.Updated == 92020), ]
write.csv(price3_lastupdate2020, file="price3_lastupdate2020.csv", row.names = FALSE)

price3_lastupdate2021 <- price3_data[(price3_data$Last.Updated == 92021), ]
write.csv(price3_lastupdate2021, file="price3_lastupdate2021.csv", row.names = FALSE)

#size
price3_size129 <- price3_data[(price3_data$Size == 129), ]
write.csv(price3_size129, file="price3_size129.csv", row.names = FALSE)

price3_size130 <- price3_data[(price3_data$Size == 130), ]
write.csv(price3_size130, file="price3_size130.csv", row.names = FALSE)

price3_size131 <- price3_data[(price3_data$Size == 131), ]
write.csv(price3_size131, file="price3_size131.csv", row.names = FALSE)

#rating count
price3_ratingcount100 <- price3_data[(price3_data$Rating.Count == 100), ]
write.csv(price3_ratingcount100, file="price3_ratingcount100.csv", row.names = FALSE)

price3_ratingcount101 <- price3_data[(price3_data$Rating.Count == 101), ]
write.csv(price3_ratingcount101, file="price3_ratingcount101.csv", row.names = FALSE)

#installs
price3_installs110 <- price3_data[(price3_data$Installs == 110), ]
write.csv(price3_installs110, file="price3_installs110.csv", row.names = FALSE)

#content rating + min android
price3_contentrating_minandroid <- price3_data[(price3_data$Content.Rating == 143) & (price3_data$Minimum.Android == 137), ]
write.csv(price3_contentrating_minandroid, file="price3_contentrating_minandroid.csv", row.names = FALSE)

###################price 4, high-rated, frequent patterns###################
#size
price4_size131 <- price4_data[(price4_data$Size == 131), ]
write.csv(price4_size131, file="price4_size131.csv", row.names = FALSE)

price4_size132 <- price4_data[(price4_data$Size == 132), ]
write.csv(price4_size132, file="price4_size132.csv", row.names = FALSE)

#rating count
price4_ratingcount101 <- price4_data[(price4_data$Rating.Count == 101), ]
write.csv(price4_ratingcount101, file="price4_ratingcount101.csv", row.names = FALSE)

price4_ratingcount102 <- price4_data[(price4_data$Rating.Count == 102), ]
write.csv(price4_ratingcount102, file="price4_ratingcount102.csv", row.names = FALSE)

#installs
price4_installs110 <- price4_data[(price4_data$Installs == 110), ]
write.csv(price4_installs110, file="price4_installs110.csv", row.names = FALSE)

#last update
price4_lastupdate2021 <- price4_data[(price4_data$Last.Updated == 2021)]
write.csv(price4_lastupdate2021, file="price4_lastupdate2021.csv", row.names = FALSE)

#content rating + min android
price4_contentrating_minandroid <- price4_data[(price4_data$Content.Rating == 143) & (price4_data$Minimum.Android == 137), ]
write.csv(price4_contentrating_minandroid, file="price4_contentrating_minandroid.csv", row.names = FALSE)