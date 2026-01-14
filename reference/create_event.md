# create event

create event

## Usage

``` r
create_event(name, date, file = NULL)
```

## Arguments

- name:

  name of event

- date:

  date of event

- file:

  if given a ics name, exports an ICS file

## Value

string of event

## Examples

``` r
create_event("TEST", lubridate::today())
#> BEGIN:VEVENT
#> DTSTART;VALUE=DATE:2026-01-14
#> DTEND;VALUE=DATE:2026-01-15
#> SUMMARY:TEST
#> END:VEVENT
```
