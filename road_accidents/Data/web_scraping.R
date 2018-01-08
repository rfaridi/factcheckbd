mytheme <- theme_grey()+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.line=element_line(linetype="dotted",color="grey"),
        panel.background=element_blank(),
        #panel.grid.major = element_blank(),
        #panel.grid.minor = element_blank(),
        panel.border=element_blank(),
        legend.position="none")
# library(XML)
# url <- "http://www.brta.gov.bd/index.php/road-safety"
# tables <- readHTMLTable(url)
# n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
# table <- tables[[which.max(n.rows)]]
# table <- table[4:dim(table)[1],]
# varnames <- c("year","accidents","deaths","injuries","tot_casualties")
# names(table) <- varnames
# save(table,file="/home/rushad/Dropbox/Docs/FactCheckBD/ Road Accidents/brta_acc.RData")

load("/home/rushad/Dropbox/Docs/FactCheckBD/ Road Accidents/brta_acc.RData")
ggplot(data=table)+geom_line(aes(x=year,y=accidents,group=1))+mytheme
