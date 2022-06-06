def times(number)
  counter = 0
  loop do
    yield(counter)
    counter += 1
    break if counter >= number
  end
  number
end

p times(5) { |num| puts num }
