def array_each(arr)
  index = 0

  loop do
    yield(arr[index])
    index += 1
    break if index >= arr.length
  end

  arr
end

array = [1, 2, 3]

p array.each { |num| puts num }
