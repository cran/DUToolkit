## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7, fig.height = 5
)

## ----setup, echo = FALSE------------------------------------------------------
library(DUToolkit)

## ----gen_fan, out.width='100%', warning=FALSE, message=FALSE------------------
# define inputs
tmin <- min(psa_data$Intervention_1[, 1]) # minimum simulation time
tmax <- max(psa_data$Intervention_1[, 1]) # maximum simulation time
Dt <- c(rep(750, length(tmin:tmax))) # decision threshold vector
Dt_max <- TRUE # indicates the threshold values are maximums

# generate fan plots
fan_plots <- plot_fan(psa_data, tmin, tmax, Dt, Dt_max)

## example plot
fan_plots$Baseline

## ----cust_fan, out.width='100%', warning=FALSE, message=FALSE-----------------
# customize plots
## add fixed y-axis limits and change the label of the y-axis
fan_plots <- lapply(fan_plots, function(x) {
  x + ggplot2::ylim(0, 4000) + ggplot2::labs(y = "Hospital Demand")
})

## remove subtitle and caption
fan_plots <- lapply(fan_plots, function(x) {
  x + ggplot2::labs(subtitle = NULL, caption = NULL)
})

## example plot
fan_plots$Baseline

## ----calc_time----------------------------------------------------------------
# Find mean and 95%CI of time and duration of first violation of the threshold
time_outcomes_list <- calculate_time(psa_data, tmin, tmax, Dt, Dt_max)
time_outcomes_list$Baseline

