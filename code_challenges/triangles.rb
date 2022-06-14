=begin
Problem: Write a program to detrmine whether a tringle is equilateral, isosceles, or scalene

Explicit Rules
An equilateral triangle has all three sides the same length (side 1 == side 2 == side 3)
An isosceles triangle has exactly two sides of the same length ( side 1 == side 2 || side 2 == side 3 || side 1 == side 3)
A scalene tringle has all sides of different lengths ( side 1 != side 2 != side 3 )
For a shape to be a triangle, all sides must be of length > 0 ( side 1 > 0 && side 2 > 0 && side 3 > 0)
The sum of the lengths of any two sides must be greater than the length of the third side
side1 + side 2 > side 3
side 2 + side 3 > side 1
side 1 + side 3 > side 2

Explicit rules
- sides can be small numbers or large numbers
-sides cannot be negative number or 0

Classes/OOP
A triangle *has* sides

Nouns; triangle sides length

Triangle Class
Sides Class
Length is a attribute of Sides

Rules from Examples/Test Cases

- Class: Triangle
- Initialize: three arguments that represent side1, side2, side3
- .kind returns a string 'equilateral', 'isosceles', 'scalene'
- If arguments to the initialize method are 0 or less than 0 (negative) raise ArgumentError
- The sum of any of the two sides must be greater than the length of the third side or else raise ArgumentError

Data Structure

An array of sides

Algorithm
- Define a class Triangle

- define an initialize method that takes three arguments
- pass all three arguments to the PRIVATE method check sides
- Each of these sides is assigned to @side1, @side2, @side3


-define a kind method that returns the string `equilateral`, `isosceles`, or `scalene`
- if @side1 == @side2 == @side3 return 'equilateral'
- if ( @side 1 == @side 2 || @side 2 == @side 3 || @side 1 == @side 3) return 'isosceles'
- if side 1 != side 2 != side 3 return 'scalene'

-define a private method check sides
- if any of the arguments are <= 0, raise an ArgumentError
- if  arg1 + arg2 < arg3 || arg2 + arg 3 < arg1 || arg1 + arg 3 < arg2, raise an ArgumentError
=end

class Triangle

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    check_sides
  end

  def kind
    case @sides.uniq.length
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end

  private

  def check_sides
    if @sides.any? { |side| side <= 0 }
      raise ArgumentError
    elsif (@sides[0] + @sides[1]) <= @sides[2]
      raise ArgumentError
    end
  end

end
