# MonthlyReport

I use this R script for a monthly report, to summarize how many files have been added, modified, deleted.

## Generate data

1. **Check out and update branch.** 
    * To start, go to your local repository. 
    * Check out the branch you're interested in reporting on.  Usually, this is main, but it might also be a release branch. 
    * Do a `git pull upstream` to get the most recent version of the branch.

1. **Run query.** In a git bash shell, run the following.  Substitute the dates and the directory path that you're reporting on.  This is my query from March:

    ```
    git whatchanged --since '3/01/2022' --until '3/31/2022' --oneline --pretty=format: | grep "articles/machine-learning" | sort | uniq >> whatchanged.csv 
    ```

1. **Move file.** Now move the file **whatchanged.csv** into the directory with the R script.  

## Run findchanges.R

Once the file **whatchanged.csv** is in the same directory as **findchanges.R**, run the R script.  I use RStudio, but you can use any R IDE you wish.

The output is a table of file types (columns) by change type (rows).  
The change types are A (added), D (deleted), M (modified), and sometimes a R* (Renamed).  Here's an example:

```
           .md gif jpg png yml
         1   0   0   0   0   0
  A      0   8   0   1   8   0
  D      0   5   1   1   8   0
  M      0 141   0   0   2   1
  R085   0   1   0   0   0   0
  ```
