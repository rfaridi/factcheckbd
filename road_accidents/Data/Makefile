# First we name the variables
fname=ARI_data_analysis
#fnameRmd='ARI_data_analysis.Rmd'
fnameMd='ARI_data_analysis_v2.md'
fnameHtml='ARI_data_analysis.html'

# We define the final output
all: ${fname}.html

# Throw in some option
R_OPTS=--vanilla

# Constructing ingredients
${fname}.html: ${fname}.md gr13.png
	R ${R_OPTS} -e "markdown::markdownToHTML(${fnameMd},${fnameHtml},options=c('fragment_only'))"

#,options = c('fragment_only','base64_images','use_xhtml'))"

#${fname}.md: ${fname}.Rmd
	#R ${R_OPTS} -e "knitr::knit(${fnameRmd},${fnameMd})"

gr13.png: gr13.R impDat.Rout functions.R
	R CMD BATCH ${R_OPTS} gr13.R

impDat.Rout: facts_2013_table4.csv
#impDat.RData: impDat.R facts_2013_table4.csv
	R CMD BATCH ${R_OPTS} impDat.R	


