class CustomSet
  attr_reader :set

  def initialize(arr= [])
    @set = arr
  end

  def empty?
    return true if @set.empty?
    false
  end

  def contains?(num)
    return true if @set.include?(num)
    false
  end

  def subset?(other_set)
    @set.all? { |num| other_set.set.include?(num) }
  end

  def disjoint?(other_set)
    return false if @set.any? { |num| other_set.set.include?(num) }
    true
  end

  def eql?(other_set)
    if @set.empty? || other_set.empty?
      return true if @set.empty? && other_set.empty?
      false
    else
      subset?(other_set)
    end
  end

  def add(num)
    @set << num unless @set.include?(num)
    self
  end

  def ==(other_set)
    @set == other_set.set
  end

  def intersection(other_set)
    result_arr = []
    @set.each do |num|
      result_arr << num if other_set.set.include?(num)
    end
    CustomSet.new(result_arr)
  end

  def difference(other_set)
    result_arr = []
    @set.each do |num|
      result_arr << num unless other_set.set.include?(num)
    end
    CustomSet.new(result_arr)
  end

  def union(other_set)
    result_arr = @set.clone
    other_set.set.each do |num|
      result_arr << num unless result_arr.include?(num)
    end
    CustomSet.new(result_arr.sort)
  end
end
