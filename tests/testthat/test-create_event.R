library(testthat)
test_that("create_event works", {
  expect_match(
    create_event(name = "TEST", lubridate::today()),
    "TEST"
  )
})
