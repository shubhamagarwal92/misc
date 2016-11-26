require(dplyr)

age.cat <- function(x, lower = 18, upper = 70, by = 2,
                    sep = "-", above.char = "+") {
  
  labs <- c(paste(seq(lower, upper - by, by = by),
                  seq(lower + by - 1, upper - 1, by = by),
                  sep = sep),
            paste(upper, above.char, sep = ""))
  
  cut(floor(x), breaks = c(seq(lower, upper, by = by), Inf),
      right = FALSE, labels = labs)
}

labs = c("18-19","20-22","23-26","27-30","30+")
breaks = c(c(18,20,23,27,30),Inf)
