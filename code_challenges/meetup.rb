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

ALGO
- define a method day that takes two string arguments day_of_the_week ("Monday"), descriptor("first")
- assign a local variable 'day_of_the_week_flag' to the day_of_the_week downcased and converted to a symbol
- assign a local variable 'descriptor_flag' to the descriptor downcased and converted to a symbol
- figure the days in the current month

- days_in_month
- MONTHS_WITH_THIRTY_DAYS = [4, 6, 9, 11]
- MONTHS_WITH_THIRTY_ONE_DAYS = [1, 3, 5, 7, 8, 10, 12]
- if MONTHS_WITH_THIRTY_DAYS.include?(@month) then days_in_month = 31
- if MONTHS_WITH_THIRTY_DAYS.include?(@month) then days_in_month = 30
- if @month == 2 then
- if @year.leap? days_in_month = 29
  else days_in_month = 28

- assign a local variable date_of_meetup to the return value of a case statement about the day of the week
- when :monday then mondays(descritpor)
- when :tuesday then tuesdays(descriptor)
- when :wednesday then wednesdays(descriptor)
- when :thursday then thursdays(descriptor)
- when :friday then fridays(descriptor)
- when :saturday then saturdays(descriptor)
- when :sunday then sundays(descriptor)

- for first, second, third, fourth, fifth, last
- initialize a local variable mondays (or tuesdays, ect.) to an empty array
- From 1 up to days_in_month, initialize a block parameter current_day and create a new date object (Date.new)
with the year, month, and current_day
- if Date.day_of_the_week? returns true, add the current_day to the Mondays (or tuesdays, ect.) Array
- assign the local variable date to the return value of a case statement
- when descriptor is :first then Mondays.first
- when descriptor is :second then Mondays[1]
- when descriptor is :third then Mondays[2]
- when descriptor is :fourth then Mondays[3]
- when descriptor is :fifth then Mondays[4] (may be nil)
- when descriptor is :last then Mondays.last


=end
require 'date'

class Meetup
  attr_reader :year, :month

  MONTHS_WITH_THIRTY_DAYS = [4, 6, 9, 11]
  MONTHS_WITH_THIRTY_ONE_DAYS = [1, 3, 5, 7, 8, 10, 12]

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_the_week, descriptor)
    day_of_the_week_flag = day_of_the_week.downcase.to_sym
    descriptor_flag = descriptor.downcase.to_sym
    days_in_month = find_max_days

    if [:first, :second, :third, :fourth, :fifth, :last].include?(descriptor_flag)
      day_of_meetup = case day_of_the_week_flag
                      when :monday    then mondays(descriptor_flag, days_in_month)
                      when :tuesday   then tuesdays(descriptor_flag, days_in_month)
                      when :wednesday then wednesdays(descriptor_flag, days_in_month)
                      when :thursday  then thursdays(descriptor_flag, days_in_month)
                      when :friday    then fridays(descriptor_flag, days_in_month)
                      when :saturday  then saturdays(descriptor, days_in_month)
                      when :sunday    then sundays(descriptor, days_in_month)
                      end
    end
    day_of_meetup
  end

  def find_max_days
    if MONTHS_WITH_THIRTY_DAYS.include?(month)
      30
    elsif MONTHS_WITH_THIRTY_ONE_DAYS.include?(month)
      31
    else
      if Date.new(year).leap?
        29
      else
        28
      end
    end
  end

  def mondays(descriptor_flag, days_in_month)
    mondays_arr = []

    1.upto(days_in_month) do |current_day|
      mondays_arr << current_day if Date.new(year, month, current_day).monday?
    end

    date = case descriptor_flag
           when :first  then mondays_arr.first
           when :second then mondays_arr[1]
           when :third  then mondays_arr[2]
           when :fourth then mondays_arr[3]
           when :fifth  then mondays_arr[4]
           when :last   then mondays_arr.last
           end
    date
  end

end

p Meetup.new(2016, 3).day("Monday", "last")

# to do when back - build out the tuesdays,w ednesdays, ect methods
# figure out how to return nil when there is no fifth
# figure out 'teenth'
