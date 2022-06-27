=begin

Classes
Scrabble

Methods
Constructor
-Takes one argument
- assigns that argument to the instance variable @word

Score
P
Input = a string
Output = an integer representing the score

Rules
- Each Letter has an associated value
- the total score is the sum of all the letter's values
- empty strings, whitespace characters, and nil result in a score of 0
- scores are case insensitive (upper and lowercase versions of the same letter have the same score)

Test Cases

CABBAGE
3 + 1 + 3 + 3 + 1 + 2 + 1 = 14

Data structure
Hash to keep letters with their associated value
Regex character classes to match the letters

Algorithm
Define an instance method score
Initialize a variable results to the integer 0
Split @word into an array of characters
iterate through the array of characters
when the characters a,e,i,o,u,l,n,r,s,t (uppercase or lowercase) match the current character add 1 to the score
when the characters d, g match the current character add 2
ect.
return the results


=end

class Scrabble
  NIL_SCORE = 0

  def initialize(string)
    @word = string
  end

  def score
    return NIL_SCORE if word.nil?
    characters = word.chars
    calculate_score(characters)
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  private

  attr_reader :word

  def calculate_score(character_arr)
    results = 0

    character_arr.each do |char|
      case
      when char.match?(/[aeioulnrst]/i) then results += 1
      when char.match?(/[dg]/i)         then results += 2
      when char.match?(/[bcmp]/i)       then results += 3
      when char.match?(/[fhvwy]/i)      then results += 4
      when char.match?(/[k]/i)          then results += 5
      when char.match?(/[jx]/i)         then results += 8
      when char.match?(/[qz]/i)         then results += 10
      end
    end

    results
  end
end
