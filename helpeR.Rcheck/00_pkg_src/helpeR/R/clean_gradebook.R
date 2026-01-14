clean_names <- function(x){
  stringr::str_remove(x, " \\(\\d*\\)")
}
get_term_course_id <- function(x) {
  n <- length(x)
  course_id = character(n)
  for (i in 1:n){
    if(is.na(x[i])){
      course_id[i] <- NA
    } else {
      course_id[i] <- stringr::str_split(x[i], " ") |>
        purrr::pluck(1) |>
        purrr::keep(\(x) stringr::str_detect(x, "\\d{4}")) |>
        stringr::str_remove_all(",") |>
        unique()
    }
  }
  course_id
}
clean_column <- function(x){
  x[is.na(x)] <- 0
  if(is.numeric(x)){
    return(x)
  }
  x[x == "EX"] <- NA
  x <- readr::parse_number(x)
  x
}
#' clean gradebook
#'
#' @param file gradebook CSV
#'
#' @return tibble clean gradebook
#' @export
clean_gradebook <- function(file){
  df <- readr::read_csv(file, show_col_types = FALSE)
  # First row is sometimes about manual posting so remove
  df <- df |> dplyr::filter(!is.na(Student))
  # Remove test student
  df <- df |> dplyr::filter(Student != "student, Test")
  # Clean column names
  ## Often have a number at name so remove
  df <- df |> dplyr::rename_with(.fn = clean_names)
  df <- df |> janitor::clean_names()
  # Remove columns with name Score or Grade
  df <- df |> dplyr::rename(myuni_total = unposted_current_score)
  df <- df |> dplyr::select(-tidyselect::matches("score"))
  df <- df |> dplyr::select(-tidyselect::matches("grade"))
  # get student id
  df <- df |> dplyr::rename(student_id = sis_login_id)
  # remove other id columns
  df <- df |> dplyr::select(-id, -sis_user_id)
  # Get course id
  df <- df |>
    dplyr::mutate(term_course = get_term_course_id(section)) |>
    tidyr::separate_wider_delim(
      term_course,
      names = c("term", "course_id"), "_", too_many = "merge") |>
    dplyr::select(-section)
  # Set as UG or PG
  df <- df |>
    dplyr::mutate(
      type = ifelse(
        stringr::str_detect(course_id, "4|7\\d{3}"),
        "PG",
        "UG"
      )
    )
  # SET RAA
  if("raa_exam" %in% colnames(df)){
    df <- df |>
      dplyr::mutate(
        raa = dplyr::case_when(
          raa_exam > 0 ~ "Yes",
          TRUE ~ "No"
        )
      )
    df <- df |>
      dplyr::mutate(raa = clean_column(raa))
  }
  # Deal with missing values and EX
  df <- df |>
    dplyr::mutate(
      dplyr::across(
        -c(
          "student", "student_id", "term", "course_id", "type"
        ),
        .fns = clean_column))
  df
}
# pacman::p_load(tidyverse, targets)
# conflicts_prefer(dplyr::filter)
# gradebook_file <- fs::path_package("helpeR", "inst", "grading", "sc2024-gradebook.csv")
# clean_gradebook(gradebook_file)
utils::globalVariables(
  c("Student", "unposted_current_score", "sis_login_id",
    "id", "sis_user_id", "section", "term_course",
    "course_id", "raa")
  )
