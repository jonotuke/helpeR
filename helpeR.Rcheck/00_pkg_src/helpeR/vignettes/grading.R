## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(helpeR)
library(dplyr)

## ----eval=FALSE---------------------------------------------------------------
#  csv <- "example-gradebook.csv"

## ----eval=FALSE---------------------------------------------------------------
#  gradebook <- clean_gradebook(csv)
#  gradebook

## -----------------------------------------------------------------------------
data("gradebook")
gradebook |> 
  mutate(
    grade = get_grade(myuni_total)
  ) |> 
  select(myuni_total, grade) |> 
  arrange(myuni_total)

