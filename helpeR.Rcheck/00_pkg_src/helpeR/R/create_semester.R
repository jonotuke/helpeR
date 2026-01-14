#' create semester
#'
#' Given a start date and number of weeks, this creates a tibble
#' with name of week and date. Can also add a two-week mid-semester
#' break (MSB)
#' @param start date of start of semester
#' @param weeks number of weeks in semester
#' @param MSB week after which mid-semester breaks starts
#'
#' @return tibble with name and dates
#' @export
#'
#' @examples
#' create_semester(lubridate::today(), weeks = 12, MSB = 8)
create_semester <- function(start, weeks = 12, MSB = NULL){
  name <- stringr::str_c("Week ", 1:weeks)
  if(!is.null(MSB)){
    name <- c(name[1:MSB], rep("MSB", 2), name[(MSB+1):weeks])
  }
  df <- tibble::tibble(
    name = name
  )
  df <- df |>
    dplyr::mutate(
      date = start + lubridate::dweeks((1:nrow(df))-1)
    )
  df
}
# pacman::p_load(conflicted, tidyverse)
# start <- today()
# create_semester(start, MSB = 8)
