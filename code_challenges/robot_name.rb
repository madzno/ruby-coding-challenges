=begin

Class
Robot
?Factory - Factory has robots

Methods
Constructor
name instance getter method that returns the robot name
reset instance setter method that changes the robot name

Rules from Problem
Need to avoid the same name twice
Names need to follow this REGEX /^[A-Z]{2}\d{3}$/

Robot Class
@@robots_names = []
LETTERS = ('A'..'Z').to_a
DIGITS = ('0'..'9').to_a
attr_reader :name

Constructor
@name is assigned to the return value of set_initial_name helper method
add_name is invoked

- String random letter + random letter + digit + digit + digit
- String cannot be the same name as another robot string

set_initial_name helper method
- initialize a local variable name_string to an empty string
- initialize a loop
- name_string = LETTERS.sample + LETTERS.sample + DIGITS.sample +
DIGITS.sample + DIGITS.sample (can be helper method)
- if name_string is not included in @@robots_name then break out of the loop
(can be helper method)
- return name_string

reset_name instance method
- assign current name string to a local variable first_name
- remove first_name from @@robots_names
- initialize a loop
- @name = LETTERS.sample + LETTERS.sample + DIGITS.sample +
DIGITS.sample + DITIGS.sample
- if @name is not equal to first_name and is not included in @@robots
name then break out of the loop

add_name instance method
- @name is added to the @@robots_names class variable

=end

class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  attr_reader :name

  @@robot_names = []

  def initialize
    @name = set_initial_name
    @@robot_names << @name
  end

  def set_initial_name
    name_string = ''
    loop do
      name_string = random_name
      break if unique_name?(name_string)
    end
    name_string
  end

  def reset
    initial_name = @name
    @@robot_names.delete(initial_name)
    loop do
      @name = random_name
      break if @name != initial_name && unique_name?(@name)
    end
  end

  private

  def random_name
    LETTERS.sample + LETTERS.sample + DIGITS.sample + DIGITS.sample +
      DIGITS.sample
  end

  def unique_name?(name_string)
    !@@robot_names.include?(name_string)
  end
end
