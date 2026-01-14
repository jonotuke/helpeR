library(helpeR)
pacman::p_load(conflicted, tidyverse, targets)
nlp <- create_semester(ymd("2026-08-03"), weeks = 10)
nlp <- nlp |>
  mutate(
    name = str_glue("NLP-{name}"),
    name = str_replace_all(name, "Week ", "W")
  )
create_cal(nlp, "~/Desktop/nlp.ics")
