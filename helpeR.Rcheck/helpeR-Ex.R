pkgname <- "helpeR"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('helpeR')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("create_cal")
### * create_cal

flush(stderr()); flush(stdout())

### Name: create_cal
### Title: create cal
### Aliases: create_cal

### ** Examples

df <- create_semester(lubridate::today(), weeks = 8, MSB = 4)
create_cal(df)



cleanEx()
nameEx("create_event")
### * create_event

flush(stderr()); flush(stdout())

### Name: create_event
### Title: create event
### Aliases: create_event

### ** Examples

create_event("TEST", lubridate::today())



cleanEx()
nameEx("create_semester")
### * create_semester

flush(stderr()); flush(stdout())

### Name: create_semester
### Title: create semester
### Aliases: create_semester

### ** Examples

create_semester(lubridate::today(), weeks = 12, MSB = 8)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
