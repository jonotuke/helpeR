# Functions to finalise marks

``` r
library(helpeR)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

## Cleaning the gradebook

1.  Read in gradebook

``` r
data(gradebook)
```

``` r
gradebook <- clean_gradebook(gradebook, A1:A3)
gradebook
#> # A tibble: 10 × 4
#>    id          A1    A2    A3
#>    <chr>    <dbl> <dbl> <dbl>
#>  1 a9164528    29    19    80
#>  2 a3162258    84    27    72
#>  3 a5333482    18     0    87
#>  4 a2959297    44    33    88
#>  5 a2554189    96    67    12
#>  6 a3974964    26   100    50
#>  7 a9186486    37    14    20
#>  8 a8613711    NA    58    17
#>  9 a4651341    81     0    43
#> 10 a8554513    32    32    27
```

## Adding grade

``` r
gradebook <- gradebook |>
  rowwise() |>
  mutate(
    total = sum(c_across(A1:A3)) / 300 * 100
  ) |>
  mutate(grade = get_grade(total))
```

## Filling grade-roster

You can use the empty grade-roster and final totals to fill grade book

An example dataset is given in

``` r
example_gradebook_file <- fs::path_package(
  "helpeR",
  "extdata/stats-1234-gradebook.xlsx"
)
example_gradebook <- readxl::read_excel(example_gradebook_file)
example_gradebook
#> # A tibble: 15 × 4
#>       ID `Last Name` `First Name` total
#>    <dbl> <chr>       <chr>        <dbl>
#>  1     1 Ardman      Andrew           0
#>  2     2 Brown       Bob              1
#>  3     3 Chen        Charles         44
#>  4     4 Dewit       Doris           45
#>  5     5 Edwards     Emma            49
#>  6     6 France      Frances         50
#>  7     7 Grape       Gilbert         64
#>  8     8 Harrison    Harry           65
#>  9     9 Ingles      Ignious         74
#> 10    10 Jones       John            74
#> 11    11 Kilo        Kerry           75
#> 12    12 Llamas      Lyon            84
#> 13    13 Mitchell    Michael         85
#> 14    14 Nice        Nancy          100
#> 15    15 Opal        Orphelia         0
```

The corresponding graderoster is

``` r
graderoster_file <- fs::path_package(
  "helpeR",
  "extdata/stats-1234-graderoster.xlsx"
)
```

``` r
fill_grade_roster(gradebook, graderoster_file)
```
