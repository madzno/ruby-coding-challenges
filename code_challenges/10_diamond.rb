=begin
One Class Diamond

One Class Method make_diamond that takes a string letter as input

make_diamond method PEDAC

Input = A string
Output = a string

Test Cases
# all strings end with \n character
# all strings are 9 characters in length
    string = "    A    \n"\ # 4 white-spaces on each side, 0 in middle
             "   B B   \n"\ # 3 white-spaces on each side, 1 in middle
             "  C   C  \n"\ # 2 white-spaces on each side, 3 in middle
             " D     D \n"\ # 1 white-space on each side, 5 in middle
             "E       E\n"\ # 0 white-space on each side, 7 in middle
             " D     D \n"\ # 1 white-space on each side, 5 in middle
             "  C   C  \n"\ # 2 white-spaces on each side, 3 in middle
             "   B B   \n"\ # 3 white-spoaces on each side, 1 in middle
             "    A    \n"  # 4 white-spaces on each side, 0 in middle

[A, B, C, D, E] Index * 2 + 1 = string length (9)

    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\ # string length = 5
             " B B \n"\
             "  A  \n"
[A, B, C, D, E]
Index * 2 + 1 = string section length (before the newline) (5)

"A\n"
Index * 2 + 1 = string secon length (before the newline) (1)

assert_equal " A \nB B\n A \n"
Index * 2 + 1

Rule = string section before the newline is equal to the index of the input
letter * 2 + 1

Build out the String until it reaches that sub section length and then add a
new line and go to the next string section

Structure of string section is
side spaces + letter + middle spaces + letter (except for A!) + side spaces
+ newline

Side spaces
-start at (string section length / 2) and then for each line up to and
including the line when the input letter is reached subtract 1

Letter
- start at index 0 letter (A) up to the index of the input letter (E)

Middle Spaces
- Start with 1 at the B line and then add 2 until you reach the length of
the string section - 2

Data Structure
['A', B, C, D, E, F, G, H, I, J]
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

Algorithm
- Define a constant ALPHABET at the class level that is an array of all the
lettersof the alphabet in order

- Define a class method make_diamond that takes a string as an argument
- assign a empty string to diamond_string

- Find the width of the diamond
  - find the index of the input string in the ALPHABET array
  - multiply that index by 2 and add 1
- Find the max middle spaces
  - width - 2

- Build out the first line of the diamond
  - ' ' * side spaces + ALPHABET[0] + ' ' * side spaces
- concact to diamond_string

- Build out the rest of the lines of the diamond

- Ascending
  - assign a variable ascending_strings to an empty string
  - assign a variable side_spaces to the width of the diamond / 2 - 1
  - assign a variable middle_spaces to 1
  - assign a variable index to 1
  - initialize a loop
  - ' ' * side spaces + ALPHABET[index] + ' ' * middle spaces + ALPHABET[index]
   +' ' * side spaces + \n
  - concact to asscending_strings
  - add 2 to middle spaces
  - subtract 1 from side spaces
  - add 1 to index
  - break if middle spaces are greater than or equal to diamond width
  - return asscending_strings
  - concact the return value of ascending to diamond_string

- Descending
 - assign a variable descending_strings to an empty string
 - assign a variable side_spaces to 1
 - assign a variable middle_spaces to the width of the diamond - 4
 - assign a variable index to the index of the input string to the
 make_diamonds method minus 1
 - if middle_spaces is less than or equal to 0 return descending_strings
 - initialie a loop
 - ' '  * side_spaces + ALPHABET[index] + ' ' * middle_spaces +
 ALPHABET[index] + ' ' * side spaces + \n
 - concact to descending_strings
 - add 1 to side spaces
 - subtract 2 from middle spaces
 - subtract 1 from index
 - break if index is < 1
 - return descending_strings
 - concact the return value of descending strings to diamond_string

- Return value
diamond_string = first_and_last_line method + ascending_line method +
descending_line method + first_and_last_line method
=end

class Diamond
  ALPHABET = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M'] +
             ['N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

  def self.make_diamond(letter)
    diamond_width = (ALPHABET.find_index(letter) * 2) + 1

    start_string = first_and_last_line(diamond_width)
    return start_string if letter == 'A'

    ascending_string = ascending(diamond_width, letter)
    return start_string + ascending_string + start_string if letter == 'B'

    descending_string = descending(diamond_width, letter)

    start_string + ascending_string + descending_string + start_string
  end

  class << self
    private

    def first_and_last_line(width)
      side_spaces = width / 2
      "#{' ' * side_spaces}#{ALPHABET[0]}#{' ' * side_spaces}\n"
    end

    def construct_line(side_spaces, index, middle_spaces)
      "#{' ' * side_spaces}#{ALPHABET[index]}#{' ' * middle_spaces}" \
      "#{ALPHABET[index]}#{' ' * side_spaces}\n"
    end

    def ascending(width, letter)
      ascending_strings = ''
      side_spaces = (width / 2) - 1
      middle_spaces = 1

      1.upto(ALPHABET.find_index(letter)) do |index|
        string = construct_line(side_spaces, index, middle_spaces)
        ascending_strings += string
        middle_spaces += 2
        side_spaces -= 1
      end

      ascending_strings
    end

    def descending(width, letter)
      descending_strings = ''
      middle_spaces = width - 4
      index = ALPHABET.find_index(letter) - 1

      1.upto((width / 2) - 1) do |side_spaces|
        string = construct_line(side_spaces, index, middle_spaces)
        descending_strings += string
        middle_spaces -= 2
        index -= 1
      end

      descending_strings
    end
  end
end
