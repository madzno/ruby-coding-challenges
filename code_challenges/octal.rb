=begin
Class = Octal

Constructor
- takes one argument, a string
- assigns string to @num instance variable

To_decimal
- First need to check that input is a valid number
 - if string to_i is equal to 0, the input is not a valid number
 - if the string includes the digits 8 or 9 then it is not a valid number
 - if not valid, return 0
- rest of to_decimal pedac

Input= a string
Output = a number, that number as an octal

233
[3, 3, 2]
[8^0, 8^1, 8^2]

10
[0, 1]
[0*8^0, 1*8^1]
8

2047
[7, 4, 0, 2]
[7*(8**0), 4*(8**1), 0, 2*(8**3)]
7 + 32 + 0 + 1024 = 1063

- convert the input string to an integer
- split the integer into an array of its digits (reversed)
- transform each digit in the array by;
  - mutliplying the current num by 8 squared by the index
- sum the transformed array
- return that sum

=end

class Octal
  def initialize(string)
    @value = string
  end

  def to_decimal
    return 0 if invalid_number?
    digits = @value.to_i.digits

    digits.map.with_index do |num, idx|
      num * (8**idx)
    end.sum
  end

  def invalid_number?
    @value.match?(/[^0-7]/)
  end
end
