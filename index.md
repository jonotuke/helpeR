# helpeR

The goal of helpeR is to store the regular functions that I use.

## Installation

You can install the development version of helpeR like so:

``` r
 remotes::install_github("jonotuke/helpeR")
```

## Adding a function

1.  Use

``` r
use_r("new_function")
```

to add function.  
2. Add in code and driver run until working.  
3. Add Roxygen.  
4. Run

``` r
document()
```

to update document.  
5. Run

``` r
check()
```

to check package is fine.  
6. Run

``` r
build()
```

to install.

If using dplyr, you may get a `no visible binding` error. Add this to
file

``` r
utils::globalVariables(
  c("missing var")
)
```

## Adding instructions

All of the instructions are in the vignettes.

## Adding raw-data

Set up with

``` r
usethis::use_data_raw("grading-data")
```

## Adding extra files

These all go into `inst`, so we create this

``` r
fs::dir_create("inst")
```

We can then get files with

``` r
fs::path_package("helpeR", "inst", "grading", "sc2024-gradebook.csv")
```

## Adding site

To get the site, run

``` r
devtools::build_readme()
pkgdown::build_site()
```

## Adding a vignette

First we create the file with

``` r
use_vignette("grading", title = "Functions to finalise marks")
```

Add notes and compile.
