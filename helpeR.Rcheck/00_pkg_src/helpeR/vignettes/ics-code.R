## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(helpeR)

## ----message=FALSE------------------------------------------------------------
library(lubridate)
create_event(name = "Test", today())

## ----eval=FALSE---------------------------------------------------------------
#  create_event(name = "Test", today(), file = "test.ics")

## -----------------------------------------------------------------------------
sem <- create_semester(today(), weeks = 12, MSB = 8)
sem

## -----------------------------------------------------------------------------
create_cal(sem)

