library(reshape2)
library(ggplot2)
library(scales)
library(dplyr)
#file <- "C:/Users/User/Dropbox/Docs/FactCheckBD/ Road Accidents/Data/facts_2013_table4.csv"
file <- "/home/rushad/Dropbox/Docs/FactCheckBD/ Road Accidents/Data/facts_2013_table4.csv"
ari13.4 <- read.csv(file,header=FALSE,stringsAsFactors = FALSE)
ari13.4 <- ari13.4[,-dim(ari13.4)[2]]
varnames <- c("year","head_on","rear_end","right_angle","side_swipe","overturn","hit_on_road","hit_off_road","hit_parked_vehicle","hit_pedestrian","hit_animal","other")
names(ari13.4) <- varnames

themebar2 <- theme_grey()+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_text(size = 14,face="bold",color = "#08306B"),
        axis.line=element_line(linetype="dotted",color="grey"),
        panel.background=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(),
        legend.position="none")
ari_m <- melt(ari13.4,id.vars = c("year"))
names(ari_m) <- c("year","acc_type","num")
ari_m$acc_type <- factor(ari_m$acc_type,levels=c("head_on","rear_end","right_angle","side_swipe","overturn","hit_on_road","hit_off_road","hit_parked_vehicle","hit_pedestrian","hit_animal","other"),labels=c("Head On", "Rear End", "Right Angle", "Side Swipe", "Overturn", "Hit on Road", "Hit Off Road","Hit Parked Vehicle", "Hit Pedestrian", "Hit Animal", "Other"))
##### A function to create horizontal bar plot ######
ggbar2 <- function(df=ari_m,vr=acc_type,t){
  df <- ari_m
  var <- "acc_type"
  t <- 2013
  #labs=levels(factor(df[[var]]))
  #tab.df
  #tab.df <- as.data.frame(table(df[[var]]))
  #tab.df$val <- round(tab.df[["Freq"]]/sum(tab.df[["Freq"]]),2)
  
  
  
  top5 <- filter(df,year==t) %>% arrange(desc(num)) %>% slice(1:5)
  top5 <-  mutate(top5,Perc=round(num/sum(num),2),
                  acc_type=droplevels(acc_type),
                  acc_type=reorder(acc_type,Perc))
  p <- ggplot(top5)+geom_bar(aes(x=get(var),y=Perc),stat='identity') 
  p <- p+coord_flip()
  p <- p+scale_y_continuous(labels=percent)
  p <- p+labs(x=NULL,y=NULL)
  p <- p+geom_text(data=top5,aes(x=get(var),y=Perc/2,label=paste0(Perc*100,"%"),hjust=-0.25),color="white")
  p <- p+geom_text(data=top5,aes(x=get(var),y=Perc/2,label=paste0(Perc*100,"%"),hjust=-0.25),color="white")
  p <- p+geom_text(data=top5,aes(x=get(var),y=Perc,label=num,hjust=-0.25),color="Black")
 p <-  p+geom_text(data=top5,aes(x=get(var),y=Perc,label=num,hjust=-0.25),color="Black")+ggtitle("Types of Accidents: 2013")

  #p <- p+geom_text(data=tab.df,aes(x=Var1,y=val/2,label=labs,vjust=-.5))
  return(p+themebar2+scale_fill_continuous(low="#C6DBEF",high="#2171B5"))
}  

#df=airtel
#var="dur_use"
#labs=levels(factor(df[[var]]))

#ggbar2(var = 'dur_use')



testplot <- ggplot(test,aes(x=reorder(variable,value)))+geom_bar(aes(y=value),stat='identity')+coord_flip()
testplot+facet_wrap(~year,ncol=4)

# next I can try to show the figure for different years
l <- 0
m <- 1
for(i in 1:4){
  l <- i+m
  m <- l+3
  
  assign(paste0(m,i),x[] 
}




