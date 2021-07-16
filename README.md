# HolidayCalendars

*A holiday calendar suite to integrate with the [RDates](https://github.com/InfiniteChai/RDates.jl) library*

| **Documentation**                                                         | **Build Status**                                              |
|:-------------------------------------------------------------------------:|:-------------------------------------------------------------:|
| [![][docs-stable-img]][docs-stable-url] [![][docs-latest-img]][docs-latest-url] | [![][travis-img]][travis-url] [![][codecov-img]][codecov-url] |

This provides a set of the financial holiday calendars that can be integrated with [RDates](https://github.com/InfiniteChai/RDates.jl), the relative date library. It is built to be easy to understand but heavily optimised for
integration with financial models.

## Installation

`HolidayCalendars` can be installed using the Julia package manager. From the Julia REPL, type `]` to enter the Pkg REPL mode and run
```julia-repl
pkg> add HolidayCalendars
```

## Basic Usage

At this point you can now start using `HolidayCalendars` in your current Julia session using the following command
```julia-repl
julia> using HolidayCalendars
```

To work with the RDates library you then just need to use the `CALENDARS` calendar manager

```julia-repl
julia> using RDates, Dates
julia> apply(rd"1b@LONDON", Date(2021,7,16), CALENDARS)
2021-07-19
```

[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://infinitechai.github.io/HolidayCalendars.jl/latest

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://infinitechai.github.io/HolidayCalendars.jl/stable

[travis-img]: https://travis-ci.com/InfiniteChai/HolidayCalendars.jl.svg?branch=master
[travis-url]: https://travis-ci.com/InfiniteChai/HolidayCalendars.jl

[codecov-img]: https://codecov.io/gh/InfiniteChai/HolidayCalendars.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/InfiniteChai/HolidayCalendars.jl

[issues-url]: https://github.com/JuliaDocs/Documenter.jl/issues
