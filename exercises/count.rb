=begin

Problem

Part A - the arguments
Method count takes a list of items via arguments
If the list is empty, count should return 0
Will need default arguments

Part B-
count returns an integer, it iterates over the members of a collection,
passes each element over to a block and returns a truthy vallue
- will need to place argument elements into a data structure
- will need yield for the implicit block

Examples

1, 3, 6 => 2 b/c 1 and 3 are odd

1, 3, 6 => 0 b/c none of the numbers are greater than 6

1, 3, 6 => 3 returns 3 bcause value - 6 always returns a truthly value


Data structure

An array
[num1, num2, num3]

Algo
- define a method count that takes three arguments with three default values of 0
- define an array arr that holds the three argument values as elements [num1, num2, num3]
- initialize a local variable counter to 0
- if all three elements are equal to 0 (i.e the argument list is empty ) return counter
- iterate through arr and if the return value of passing the current element to the block is truthy, add
1 to counter
- return counter
=end

def count(num1 = 0, num2 = 0, num3 = 0)
  arr = [num1, num2, num3]
  counter = 0
  return counter if arr.all? { |num| num == 0 }

  arr.each do |el|
    counter += 1 if yield(el)
  end

  counter
end



p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
