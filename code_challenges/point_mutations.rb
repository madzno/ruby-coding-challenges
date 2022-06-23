=begin

Class = DNA

Methods
initialize - one argument, the DNA strand which is a String
hamming_distance

Hamming_distance Method PEDAC

Problem
Compute the hamming distance between the DNA object that the method is called on
and the DNA String that is passed in as an argument

Input= a String
Output = An integer

Clarifying Q's
What is a Hamming Distance?
- Order Matters
- If the character at the current index of the calling string is DIFFERENT from the character
at the current index of the string passed in as an argument, add 1 to the Hamming Distance
- Only 4 different characters in a DNA string ["C", "A", "T", "G"]
- Return Hamming distance (an integer)
Empty Strings?
If you have two empty strings, hamming distance is 0

Rules
- 4 characters in a DNA String - "C" "A" "T" "G"
- add 1 to the hamming distance when the character in the calling string is different than
the argument string
- if you have two strings of UNEQUAL Lengths
 - only compute hamming distance up to the shorter lengthed string
 - what does this mean?
 - StringA Is shorter than StringB, stop iterating when you get to the end of StringA
 - StringB Is shorter than StringA, stop iterating when you get to the end of StringB
 - *important that just stops iterating and doesn't actually shorten either string*
- Hamming distance is defaulted to 0

EXAMPLES
['G', 'G', 'A', 'C', 'G']
['G', 'G', 'T', 'C' 'G']
Index 2 is different so Hamming Distance is 1

['A', 'C', 'C', 'A', 'G', 'G', 'G']
['A', 'C', 'T', 'A', 'T', 'G', 'G']
Index 2 and 4 are different so Hamming Distance is 2

['A A A C T A G G G']
['A G G C T A G C G G T A G G A C']
Stops iterating @ index 8
Hamming Distance is 3

Data Structure - Array

Algo

1. Define a Method Hamming Distance that takes one string argument 'strand'
2. Get the final index of the shortest string
  - Compare the lengths of the calling string (current @dna_strand) and the string passed in as an argument
  - If @strand is smaller OR equal, assign the last_index local variable to the length of @strand minus 1
  - if strand is smaller, assign the last_index local variable to the length of strand minus 1
3. Initialize a local variable hamming_distance to the integer 0
4. Iterate through @strand by character with index
5. if the character at the current index is different than the character at strand converted into an array of characters index, add
1 to the hamming distance
6. break when index is equal to last_index
7. return the hamming distance

=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    final_index = get_final_index(other_strand)
    hamming_distance = 0

    @strand.each_char.with_index do |char, index|
      hamming_distance += 1 unless char == other_strand.chars[index]
      break if index == final_index
    end

    hamming_distance
  end

  private

  def get_final_index(string)
    @strand.length < string.length ? (@strand.length - 1) : (string.length - 1)
  end
end


