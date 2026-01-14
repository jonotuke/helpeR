set.seed(2026)
gradebook <- sim_gradebook(n = 10)
usethis::use_data(gradebook, overwrite = TRUE)
