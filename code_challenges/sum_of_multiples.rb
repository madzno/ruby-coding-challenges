class SumOfMultiples
  attr_reader :numbers_set

  def initialize(*num)
    @numbers_set = num.empty? ? [3, 5] : num
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  def to(number)
    multiples = get_multiples(numbers_set, number)
    multiples.uniq.sum
  end

  private

  def get_multiples(set, number)
    multiples = []

    set.each do |num|
      1.upto(number) do |multiplyer|
        result = num * multiplyer
        multiples << result if result < number
        break if result >= number
      end
    end

    multiples
  end
end
