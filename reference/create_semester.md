# create semester

Given a start date and number of weeks, this creates a tibble with name
of week and date. Can also add a two-week mid-semester break (MSB)

## Usage

``` r
create_semester(start, weeks = 12, MSB = NULL)
```

## Arguments

- start:

  date of start of semester

- weeks:

  number of weeks in semester

- MSB:

  week after which mid-semester breaks starts

## Value

tibble with name and dates

## Examples

``` r
create_semester(lubridate::today(), weeks = 12, MSB = 8)
#> # A tibble: 14 × 2
#>    name    date      
#>    <chr>   <date>    
#>  1 Week 1  2026-01-14
#>  2 Week 2  2026-01-21
#>  3 Week 3  2026-01-28
#>  4 Week 4  2026-02-04
#>  5 Week 5  2026-02-11
#>  6 Week 6  2026-02-18
#>  7 Week 7  2026-02-25
#>  8 Week 8  2026-03-04
#>  9 MSB     2026-03-11
#> 10 MSB     2026-03-18
#> 11 Week 9  2026-03-25
#> 12 Week 10 2026-04-01
#> 13 Week 11 2026-04-08
#> 14 Week 12 2026-04-15
```
