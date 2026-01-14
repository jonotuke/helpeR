utils::globalVariables(
  c("X13")
)
#' fill grade roster
#'
#' @param df scores with student_id col and total col
#' @param infile empty graderoster
#' @param id_col name of column with Ids
#' @param RAA marks to give RAA
#'
#' @return nothing
#' @export
fill_grade_roster <- function(df, infile, id_col = ID, RAA = 45:49) {
  outfile <- stringr::str_c(
    stringr::str_remove(infile, "\\.xlsx|\\.XLSX"),
    "-final.xlsx"
  )
  # Convert XLSX to CSV temp
  csv_infile <- fs::file_temp(ext = "csv")
  csv_outfile <- fs::file_temp(ext = "csv")
  infile |>
    readxl::read_excel(col_names = FALSE) |>
    readr::write_csv(csv_infile, na = "", col_names = FALSE)
  # Read in the grade roster
  grade_roster <- readr::read_lines(csv_infile)
  # Find start of data
  i <- which(stringr::str_detect(grade_roster, "EmplID"))
  # Get header
  header <- grade_roster[1:(i - 1)]
  # Write out header
  readr::write_lines(header, csv_outfile)
  # data
  data <- readr::read_csv(
    csv_infile,
    skip = i - 1,
    show_col_types = FALSE
  )
  # Get IDs
  IDs <- df |> dplyr::pull({{ id_col }})
  # Convert to no-a version
  IDs <- as.numeric(stringr::str_remove(IDs, "a"))
  # Get totals
  total <- df |> dplyr::pull(total)
  # round totals
  total <- round(total)
  # Add totals
  for (i in 1:nrow(data)) {
    ID <- data$EmplID[i]
    index <- which(IDs == ID)
    if (length(index) > 0) {
      # Add total
      data$`Mark/Grade Input`[i] <- total[index]
      # Add supp code
      if (total[index] %in% RAA) {
        data$`Transcript Note ID`[i] <- "US10"
      }
      # Add FNS
      if (total[index] == 0) {
        data$`Mark/Grade Input`[i] <- "FNS"
      }
    }
  }
  # Remove extra column if needed
  if ("X13" %in% colnames(data)) {
    data <-
      data |>
      dplyr::select(-X13)
  }
  readr::write_csv(data, csv_outfile, append = TRUE, na = "", col_names = TRUE)
  csv_outfile |>
    readr::read_csv(col_names = FALSE) |>
    writexl::write_xlsx(outfile, col_names = FALSE)
  outfile
}
# pacman::p_load(conflicted, tidyverse, targets)
# example_gradebook_file <- fs::path_package(
#   "helpeR",
#   "extdata/stats-1234-gradebook.xlsx"
# )
# graderoster_file <- fs::path_package(
#   "helpeR",
#   "extdata/stats-1234-graderoster.xlsx"
# )
# example_gradebook <- readxl::read_excel(example_gradebook_file)
# example_gradebook
# fill_grade_roster(example_gradebook, graderoster_file) |> print()
