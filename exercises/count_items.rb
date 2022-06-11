=begin
Problem
Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array
element passed to it. The method should return a count of the number of times the block returns `true`

-block returns true or false for each element
- method should return the count of the number of times the block returns true
=end

def count(arr)
  count = 0
  arr.each { |el| count += 1 if yield(el) }
  count
end

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
