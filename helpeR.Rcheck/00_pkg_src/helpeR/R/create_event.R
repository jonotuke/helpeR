#' create event
#'
#' @param name name of event
#' @param date date of event
#' @param file if given a ics name, exports an ICS file
#'
#' @return string of event
#' @export
#'
#' @examples
#' create_event("TEST", lubridate::today())
create_event <- function(name, date, file = NULL){
  start <- date
  end <- start + lubridate::days(1)
  event <- stringr::str_glue(
    "
    BEGIN:VEVENT
    DTSTART;VALUE=DATE:{start}
    DTEND;VALUE=DATE:{end}
    SUMMARY:{name}
    END:VEVENT
    "
  )
  if(!is.null(file)){
    readr::write_lines(event, file)
  }
  event
}
# pacman::p_load(conflicted, tidyverse, lubridate)
# date <- today()
# create_event("TEST", date)
