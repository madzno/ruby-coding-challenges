=begin

Class = Meetup

Constructor
- takes two argument
- first argument is the year (2012, 2013, ect.)
- seconda argument is the month (1-12) (January-February)

Instance Method 'Day'
Input = two string arguments
Output= a Date object that represents the date of that meetup

Rules
- First string will be day of the week 'Monday' - 'Sunday' and
case DOES NOT MATTER
- Second string will be descriptors 'first', 'second', 'third',
'fourth', 'fifth', 'last', and 'teenth' that describe which
monday/tuesday/ect we want - also CASE DOES NOT MATTER
- 'teenth' - there are exactly 7 days that end in
teenth in a month, therefore its guarenteed that each day of the week
monday, tuesday, wednesday, thursday, ect have exactly one date that is a 'teenth'
?? need to clarify this more with test cases
- The fifth day of the month may not happen every month

Test Cases

- Need to 'require' Date module
- Date.civil(2013, 3, 4)
- Date.civil(year, month, day)
- year and month are given to you inm the constructor, your job is to figure out the day

#1
Input = 'Monday', 'first'
Output Date.civil(2013, 3, 4)

Find what type of day the first day of that month is
Date.new.(year, month, 1) # => 5 (0= Sunday, 1= Monday, 2 = Tuesday, 3 = Wednesday, 4 = Thursday, 5 = Friday, 6 = Saturday)
So we know the first day of the month started w/ Friday

Next, need to know how many days are in the month 28, 29, 30, 31

For first, add 1 to the day of the date object
when Date.(year, month, day).monday? returns true, assign the day number
to the local variable meet up date

ALGO "FIRST"
- define a method day that takes two string arguments day_of_the_week ("Monday"), descriptor("first")

-if day_of_the_week is monday and descriptor is first,
- initialize a local variable day_of_meetup to 0
- From 1 up to 31, assign the number to the day of the date object Date.(@year, @month, day)
- if Date.(@year, @month, current_day).day_of_the_week? returns true, add the current_day to
day_of_meetup and break out of the loop
- return the date object Date.(year, month, date_of_meetup)


=end
require 'date'

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_the_week, descriptor)
    first_monday
  end

  def first_monday
    date = 0

    1.upto(31) do |current_day|
      if Date.new(year, month, current_day).monday?
        date += current_day
      end
    end

    date
  end

end


