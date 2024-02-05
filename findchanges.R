# read in the file, keep url and type of change
# file comes from a git bash query such as:
# git whatchanged --since '3/01/2022' --until '3/31/2022' --oneline --pretty=format: | grep "articles/machine-learning" | sort | uniq >> whatchanged.csv 

# uncomment the next line if you don't have dplyr installed:
# install.packages('dplyr')


changed <- read.table("whatchanged.csv", header=FALSE, sep="", allowEscapes = TRUE, fill=TRUE)
keep <- c("V5","V6")
changed <- changed[, names(changed) %in% keep]

# rename the remaining variables
library (dplyr)
changed <- changed %>% rename(ChangeType = V5, Filename = V6)


# find the unique filename/type combos
unique <- distinct(changed)

#get file type from the end of the URL string
library("stringr")
unique$FileType <- str_sub(unique$Filename, -3, -1)

#show counts for unique files
print(table(unique$ChangeType, unique$FileType))

#show the added files
print("Added:")
print(unique[unique$FileType==".md" & unique$ChangeType=='A', 'Filename'])
print("Deleted:")
#show the deleted files
print(unique[unique$FileType==".md" & unique$ChangeType=='D', 'Filename'])

### If you want to investigate the files further, write a csv file:
#write.csv(unique, "filechanges.csv")
### If you want to investigate the files further, write a csv file:
# write.csv(unique, "filechanges.csv")

