require(knitr) # required for knitting from rmd to md
require(markdown) # required for md to html 
source_rmd <- "/home/rushad/Dropbox/Docs/FactCheckBD/ Road Accidents/Data/ARI_data_analysis.Rmd"
source_md <- "/home/rushad/Dropbox/Docs/FactCheckBD/ Road Accidents/Data/ARI_data_analysis.md"
out_html <- "/home/rushad/Dropbox/Docs/FactCheckBD/ Road Accidents/Data/ARI_data_analysis.html"
knit(source_rmd, source_md) # creates md file
markdownToHTML(source_md, out_html,
               options = c('fragment_only',
                           'base64_images',
                           'use_xhtml' 
                           )) # creates html file
#browseURL(out_html) # open file in browser 
#system(out_html)


# options(rstudio.markdownToHTML = 
#           function(inputFile, outputFile) {      
#             require(markdown)
#             htmlOptions <- markdownHTMLOptions(defaults=TRUE)
#             htmlOptions <- htmlOptions[htmlOptions = c('use_xhtml','fragment_only', 'base64_images')]
#             markdownToHTML(inputFile, outputFile, options = htmlOptions) 
#           }
# ) 