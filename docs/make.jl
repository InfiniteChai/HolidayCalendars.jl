push!(LOAD_PATH,"../src/")
using Documenter, HolidayCalendars

makedocs(
    modules = [HolidayCalendars],
    clean = false,
    format = Documenter.HTML(),
    sitename = "HolidayCalendars.jl",
    authors = "Iain Skett",
    pages = [
        "Holiday Calendars" => "index.md",
    ],
)

deploydocs(
    repo = "github.com/InfiniteChai/HolidayCalendars.jl.git",
    devbranch = "main",
    devurl = "latest"
)
