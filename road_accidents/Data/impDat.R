library(reshape2)
file <- "facts_2013_table4.csv"
ari13.4 <- read.csv(file,header=FALSE,stringsAsFactors = FALSE)
ari13.4 <- ari13.4[,-dim(ari13.4)[2]]
varnames <- c("year","head_on","rear_end","right_angle","side_swipe","overturn","hit_on_road","hit_off_road","hit_parked_vehicle","hit_pedestrian","hit_animal","other")
names(ari13.4) <- varnames
ari_m <- melt(ari13.4,id.vars = c("year"))
names(ari_m) <- c("year","acc_type","num")
ari_m$acc_type <- factor(ari_m$acc_type,levels=c("head_on","rear_end","right_angle","side_swipe","overturn","hit_on_road","hit_off_road","hit_parked_vehicle","hit_pedestrian","hit_animal","other"),labels=c("Head On", "Rear End", "Right Angle", "Side Swipe", "Overturn", "Hit on Road", "Hit Off Road","Hit Parked Vehicle", "Hit Pedestrian", "Hit Animal", "Other"))
save(ari_m,file="impDat.RData")