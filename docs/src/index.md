# Holiday Calendars

*A holiday calendar suite to integrate with the [RDates](https://github.com/InfiniteChai/RDates.jl) library*

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

## Calendar Definitions

This package provides the following set of holiday calendars.

### General Calendars
- **WEEKEND** will mark Saturday and Sunday as holidays.

### United Kingdom Calendars
- **UK/SETTLEMENT** or **LONDON** is the bank holiday (and swap settlement) calendar for England and Wales.
- **UK/STOCK EXCHANGE** or **UK/LSE** is the holiday calendar for the London Stock Exchange.
- **UK/METAL EXCHANGE** or **UK/LME** is the holiday calendar for the London Metal Exchange.

### European Calendars
- **TARGET** is the [TARGET](https://www.ecb.europa.eu/paym/target/target2/profuse/calendar/html/index.en.html) holiday calendar.

### United States Calendars
- **US/SETTLEMENT** or **NEW YORK** is the bank holiday (and swap settlement) calendar for United States.

## Benchmarks

When working with financial models, it's important to optimise the performance for
high frequency of calls.

We use the cached calendar model by default so that we can perform a million calculations
of holiday functions in under a second.

First we can check out the performance of calculating the number of business days within
an 85 year period.

```@example
using HolidayCalendars, RDates, Dates, BenchmarkTools

d0 = Dates.Date(2015,1,1)
d1 = Dates.Date(2100,12,31)

cal = calendar(CALENDARS, "LONDON")
bizdaycount(cal, d0, d1)
res = @benchmark for _ in 1:1000000 bizdaycount(cal, d0, d1) end
println(IOContext(stdout, :compact => false), res)
```

Next lets check out the performance of calculating the next business day.

```@example
using HolidayCalendars, RDates, Dates, BenchmarkTools

d0 = Dates.Date(2015,1,1)
d1 = rd"1b@LONDON"
res = @benchmark for _ in 1:1000000 apply(d1, d0, CALENDARS) end
println(IOContext(stdout, :compact => false), res)
```

## Registering a Calendar

To register a new calendar, then you can use calendar rules for defining it

```@docs
HolidayCalendars.PeriodicCalendarRule
HolidayCalendars.ExplicitDateRule
HolidayCalendars.WindowCalendarRule
```

You can then register these together into `RuleBasedCalendar`.

```@docs
HolidayCalendars.RuleBasedCalendar
```

When registering your calendar, use `setcachedcalendar!` to make sure we're getting
the necessary performance characteristics within financial models.

```julia
setcachedcalendar!(CALENDARS, "CAL NAME", WeekendCalendar() + RuleBasedCalendar([]))
```
