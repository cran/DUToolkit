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
Dt <- c(rep(750, length(tmin:tmax))) # decision threshold vector 
Dt_max <- TRUE # indicates the threshold values are maximums

## find peak values
peak_values_list <- get_max_min_values(psa_data, tmin, tmax, Dt_max)

head(peak_values_list$Baseline)

## ----gen_den, out.width='100%'------------------------------------------------
# define single threshold value for the peak
D <- 750

# calculate risk measure
risk_measures_list <- calculate_risk(psa_data, tmin, tmax, Dt, Dt_max)

# generate density plots
density_plots <- plot_density(
  peak_values_list, D,
  Dt_max, risk_measures_list
)

## example plot
density_plots$Intervention_1

## ----cust_den, out.width='100%'-----------------------------------------------
# customize plots
## add fixed x/y-axis limits and change the label of the x-axis
density_plots <- lapply(density_plots, function(x) {
  x + ggplot2::ylim(0, 0.002) + ggplot2::xlim(0, 4500) +
    ggplot2::labs(x = "Hospital demand at peak")
})

## remove subtitle and caption
density_plots <- lapply(density_plots, function(x) {
  x + ggplot2::labs(subtitle = NULL, caption = NULL)
})

## example plot
density_plots$Intervention_1

## ----calc_peak_risk-----------------------------------------------------------
# calculate risk measures at peak values
peak_risk <- calculate_max_min_risk(peak_values_list, D, Dt_max)

# generate risk table dataframe
peak_risk_table <- tabulate_risk(peak_risk, n_s = length(peak_risk))
peak_risk_table

## ----calc_peak_probs----------------------------------------------------------
# define vector of threshold values
Dp <- c(750, 1000, 2000)

# calculate probability that peak value is > specified threshold values
peak_probs <- calculate_threshold_probs(peak_values_list, Dp, Dt_max)

peak_probs$Baseline

