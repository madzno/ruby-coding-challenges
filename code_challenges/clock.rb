=begin

Class - Clock

Methods -

instance method clock#==
instance method clock#at
instance method clock#+
instance method clock#-

Instance method clock#at
Input = one OR two integers
Output = a string representing the current time

Rules
- First Argument represents the Hours and Second argument represents the
minutes
- If no second argument given, the minutes are 0
- format is 'hour:minutes'

Test Cases
Input 8
Output '08:00'

Input 11, 9
Output '11:09'

Data structure
String

Getters and Setters
@minutes, @hours

Algorithm clock#at (**class method**)
- define a method at that takes two integer arguments, the second
argument is defaulted to 0

- assign first argument (hours) to @hours (if 24, hours are 0)
- assign second argument (minutes) to @minutes (if 60, minutes are 0)

- first argument can be 0-24 (military time)
- 0 or 24 represents midnight
- 1 - 12 represents 1AM - 12 PM
- 13 - 24 represents 1PM - midnight
- if hours are 13-24, pass to military_time method
  - military_time method
  - 24 returns 0
  - all other numbers return number - 12
- second argument can be 0-60
  - if 60, minutes = 0

- return a string format('%02:%02d', hours, minutes)

Algorithm clock#==
- define a method == that takes one argument other_clock (another clock object)
- the string return value of at == the return value of other_clock.at

PEDAC clock#+
Input = called on a clock object and passed in an integer
Output = a string representing the new time

Rules
- can be a small number or a large number 3 and 3061
- for numbers >= 60 you are adding a whole hour
- for numbers < 60 you are just adding minutes

Test Cases
Clock.at(10) + 3
"10:03"
@hours = 10
@minutes = 0
if # < 61 you just add 3 to minutes
and then call clock.at(@hours, @minutes)

Clock.at(10) + 61
"11:01"
@hours = 10
@minutes = 0
if # >= 60
- 61.divmod(60) = [1, 1]
- add first # to hours and second # to minutes
call clock.at(@hours, @minutes)


Clock.at(23, 30) + 60
"11:30" + 60,
"00:30"
@hours = 23
@minutes = 30
- if # >=  60 you divmod the #
60.divmod(60) = [1, 0]
first # added to hrs and second to minutes
call clock.at(@hours, @minutes)

Clock.at(10) + 3061
"10:00" + 3061
@hours = 10
@minutes = 0
- if # > 1440
- divide the # by 1440
- subtract from the number (1440 * the result of the 1440 divison)
- divmod that result
add first # to @hours and seocnd # to @minutes

Algorithm clock#+
- define a method + that takes one argument, an integer
- If number is > 1440
- assign local variable days to the number / 1440
- subtract from number (1440 * days)
- number.divmod(60) =[num_one, num_two]
- @hours += num_one
- @minutes += num_two

- If number is >= 60
- number.divmod(60) = [num_one, num_two]
- @hours += num_one
- @minutes += num_two

- else
- @minutes += num_two

return the result of calling at(minutes, hours)

PEDAC clock#-

Test cases
Clock.at(0)
@hours = 0
@minutes = 0

Subtracting 50
Result is "23:10"
@hours = 23 0 - 60 subtract 1 from hrs
@minutes = 10 (60 - 50) = 10

# 2
Clock.at(10, 30) - 5
@hours = 10
@minutes = 30

Subtracting 5
Result is "10:25"
@hours = 10
@minutes = 25 (30 - 5) = 25

#3
Clock.at(10) - 90
@hours = 10
@minutes = 0

Subtracting 90
Result is "08:30"
@hours = 8 (-2)
@minutes = 30 (-30)

#4
Clock.at(0, 30) - 60
@hours = 0
@minutes = 30

Subtracting 60
Result is "23:30"
@hours = 23 (-1)
@minutes = 30 (-0)

#5
Clock.at(10) - 3061
Result is "06:59"
@hours = 6
@minutes = 59

Algorithm
- define a method - that takes an integer as an argument
- if @hours == 0, reasign it to 24
- if @minutes == 0, reasign it to 60

- if integer is < 60 && hours != 24
    @minutes -= integer
- if integer is < 60 && hours == 24
    @hours = 23
    @mionutes -= integer
- if integer is (60...1440)

=end


class Clock
  attr_accessor :hours, :minutes

  ONE_DAY = 24 * 60

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes= 0)
    new(hours, minutes)
  end

  def ==(other_clock)
    @hours == other_clock.hours && @minutes == other_clock.minutes
  end

  def +(integer)
    if integer >= ONE_DAY
      days = integer / ONE_DAY
      integer -= (ONE_DAY * days)
      hours, minutes = integer.divmod(60)
      @hours += hours
      @minutes += minutes
    elsif integer >= 60
      hours, minutes = integer.divmod(60)
      @hours += hours
      @minutes += minutes
    else
      @minutes += integer
    end
    self.class.new(@hours, @minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end
end
