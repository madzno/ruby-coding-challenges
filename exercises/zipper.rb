=begin
P
Input ; two arrays
Output ; A new multidimensional array

Rules
Each element in output array is a two-element array where the
first element is the corresponding index in the first array
and the second element is the correspoinding index in the second array
Performs this action in order

Examples
zip(arr1 arr2)
arr1 = [1, 2, 3]
arr2 = [4, 5, 6]
[[arr1[0], arr2[0]], [arr1[1], arr2[1]], [arr1[2], arr2[2]]]

Algo
- define a method zip that takes two array arguments - arr1 and arr2
- initialze a local variable result_arr to an empty array
- iterate through the input arr1 by index
- for each element in arr1 append an array [el, arr2[idx]] to the result array
- return the result array

=end

def zip(arr1, arr2)
  result_arr = []
  arr1.each_with_index do |num, indx|
    result_arr << [num, arr2[indx]]
  end
  result_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
