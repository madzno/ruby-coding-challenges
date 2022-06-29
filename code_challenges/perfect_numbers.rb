=begin
Class PerfectNumber

One method
Class method - classify
- Raise StandardError if input num is less than or equal to 0

Problem
Input = a whole number
Output = a string, 'deficient', 'perfect', or 'abundant'

Rules
- perfect number is when the sum of its positive divisors are equal to the number
- deficient number is when the sum of its positive divisors are less than than the number
- abundant number is when the sum of its positive divisors is greater than the number
- divisors must be positive
- divisors do NOT include the divisor itself

Examples

13 - deficient
1 is its ownly divisor

28 - perfect
1 + 2 + 4 + 7 + 14 = 28

12 - abundant
1 + 2 + 6 + 3 + 4 = 16

Data structure

Algo
- initialize a class method classify that takes one integer argument 'num'
- validate num method
- raise an StandardError if num is less than or equal to 0

- divisors method
- get all the positive divisors of num, excluding num itself
- initialize an empty array named divisors
- From 1 up to the number add the current number to the divisors array if it divids into num with no remainder
- remove num itself from the divisors array

-classify method
- sum up the numbers in the divisors array
- compare that sum to num
- if sum == num, perfect
- if sum < num, deficient
- if summ > num, abundant
=end

class PerfectNumber
  def self.classify(num)
    validate_num(num)
    sum = get_sum_of_divisors(num)

    case
    when sum == num then 'perfect'
    when sum < num  then 'deficient'
    when sum > num  then 'abundant'
    end
  end

  class << self
    private

    def validate_num(num)
      raise StandardError if num <= 0
    end

    def get_sum_of_divisors(num)
      divisors = []
      1.upto(num - 1) do |number|
        divisors << number if num % number == 0
      end
      divisors.sum
    end
  end
end
