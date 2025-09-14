## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example1-----------------------------------------------------------------
library(DUToolkit)

# example data.frame with date in first column
head(psa_data$Baseline[, 1:5])

