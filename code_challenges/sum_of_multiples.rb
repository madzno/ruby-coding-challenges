=begin

Class - SumOfMultiples
Methods
- Constructor
- to

PEDAC Constructor
- takes three optional number arguments
- default all the arguments to 0
- if num1, num2, and num3 are all 0, then @number_set = [3, 5]
- otherwise @number_set = [num1, num2, num3]

PEDAC to
- Input: An integer
- Output: An integer

Rules
- Define a method 'to' that takes a single integer argument
- initialize an empty array called multiples
- initialize a variable index to 0
- iterate through the @number_set array
   - assign a variable multiplyer to 1
   - initialize a loop
   - multiply the current number in the @number_set array by the multiplyer and assign this number to result
     - if result is less than the input number
         - add result to the input array
         - add 1 to multiplier
    - if result is equal to or greater than the input number
         - break out of the iteration and move on to the next number
   - add 1 to the index
   - if the index is equal to or greater than the length of the array break out of the loop
- sum up the multiples array
- return that sum

Examples
Num 1 = 7
Num 2 = 13
Num 3 = 17

Main num = 20

7, 13 and 17 are less than 20
multiples of 7, 7, 14
multiples of 13, 13
multiples of 17, 17
51
=end

class SumOfMultiples
  attr_reader :numbers_set

  def initialize(*num)
    if num.count > 0
      @numbers_set = *num
    else
      @numbers_set = [3, 5]
    end
  end

  def to(number)
  end
end

