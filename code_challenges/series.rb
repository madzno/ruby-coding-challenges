class Series
  def initialize(string)
    @digits_string = string
  end

  def slices(num)
    validate_num(num)
    digits_array = @digits_string.chars.map(&:to_i)
    results_array = []

    digits_array.each_with_index do |_, index|
      break if (index + (num - 1)) >= digits_array.length
      results_array << digits_array[index..(index + (num - 1))]
    end

    results_array
  end

  private

  def validate_num(num)
    raise ArgumentError if num > @digits_string.length
  end
end
