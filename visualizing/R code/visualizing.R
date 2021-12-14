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

setwd("D:/eclipse/workspace/paid-vs-free-apps/visualizing/data/patterns data points/")
getwd()

###################free, high-rated, frequent patterns###################
#ad-supported: true, in-app purchases: false
free_ad_supported_true_in_app_purchases_false <- free_data[(free_data$Ad.Supported == 148) & (free_data$In.App.Purchases = 151), ]
write.csv(free_ad_supported_true_in_app_purchases_false, file="free_high_rated_apps_ad_supported_TRUE_in-app_purchases_FALSE.csv", row.names = FALSE)

#last update 2020
free_lastupdate2020 <- free_data[(free_data$Last.Updated == 92020), ]
write.csv(free_lastupdate2020, file="free_high_rated_apps_last_updated_2020.csv", row.names = FALSE)

#last update 2021
free_lastupdate2021 <- free_data[(free_data$Last.Updated == 92021), ]
write.csv(free_lastupdate2021, file="free_high_rated_apps_last_updated_2021.csv", row.names = FALSE)

#minimum android: 4
free_min_android_4 <- free_data[(free_data$Minimum.Android == 137), ]
write.csv(free_min_android_4, file="free_high_rated_apps_minimum_android_4.csv", row.names = FALSE)

###################paid, high-rated, frequent patterns###################
#size 131
paid_size_131 <- paid_data[(paid_data$Size == 131), ]
write.csv(paid_size_131, file="paid_high_rated_apps_size_131.csv", row.names = FALSE)

#price 127
paid_price_127 <- paid_data[(paid_data$Price == 127), ]
write.csv(paid_price_127, file="paid_high_rated_apps_price_127.csv", row.names = FALSE)

#last update 2021
paid_lastupdate_2021 <- paid_data[(paid_data$Last.Updated == 92021), ]
write.csv(paid_lastupdate_2021, file="paid_high_rated_apps_last_update_2021.csv", row.names = FALSE)

#last update 2021, content rating: everyone
paid_lastupdate_2021_contentrating <- paid_data[(paid_data$Last.Updated == 92021) & (paid_data$Content.Rating == 143), ]
write.csv(paid_lastupdate_2021_contentrating, file="paid_high_rated_apps_last_update_2021_content_rating_everyone.csv", row.names = FALSE)

#minimum android 4
paid_min_android_4 <- paid_data[(paid_data$Minimum.Android == 137), ]
write.csv(paid_min_android_4, file="paid_high_rated_apps_minimum_android_4.csv", row.names = FALSE)

#minimum android 4 and content rating everyone
paid_min_android_4_contentrating <- paid_data[(paid_data$Minimum.Android == 137) & (paid_data$Content.Rating == 143), ]
write.csv(paid_min_android_4_contentrating, file="paid_high_rated_apps_min_android_4_content_rating_everyone.csv", row.names = FALSE)

###################price 1, high-rated, frequent patterns###################
#min android
price1_minandroid_4 <- price1_data[(price1_data$Minimum.Android == 137), ]
write.csv(price1_minandroid_4, file="price_range_1_high_rated_apps_minimum_android_4.csv", row.names = FALSE)

###################price 2, high-rated, frequent patterns###################
#last update 2021
price2_lastupdate_2021 <- price2_data[(price2_data$Last.Updated == 92021), ]
write.csv(price2_lastupdate_2021, file="price_range_2_high_rated_apps_last_updated_2021.csv", row.names = FALSE)

#min android
price2_minandroid_4 <- price2_data[(price2_data$Minimum.Android == 137), ]
write.csv(price2_minandroid_4, file="price_range_2_high_rated_apps_minimum_android_4.csv", row.names = FALSE)

###################price 3, high-rated, frequent patterns###################
#last update 2021
price3_lastupdate_2021 <- price3_data[(price3_data$Last.Updated == 92021), ]
write.csv(price3_lastupdate_2021, file="price_range_3_high_rated_last_updated_2021.csv", row.names = FALSE)

#min android
price3_minandroid_4 <- price3_data[(price3_data$Minimum.Android == 137), ]
write.csv(price3_minandroid_4, file="price_range_3_high_rated_minimum_android_4.csv", row.names = FALSE)

###################price 4, high-rated, frequent patterns###################
#last update 2021
price4_lastupdate_2021 <- price4_data[(price4_data$Last.Updated == 92021), ]
write.csv(price4_lastupdate_2021, file="price_range_4_high_rated_last_updated_2021.csv", row.names = FALSE)

#min android
price4_minandroid_4 <- price4_data[(price4_data$Minimum.Android == 137), ]
write.csv(price4_minandroid_4, file="price_range_4_high_rated_apps_minimum_android_4.csv", row.names = FALSE)

###################comparing###################
#last update 2021

#free
lastupdate2021_free <- free_data[(free_data$Last.Updated == 92021), ]
sum1 = nrow(lastupdate2021_free)/nrow(free_data)  

#paid
lastupdate2021_paid <- paid_data[(paid_data$Last.Updated == 92021), ]
sum2 = nrow(lastupdate2021_paid)/nrow(paid_data)

#price1
lastupdate2021_price1 <- price1_data[(price1_data$Last.Updated == 92021), ]
sum3 = nrow(lastupdate2021_price1)/nrow(price1_data)

#price2
lastupdate2021_price2 <- price2_data[(price2_data$Last.Updated == 92021), ]
sum4 = nrow(lastupdate2021_price2)/nrow(price2_data)

#price3
lastupdate2021_price3 <- price3_data[(price3_data$Last.Updated == 92021), ]
sum5 = nrow(lastupdate2021_price3)/nrow(price3_data)

#price4
lastupdate2021_price4 <- price4_data[(price4_data$Last.Updated == 92021), ]
sum6 = nrow(lastupdate2021_price4)/nrow(price4_data)

lastupdate_data <- data.frame(dataset = c("free", "paid", "[0.89, 1.99) USD", "[1.99, 2.99)USD", "[2.99, 4.99) USD", "[4.99, 399.99) USD"),
                              frequency = c(sum1, sum2, sum3, sum4, sum5, sum6));
write.csv(lastupdate_data, file="last_update_2021.csv", row.names = FALSE)

#min android

#free
minandroid4_free <- free_data[(free_data$Minimum.Android == 137), ]
min1 = nrow(minandroid4_free)/nrow(free_data)  

#paid
minandroid4_paid <- paid_data[(paid_data$Minimum.Android == 137), ]
min2 = nrow(minandroid4_paid)/nrow(paid_data)

#price1
minandroid4_price1 <- price1_data[(price1_data$Minimum.Android == 137), ]
min3 = nrow(minandroid4_price1)/nrow(price1_data)

#price2
minandroid4_price2 <- price2_data[(price2_data$Minimum.Android == 137), ]
min4 = nrow(minandroid4_price2)/nrow(price2_data)

#price3
minandroid4_price3 <- price3_data[(price3_data$Minimum.Android == 137), ]
min5 = nrow(minandroid4_price3)/nrow(price3_data)

#price4
minandroid4_price4 <- price4_data[(price4_data$Minimum.Android == 137), ]
min6 = nrow(minandroid4_price4)/nrow(price4_data)

minandroid4_data <- data.frame(dataset = c("free", "paid", "[0.89, 1.99) USD", "[1.99, 2.99)USD", "[2.99, 4.99) USD", "[4.99, 399.99) USD"),
                              frequency = c(min1, min2, min3, min4, min5, min6));
write.csv(minandroid4_data, file="minimum_android_4.csv", row.names = FALSE)
