suppressPackageStartupMessages({
    library(tibble) # rownames_to_column
    library(dplyr)  # slice_sample
    library(readr)  # write_csv
    library(tools)  # md5sum
})

## Generate a CSV file with some variance.
data(mtcars)
mtcars <-
    mtcars %>%
    rownames_to_column(var = "car") %>%
    slice_sample(n = nrow(mtcars))

file_mtcars <- "public/mtcars.csv"
write_csv(mtcars, file = file_mtcars)

message("Wrote ", file_mtcars, " with hash ", md5sum(file_mtcars))
