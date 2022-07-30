class CustomSet
  def initialize(arr= [])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other_set)
    set.all? { |num| other_set.set.include?(num) }
  end

  def disjoint?(other_set)
    set.none? { |num| other_set.set.include?(num) }
  end

  def eql?(other_set)
    if set.empty? || other_set.empty?
      set.empty? && other_set.empty?
    else
      subset?(other_set)
    end
  end

  def add(num)
    set << num unless set.include?(num)
    self
  end

  def ==(other_set)
    set == other_set.set
  end

  def intersection(other_set)
    result_arr = []
    set.each do |num|
      result_arr << num if other_set.set.include?(num)
    end
    CustomSet.new(result_arr)
  end

  def difference(other_set)
    result_arr = []
    set.each do |num|
      result_arr << num unless other_set.set.include?(num)
    end
    CustomSet.new(result_arr)
  end

  def union(other_set)
    result_arr = set.clone
    other_set.set.each do |num|
      result_arr << num unless result_arr.include?(num)
    end
    CustomSet.new(result_arr.sort)
  end

  protected

  attr_reader :set
end
