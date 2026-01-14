clean_column <- function(x) {
  x[is.na(x)] <- 0
  if (is.numeric(x)) {
    return(x)
  }
  x[x == "EX"] <- NA
  x <- readr::parse_number(x)
  x
}
#' Clean gradebook
#'
#' @description
#' Given selected columns converts NA to 0 and EX to NA.
#'
#'
#' @param gb gradebook tibble
#' @param cols cols to clean
#'
#' @returns cleaned gradebook
#'
#' @export
#' @examples
#' clean_gradebook(gradebook, A1:A3)
clean_gradebook <- function(gb, cols) {
  gb |>
    dplyr::mutate(
      dplyr::across(
        {{ cols }},
        clean_column
      )
    )
}
