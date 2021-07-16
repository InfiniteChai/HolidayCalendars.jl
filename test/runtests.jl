using Test
using HolidayCalendars
using Dates: Date, dayofweek
using RDates

@testset "Holiday Calendars" verbose=true begin
    @testset "United Kingdom → Settlements" begin
        holidays_2004 = Set([
            Date(2004,1,1),
            Date(2004,4,9),
            Date(2004,4,12),
            Date(2004,5,3),
            Date(2004,5,31),
            Date(2004,8,30),
            Date(2004,12,27),
            Date(2004,12,28),
        ])

        cal = RDates.calendar(CALENDARS, ["UK/SETTLEMENT"])
        for d in range(Date(2004,1,1), Date(2004,12,31), rd"1b@WEEKEND"; cal_mgr=CALENDARS)
            @test is_holiday(cal, d) == (d in holidays_2004 || dayofweek(d) > 5)
        end

        holidays_2005 = Set([
            Date(2005,1,3),
            Date(2005,3,25),
            Date(2005,3,28),
            Date(2005,5,2),
            Date(2005,5,30),
            Date(2005,8,29),
            Date(2005,12,26),
            Date(2005,12,27),
        ])

        for d in range(Date(2005,1,1), Date(2005,12,31), rd"1b@WEEKEND"; cal_mgr=CALENDARS)
            @test is_holiday(cal, d) == (d in holidays_2005 || dayofweek(d) > 5)
        end

        holidays_2021 = Set([
            Date(2021,1,1),
            Date(2021,4,2),
            Date(2021,4,5),
            Date(2021,5,3),
            Date(2021,5,31),
            Date(2021,8,30),
            Date(2021,12,27),
            Date(2021,12,28),
        ])

        for d in range(Date(2021,1,1), Date(2021,12,31), rd"1b@WEEKEND"; cal_mgr=CALENDARS)
            @test is_holiday(cal, d) == (d in holidays_2021 || dayofweek(d) > 5)
        end


        holidays_2022 = Set([
            Date(2022,1,3),
            Date(2022,4,15),
            Date(2022,4,18),
            Date(2022,5,2),
            Date(2022,6,2),
            Date(2022,6,3),
            Date(2022,8,29),
            Date(2022,12,26),
            Date(2022,12,27),
        ])

        for d in range(Date(2022,1,1), Date(2022,12,31), rd"1b@WEEKEND"; cal_mgr=CALENDARS)
            @test is_holiday(cal, d) == (d in holidays_2022 || dayofweek(d) > 5)
        end
    end
end
