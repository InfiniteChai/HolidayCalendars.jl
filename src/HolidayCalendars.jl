module HolidayCalendars
import RDates

include("rules.jl")

const CALENDARS = RDates.SimpleCalendarManager()
RDates.setcachedcalendar!(CALENDARS, "WEEKEND", RDates.WeekendCalendar())

include("calendars/unitedkingdom.jl")
include("calendars/unitedstates.jl")
include("calendars/target.jl")

export CALENDARS

end # module
