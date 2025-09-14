## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7, fig.height = 5
)

## ----setup, echo = FALSE------------------------------------------------------
library(DUToolkit)

## ----calc_peak----------------------------------------------------------------
# define inputs
tmin <- min(psa_data$Intervention_1[, 1]) # minimum simulation time
tmax <- max(psa_data$Intervention_1[, 1]) # maximum simulation time
Dt_max <- TRUE # indicates the threshold values are maximums
D <- 750 # single threshold value for the peak

## find peak values
peak_values_list <- get_max_min_values(psa_data, tmin, tmax, Dt_max)

# generate raincloud plot
raincloud_plot <- plot_raincloud(peak_values_list, D)

raincloud_plot

