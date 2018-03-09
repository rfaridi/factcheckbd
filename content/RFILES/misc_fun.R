# Following is the function used 
# to make the tabyl() output
# in publishable quality
#clean_df <-function(x) {
#    sel <- "-percent"
#    cond <- paste0("!is.na(","valid_percent",")")
#    x %>% 
#	filter_(.dots=cond) %>% 
#	select_(.dots=sel) %>%
#	rename_(.dots=setNames("n","N")) %>%
#	mutate_(.dots=setNames("round(valid_percent*100,1)","Percent") ) %>%
#	select_(.dots=list("-valid_percent")) # though list was not required but when multiple elements list is required
#}


# some of the data frames do not have valid data frames where there is no missing values. In such cases
# different functions have to be used

#clean_df2 <- function(x) {
#    x %>% 
#	rename_(.dots=setNames("n","N")) %>%
#	mutate_(.dots=setNames("round(percent*100,1)","Percent") ) %>%
#	select_(.dots="-percent") 
#}


# now using the above function, we can have a more clean tabyl() function itself

#tabyl_clean2  <- function(df,x,ren){
#    df$xx <- df[[x]]
#    tabyl(df,xx) %>%
#        clean_df2() %>%  # as defined in the above
#	adorn_totals("row") %>%
#	rename_(.dots=setNames("xx",ren))  
#}
#

clean_df <-function(x) {
    sel <- "-percent"
    cond <- paste0("!is.na(","valid_percent",")")
    x1 <- x %>% 
	rename_(.dots=setNames("n","N")) 
# in the following is valid_percent is found in the names, then the following is
    # executed. just awesome, saved a lot of trouble
    if(any(names(x1) %in% "valid_percent")) {
     x1 %>%
	select_(.dots=sel) %>%
	filter_(.dots=cond) %>% 
	mutate_(.dots=setNames("round(valid_percent*100,1)","Percent") ) %>%
	select_(.dots=list("-valid_percent")) # though list was not required but when multiple elements list is required
}   else {
      x1 %>%
       	mutate_(.dots=setNames("round(percent*100,1)","Percent") ) %>%
	select_(.dots="-percent") 
    }
}

tabyl_clean  <- function(df,x,ren){
    df$xx <- df[[x]]
    tabyl(df,xx) %>%
        clean_df() %>%  
	adorn_totals("row") %>%
        mutate(Percent=replace(Percent, xx=="Total", 100)) %>% 
	rename_(.dots=setNames("xx",ren))  
}

# tabyl_clean2  <- function(df,x,ren){
#    df$xx <- df[[x]]
#    tabyl(df,xx) %>%
#        clean_df() %>%  
#        arrange(desc(N)) %>% 
#	adorn_totals("row") %>% 
#        mutate(Percent=replace(Percent, xx=="Total", 100)) %>% 
#	rename_(.dots=setNames("xx",ren))  
#}
