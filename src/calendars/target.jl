import RDates: WeekendCalendar, @rd_str, setcachedcalendar!
import Dates: Date

setcachedcalendar!(CALENDARS, "TARGET", WeekendCalendar() + RuleBasedCalendar([
    # New Years Day
    PeriodicCalendarRule(rd"1y", rd"1JAN"),
    # Labour Day
    WindowCalendarRule(PeriodicCalendarRule(rd"1y", rd"1MAY"); from=Date(2000,1,1)),
    # Good Friday
    WindowCalendarRule(PeriodicCalendarRule(rd"1y", rd"0E-1FRI"); from=Date(2000,1,1)),
    # Easter Monday
    WindowCalendarRule(PeriodicCalendarRule(rd"1y", rd"0E+1MON"); from=Date(2000,1,1)),
    # Christmas Day
    PeriodicCalendarRule(rd"1y", rd"25DEC"),
    # Day of Goodwill
    WindowCalendarRule(PeriodicCalendarRule(rd"1y", rd"26DEC"); from=Date(2000,1,1)),
    # End of Year
    ExplicitDateRule(inclusions=[Date(1998,12,31), Date(1999,12,31), Date(2001,12,31)]),
]))
