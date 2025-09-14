## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6, fig.height = 4
)

## ----setup, echo = FALSE------------------------------------------------------
library(DUToolkit)

## ----gen_data_temp, out.width='100%'------------------------------------------
# define inputs
tmin <- min(psa_data$Intervention_1[, 1]) # minimum simulation time
tmax <- max(psa_data$Intervention_1[, 1]) # maximum simulation time
Dt_max <- TRUE # indicates the threshold values are maximums
D <- 750 # single threshold value for the peak
t_s <- 20 # total number of time steps from the peak
t_ss <- 10 # time step increments to move in

## find peak values
peak_values_list <- get_max_min_values(psa_data, tmin, tmax, Dt_max)

# find values for temporal density plots
peak_temporal_list <- get_relative_values(psa_data, peak_values_list, t_s, t_ss)

head(peak_temporal_list$Baseline[[1]])

## ----gen_plot_temp, out.width='100%'------------------------------------------
# generate peak temporal density plots
peak_temporal_plots <- plot_temporal(peak_temporal_list, D)

## example plot
peak_temporal_plots$Baseline

## ----gen_stats_temp, out.width='100%'-----------------------------------------
# generate summary statistics for peak temporal data
stats_peak_temporal <- sum_stats_temporal(peak_temporal_list)

stats_peak_temporal$Baseline

