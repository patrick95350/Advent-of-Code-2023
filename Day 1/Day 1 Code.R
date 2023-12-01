# Advent of Code Day 1

library(here)

setwd(here::here())

find_digits <- function(x){
  x <- gsub("one", "o1e", x)
  x <- gsub("two", "t2o", x)
  x <- gsub("three", "t3e", x)
  x <- gsub("four", "f4r", x)
  x <- gsub("five", "f5e", x)
  x <- gsub("six", "s6x", x)
  x <- gsub("seven", "s7n", x)
  x <- gsub("eight", "e8t", x)
  x <- gsub("nine", "n9e", x)
  x <- gsub("[a-z]", "", x)
  return(x)
}

stars <- read.csv(file = file.path("Day 1", "Day 1 Data.txt"),
                  header = FALSE)

stars[,2] <- unlist(Map(\(x) find_digits(x), stars[,1]))


stars[nchar(stars[,2]) < 2,2] <- paste0(stars[nchar(stars[,2]) < 2,2],
                                        stars[nchar(stars[,2]) < 2,2],
                                        collapse = NULL)

stars[,2] <- paste0(substr(stars[,2], 1, 1),
                    substr(stars[,2], nchar(stars[,2]), nchar(stars[,2])))

stars[,2] <- as.numeric(stars[,2])
sum(stars[,2])