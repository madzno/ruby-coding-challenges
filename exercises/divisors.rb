=begin
Write a method that returns a list of all fo the divisors of the positive integers passed in as an argument.
The return can be in any sequence you wish.

Problem
Input = an integer
Output = a array of all of the input integer's divisors

What is a divisor?

An integer that divides evenly into the input integer
i.e integer % divisor == 0

Input will be a whole number, but can be a very large number (last example)


Examples
1 ==> [1]
1 % 1 == 0

12 ==> [1, 2, 3, 4, 6, 12]
12 % 1 == 0
12 % 2 == 0
12 % 3 == 0
ect.

Algorithm
- define a method divisors that takes an integer as an argument
- initialize a local variable RESULTS to an empty array
- initialize a local variable counter to 1
- initialize a loop
- if the input integer modulo'd by the counter is equal to 0, append the
counter integer to the RESULTS array
- add 1 to the counter
- break out of the llloop when the counter greater than the input integer
- return the results array

=end

def divisors(integer)
  counter = 1
  results = []

  loop do
    results << counter if integer % counter == 0
    counter += 1
    break if counter > integer
  end

  results
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
