## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(aws.wrfsmn)

## ----echo = FALSE, results = FALSE--------------------------------------------
data(eva)

## -----------------------------------------------------------------------------
head(eva)

## -----------------------------------------------------------------------------
test.predictors <- c('OUT_PREC',
                     'OUT_EVAP',
                     'OUT_RUNOFF',
                     'OUT_BASEFLOW',
                     'OUT_SOIL_MOIST_lyr_1',
                     'OUT_EVAP_CANOP',
                     'OUT_SURF_TEMP')

## -----------------------------------------------------------------------------
mg <- multiple.guidance(input.data = eva, predictand = 'evapo_obs', predictors = test.predictors)
mg

## -----------------------------------------------------------------------------
evaluation.eva <- mg.evaluation(input.data = eva, predictand = 'evapo_obs', predictors = test.predictors, var.model = 'OUT_EVAP', lmodel = mg)

head(evaluation.eva)

## ----out.width = "100%", fig.align = "center", echo=FALSE---------------------
ploting(daily2monthly(evaluation.eva[[1]]))

