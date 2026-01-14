# Clean gradebook

Given selected columns converts NA to 0 and EX to NA.

## Usage

``` r
clean_gradebook(gb, cols)
```

## Arguments

- gb:

  gradebook tibble

- cols:

  cols to clean

## Value

cleaned gradebook

## Examples

``` r
clean_gradebook(gradebook, A1:A3)
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
