#' Get grades
#'
#' @param mark final mark
#'
#' @return grade
#' @export
get_grade <- function(mark) {
  mark <- round(mark)
  grade <- dplyr::case_when(
    mark == 0 ~ "FNS",
    dplyr::between(mark, 1, 44) ~ "FNA",
    dplyr::between(mark, 45, 49) ~ "FA",
    dplyr::between(mark, 50, 64) ~ "P",
    dplyr::between(mark, 65, 74) ~ "C",
    dplyr::between(mark, 75, 84) ~ "D",
    dplyr::between(mark, 85, 100) ~ "HD"
  )
  grade <- factor(grade, levels = c("FNS","FNA","FA","P","C","D","HD"))
  return(grade)
}
# pacman::p_load(conflicted, tidyverse, targets)
# tibble(mark = 0:100) |>
#   mutate(
#     grade = get_grade(mark)
#   ) |>
#   ggplot(aes(mark, grade, col = grade)) +
#   geom_vline(xintercept = c(0, 45, 50, 65, 75, 85)) +
#   geom_point() +
#   harrypotter::scale_colour_hp_d("Ravenclaw")
#
