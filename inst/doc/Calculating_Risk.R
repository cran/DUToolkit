## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(DUToolkit)

## ----calc_risk----------------------------------------------------------------
# define inputs
tmin <- min(psa_data$Intervention_1[, 1]) # minimum simulation time
tmax <- max(psa_data$Intervention_1[, 1]) # maximum simulation time
Dt <- c(rep(750, length(tmin:tmax))) # decision threshold vector
Dt_max <- TRUE # indicates the threshold values are maximums

# calculate risk measure
risk_measures_list <- calculate_risk(psa_data, tmin, tmax, Dt, Dt_max)

risk_measures_list

## ----risk_table---------------------------------------------------------------
## generate risk table
risk_table <- tabulate_risk(risk_measures_list,
  n_s = length(risk_measures_list)
)

risk_table

