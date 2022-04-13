# read in the file, keep url and type of change
# file comes from a git bash query such as:
# git whatchanged --since '3/01/2022' --until '3/31/2022' --oneline --pretty=format: | grep "articles/machine-learning" | sort | uniq >> whatchanged.csv 

changed <- read.table("whatchanged.csv", header=FALSE, sep="", allowEscapes = TRUE, fill=TRUE)
keep <- c("V5","V6")
changed <- changed[, names(changed) %in% keep]

# rename the remaining variables
library (dplyr)
changed <- changed %>% rename(Type = V5, Filename = V6)


# find the unique filename/type combos
unique <- distinct(changed)

#get file type from the end of the URL string
library("stringr")
unique$FileType <- str_sub(unique$Filename, -3, -1)

#show counts for unique files
table(unique$Type, unique$FileType)
