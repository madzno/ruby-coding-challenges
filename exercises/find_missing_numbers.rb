=begin
Problem = Write a method that takes a sorted arry as an argument, and returns an array
that includes all of the missing integers (in order) between the first and last elements of the argument

Input = a sorted array
Output = an array of the missing numbers
What is a missing number?
A whole integer that numerically appears between the current integer and the next integer (index + 1)
but is not in the input array itself

Rules
- whole numbers
- input arry can have negative or positive numbers
- if no missing numbers, return an empty array

Examples
[-3, -2, 1, 5] => [-1, 0, 2, 3, 4]
-1 and 0 missing between -2 and 1
2, 3, 4 missing in betwen 1 and 5

[1, 2, 3, 4] => []
No missing numbers, empty array returned

[1, 5] => [2, 3, 4]
2, 3, 4 are missing

[6] +> []
No missing numbers, empty array returned

Algo
- define a method missing that takes an array ARR as input
- initialize a local variable RESULT to an empty array []
For each element in the input array,
  - iterate from element up to the next element (index + 1)
  - for the current integer, if the input array does not include the current integer
  add that integer to the results array
return the results array
=end

def missing(arr)
  results = []
  arr.each_with_index do |num, index|
    if index < arr.length - 1
      num.upto(arr[index + 1]) do |num2|
        results << num2 unless arr.include?(num2)
      end
    end
  end
  results
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
