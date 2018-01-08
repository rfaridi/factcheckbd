library(ggplot2)
library(scales)
library(dplyr)
library(grid)
# Creating themes and custom functions
themebar2 <- theme_grey()+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_text(size = 14,color = "#08306B"),
        axis.line=element_line(linetype="dotted",color="grey"),
        panel.background=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(),
        legend.position="none")+
        theme(text=element_text(family="Georgia",face="bold"),
              plot.title=element_text(
                family="Helvetica",size=24,vjust=1),
              plot.margin=unit(c(1,2,1,1),"cm"))

##### A function to create horizontal bar plot ######

ggbar2 <- function(df=ari_m,t=2013){
  #df <- ari_m
  #var <- "acc_type"
  #t <- 2013
  # var1 <- with(df,get(var))
  
  top5 <- filter(df,year==t) %>% 
    arrange(desc(num)) %>% 
    slice(1:5)
  top5 <- mutate(top5,Perc=round(num/sum(num),2),
                 acc_type=droplevels(acc_type),
                 acc_type=reorder(acc_type,Perc))
  #print(top5)
  p <- ggplot(top5)+geom_bar(aes(x=acc_type,y=Perc),stat='identity') 
  p <- p+coord_flip()
  p <- p+scale_y_continuous(labels=percent)
  p <- p+labs(x=NULL,y=NULL)
  
  p <- p+geom_text(data=top5,
                   aes(x=acc_type,
                       y=Perc,
                       label=paste0(Perc*100,"%"),
                       hjust=-0.1),family="Georgia",size=8)
  
  p <-  p+geom_text(data=top5,
                    aes(x=acc_type,
                        y=Perc/2,label=num),
                    color="White")+
    ggtitle(paste("Types of Accidents:",t))
  
  return(p+themebar2+scale_fill_continuous(low="#C6DBEF",high="#2171B5"))
}