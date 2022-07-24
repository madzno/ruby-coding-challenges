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

Algorithm clock#at
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
3061.divmod(60) = [51, 1]
10 + 51


Algorithm clock#+
- define a method + that takes one argument, an integer
-
=end


