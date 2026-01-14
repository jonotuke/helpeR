#' Generate a student ID
#'
#' @param n_digits number of digits in ID
#'
#' @returns a single ID
#'
#' @export
#' @examples
#' sim_id()
sim_id <- function(n_digits = 7) {
  id <- sample(1:9, size = n_digits, replace = TRUE) |>
    stringr::str_c(collapse = "")
  id <- stringr::str_glue("a{id}")
}
#' Simulate multiple IDs
#'
#' @param n number of IDs
#' @param n_digits number of digits in each ID
#'
#' @returns vector of IDs
#'
#' @export
#' @examples
#' sim_ids(10)
sim_ids <- function(n, n_digits = 7) {
  1:n |> purrr::map_chr(\(x) sim_id(n_digits))
}
#' Sime gradebook
#'
#' @param n number of students
#'
#' @returns tibble of marks with some EX and NAs
#'
#' @export
#' @examples
#' sim_gradebook(10)
sim_gradebook <- function(n) {
  gb <- tibble::tibble(
    id = sim_ids(n),
    A1 = sample(0:100, replace = TRUE, size = n),
    A2 = sample(0:100, replace = TRUE, size = n),
    A3 = sample(0:100, replace = TRUE, size = n)
  )
  # Add some EX
  i <- sample(1:n, 1)
  gb$A1[i] <- "EX"
  # Add some missing
  i <- sample(1:n, 2)
  gb$A2[i] <- NA
  gb
}
