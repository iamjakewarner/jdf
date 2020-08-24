list.of.packages <- c("rmarkdown", "tinytex")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos = "http://cran.us.r-project.org")
tinytex::install_tinytex(extra_packages=c('changepage', 'eulervm', 'sourcecodepro', 'ly1', 'collection-fontsrecommended', 'csquotes', 'titlesec', 'enumitem', 'footmisc', 'footnotebackref', 'biblatex', 'microtype', 'mathpazo'))
