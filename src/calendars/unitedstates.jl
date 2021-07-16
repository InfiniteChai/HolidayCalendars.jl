import RDates: WeekendCalendar, @rd_str, setcachedcalendar!, calendar
import Dates: Date

setcachedcalendar!(CALENDARS, "US/SETTLEMENT", WeekendCalendar() + RuleBasedCalendar([
    # New Year's Day
    PeriodicCalendarRule(rd"1y", rd"1JAN@WEEKEND[NEAR]"; cal_mgr=CALENDARS),
    # New Year's Day (handle case where day falls back into this year)
    PeriodicCalendarRule(rd"1y", rd"1y+1JAN@WEEKEND[NEAR]"; cal_mgr=CALENDARS),
    # # Martin Luther King Jr Birthday
    WindowCalendarRule(PeriodicCalendarRule(rd"1y", rd"1JAN+3rd MON"); from=Date(1983,1,1)),
    # # Washingthon's Birthday
    PeriodicCalendarRule(rd"1y", rd"1FEB+3rd MON"),
    # # Memorial Day
    PeriodicCalendarRule(rd"1y", rd"1MAY+Last MON"),
    # # Juneteenth
    WindowCalendarRule(PeriodicCalendarRule(rd"1y", rd"19JUN@WEEKEND[NEAR]"; cal_mgr=CALENDARS); from=Date(2021,1,1)),
    # # Independence Day
    PeriodicCalendarRule(rd"1y", rd"4JUL@WEEKEND[NEAR]"; cal_mgr=CALENDARS),
    # # Labor Day
    PeriodicCalendarRule(rd"1y", rd"1SEP+1st MON"),
    # # Columbus Day
    PeriodicCalendarRule(rd"1y", rd"1OCT+2nd MON"),
    # # Veteran's Day
    PeriodicCalendarRule(rd"1y", rd"11NOV@WEEKEND[NEAR]"; cal_mgr=CALENDARS),
    # # Thanksgiving Day
    PeriodicCalendarRule(rd"1y", rd"1NOV+4th THU"),
    # # Christmas
    PeriodicCalendarRule(rd"1y", rd"25DEC@WEEKEND[NEAR]"; cal_mgr=CALENDARS),
]))

setcachedcalendar!(CALENDARS, "NEW YORK", calendar(CALENDARS, "US/SETTLEMENT"))
