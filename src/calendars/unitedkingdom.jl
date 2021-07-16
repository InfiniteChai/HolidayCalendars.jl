import RDates: WeekendCalendar, @rd_str, setcachedcalendar!, calendar
import Dates: Date

setcachedcalendar!(CALENDARS, "UK/SETTLEMENT", WeekendCalendar() + RuleBasedCalendar([
    # New Year's Day
    PeriodicCalendarRule(rd"1y", rd"1JAN@WEEKEND[NBD]"; cal_mgr=CALENDARS),
    # Good Friday
    PeriodicCalendarRule(rd"1y", rd"0E-1FRI"),
    # Easter Monday
    PeriodicCalendarRule(rd"1y", rd"0E+1MON"),
    # Early May Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1MAY+1st MON"),
    # Spring Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1MAY+Last MON"),
    # Late Summer Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1AUG+Last MON"),
    # Christmas Day
    PeriodicCalendarRule(rd"1y", rd"25DEC+0b@WEEKEND"; cal_mgr=CALENDARS),
    # Boxing Day
    PeriodicCalendarRule(rd"1y", rd"25DEC+1b@WEEKEND"; cal_mgr=CALENDARS),
    # 50th VE Day Anniversary
    ExplicitDateRule(inclusions=[Date(1995,5,8)], exclusions=[Date(1995,5,1)]),
    # Golden Jubilee
    ExplicitDateRule(inclusions=[Date(2002,6,3), Date(2002,6,4)], exclusions=[Date(2002,5,27)]),
    # 2011 Royal Wedding
    ExplicitDateRule(inclusions=[Date(2011,4,29)]),
    # Diamond Jubilee
    ExplicitDateRule(inclusions=[Date(2012,6,4), Date(2012,6,5)], exclusions=[Date(2002,5,28)]),
    # 75th VE Day Anniversary
    ExplicitDateRule(inclusions=[Date(2020,5,8)], exclusions=[Date(2020,5,4)]),
    # Platinum Jubilee
    ExplicitDateRule(inclusions=[Date(2022,6,2), Date(2022,6,3)], exclusions=[Date(2022,5,30)])
]))

setcachedcalendar!(CALENDARS, "LONDON", calendar(CALENDARS, "UK/SETTLEMENT"))

setcachedcalendar!(CALENDARS, "UK/STOCK EXCHANGE", WeekendCalendar() + RuleBasedCalendar([
    # New Year's Day
    PeriodicCalendarRule(rd"1y", rd"1JAN@WEEKEND[NBD]"; cal_mgr=CALENDARS),
    # Good Friday
    PeriodicCalendarRule(rd"1y", rd"0E-1FRI"),
    # Easter Monday
    PeriodicCalendarRule(rd"1y", rd"0E+1MON"),
    # Early May Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1MAY+1st MON"),
    # Spring Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1MAY+Last MON"),
    # Late Summer Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1AUG+Last MON"),
    # Christmas Day
    PeriodicCalendarRule(rd"1y", rd"25DEC+0b@WEEKEND"; cal_mgr=CALENDARS),
    # Boxing Day
    PeriodicCalendarRule(rd"1y", rd"25DEC+1b@WEEKEND"; cal_mgr=CALENDARS),
    # 50th VE Day Anniversary
    ExplicitDateRule(inclusions=[Date(1995,5,8)], exclusions=[Date(1995,5,1)]),
    # Golden Jubilee
    ExplicitDateRule(inclusions=[Date(2002,6,3), Date(2002,6,4)], exclusions=[Date(2002,5,27)]),
    # 2011 Royal Wedding
    ExplicitDateRule(inclusions=[Date(2011,4,29)]),
    # Diamond Jubilee
    ExplicitDateRule(inclusions=[Date(2012,6,4), Date(2012,6,5)], exclusions=[Date(2002,5,28)]),
    # 75th VE Day Anniversary
    ExplicitDateRule(inclusions=[Date(2020,5,8)], exclusions=[Date(2020,5,4)]),
    # Platinum Jubilee
    ExplicitDateRule(inclusions=[Date(2022,6,2), Date(2022,6,3)], exclusions=[Date(2022,5,30)]),
    # 31Dec1999
    ExplicitDateRule(inclusions=[Date(1999,12,31)])
]))

setcachedcalendar!(CALENDARS, "UK/LSE", calendar(CALENDARS, "UK/STOCK EXCHANGE"))

setcachedcalendar!(CALENDARS, "UK/METAL EXCHANGE", WeekendCalendar() + RuleBasedCalendar([
    # New Year's Day
    PeriodicCalendarRule(rd"1y", rd"1JAN@WEEKEND[NBD]"; cal_mgr=CALENDARS),
    # Good Friday
    PeriodicCalendarRule(rd"1y", rd"0E-1FRI"),
    # Easter Monday
    PeriodicCalendarRule(rd"1y", rd"0E+1MON"),
    # Early May Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1MAY+1st MON"),
    # Spring Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1MAY+Last MON"),
    # Late Summer Bank Holiday
    PeriodicCalendarRule(rd"1y", rd"1AUG+Last MON"),
    # Christmas Day
    PeriodicCalendarRule(rd"1y", rd"25DEC+0b@WEEKEND"; cal_mgr=CALENDARS),
    # Boxing Day
    PeriodicCalendarRule(rd"1y", rd"25DEC+1b@WEEKEND"; cal_mgr=CALENDARS),
    # 50th VE Day Anniversary
    ExplicitDateRule(inclusions=[Date(1995,5,8)], exclusions=[Date(1995,5,1)]),
    # Golden Jubilee
    ExplicitDateRule(inclusions=[Date(2002,6,3), Date(2002,6,4)], exclusions=[Date(2002,5,27)]),
    # 2011 Royal Wedding
    ExplicitDateRule(inclusions=[Date(2011,4,29)]),
    # Diamond Jubilee
    ExplicitDateRule(inclusions=[Date(2012,6,4), Date(2012,6,5)], exclusions=[Date(2002,5,28)]),
    # 75th VE Day Anniversary
    ExplicitDateRule(inclusions=[Date(2020,5,8)], exclusions=[Date(2020,5,4)]),
    # Platinum Jubilee
    ExplicitDateRule(inclusions=[Date(2022,6,2), Date(2022,6,3)], exclusions=[Date(2022,5,30)]),
    # 31Dec1999
    ExplicitDateRule(inclusions=[Date(1999,12,31)])
]))

setcachedcalendar!(CALENDARS, "UK/LME", calendar(CALENDARS, "UK/METAL EXCHANGE"))
