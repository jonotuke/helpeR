#' create cal
#'
#' @param df a semester tibble with name and date
#' @param file ICS file to export cal as
#'
#' @return string for ics
#' @export
#'
#' @examples
#' df <- create_semester(lubridate::today(), weeks = 8, MSB = 4)
#' create_cal(df)
create_cal <- function(df, file = NULL){
  events <- df |> purrr::pmap(create_event)
  cal <- stringr::str_glue(
    "
    BEGIN:VCALENDAR
    {events}
    END:VCALENDAR
    "
  )
  if(!is.null(file)){
    readr::write_lines(cal, file)
  }
  cal
}
# pacman::p_load(conflicted, tidyverse, targets)
# df <- create_semester(today(), weeks = 8, MSB = 4)
# create_cal(df, file = "test.ics")
