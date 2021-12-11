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
paid_min_android_4 <- paid_datas[(paid_data$Minimum.Android == 137), ]
write.csv(paid_min_android_4, file="paid_high_rated_apps_minimum_android_4.csv", row.names = FALSE)

#minimum android 4 and content rating everyone
paid_min_android_4_contentrating <- paid_data[(paid_data$Minimum.Android == 137) & (paid_data$Content.Rating == 143), ]
write.csv(paid_min_android_4_contentrating, file="paid_high_rated_apps_min_android_4_content_rating_everyone.csv", row.names = FALSE)

###################price 1, high-rated, frequent patterns###################
#rating count
price1_ratingcount_100 <- price1_data[(price1_data$Rating.Count == 100), ]
write.csv(price1_ratingcount_100, file="price_range_1_high_rated_apps_rating_count_100.csv", row.names = FALSE)

#content rating + min android
price1_contentrating_minandroid_4 <- price1_data[(price1_data$Content.Rating == 143) & (price1_data$Minimum.Android == 137), ]
write.csv(price1_contentrating_minandroid_4, file="price_range_1_high_rated_apps_content_rating_minimum_android_4.csv", row.names = FALSE)

###################price 2, high-rated, frequent patterns###################
#rating count
price2_ratingcount_100 <- price2_data[(price2_data$Rating.Count == 100), ]
write.csv(price2_ratingcount_100, file="price_range_2_high_rated_apps_ratingcount_100.csv", row.names = FALSE)

#last update
price2_lastupdate_2020 <- price2_data[(price2_data$Last.Updated == 92020), ]
write.csv(price2_lastupdate_2020, file="price_range_2_high_rated_apps_last_updated_2020.csv", row.names = FALSE)

price2_lastupdate_2021 <- price2_data[(price2_data$Last.Updated == 92021), ]
write.csv(price2_lastupdate_2021, file="price_range_2_high_rated_apps_last_updated_2021.csv", row.names = FALSE)

#size
price2_size_131 <- price2_data[(price2_data$Size == 131), ]
write.csv(price2_size_131, file="price_range_2_high_rated_apps_size_131.csv", row.names = FALSE)

###################price 3, high-rated, frequent patterns###################
#last update 2020
price3_lastupdate_2020 <- price3_data[(price3_data$Last.Updated == 92020), ]
write.csv(price3_lastupdate_2020, file="price_range_3_high_rated_last_updated_2020.csv", row.names = FALSE)

#last update 2020
price3_lastupdate_2021 <- price3_data[(price3_data$Last.Updated == 92021), ]
write.csv(price3_lastupdate_2021, file="price_range_3_high_rated_last_updated_2021.csv", row.names = FALSE)

#rating count
price3_ratingcount_100 <- price3_data[(price3_data$Rating.Count == 100), ]
write.csv(price3_ratingcount_100, file="price_range_3_high_rated_ratingcount_100.csv", row.names = FALSE)

#content rating + min android
price3_contentrating_minandroid_4 <- price3_data[(price3_data$Content.Rating == 143) & (price3_data$Minimum.Android == 137), ]
write.csv(price3_contentrating_minandroid_4, file="price_range_3_high_rated_contentrating_everyone_minimum_android_4.csv", row.names = FALSE)

###################price 4, high-rated, frequent patterns###################
#size 131
price4_size_131 <- price4_data[(price4_data$Size == 131), ]
write.csv(price4_size_131, file="price_range_4_high_rated_size_131.csv", row.names = FALSE)

#last update 2021
price4_lastupdate_2021 <- price4_data[(price4_data$Last.Updated == 92021), ]
write.csv(price4_lastupdate_2021, file="price_range_4_high_rated_last_updated_2021.csv", row.names = FALSE)