# Sime gradebook

Sime gradebook

## Usage

``` r
sim_gradebook(n)
```

## Arguments

- n:

  number of students

## Value

tibble of marks with some EX and NAs

## Examples

``` r
sim_gradebook(10)
#> # A tibble: 10 × 4
#>    id       A1       A2    A3
#>    <chr>    <chr> <int> <int>
#>  1 a6955827 76       NA    44
#>  2 a5526423 81       33    81
#>  3 a9675696 EX       71    22
#>  4 a5214861 68       72    42
#>  5 a6231925 54       50     3
#>  6 a8133273 10       58    33
#>  7 a6417663 32       NA    40
#>  8 a9281176 35       24    81
#>  9 a9267657 6        52    93
#> 10 a3151611 22       34    18
```
