=begin

ROT13

Algo
- initialize a constant entire_alphabet A-Z as an array
- initialize a constant first_half to string characters A-M as an array
- initialize a constant second_half to letters N-Z as an array
- define method encrypt that takes a string argument
- initialize a llocal variable result_string to an empty string
- iterate through the input string by character
  - if the current character is not alphabetic (not included in the entire_alphabet constant) append it
  to the result string as is
  - if the current character is alphabetic
    - if its downcased version is included in the first_half constant array
      - assign index to the index of that letter in the first_half array
      - append to the result string the letter that is in the second_half array at the same index
    - if its downcased verision is included in the second half constant array
      - assign index to the index of that letter in the second_half array
      - append to the resullt string the letter that is in the first_half array at the same index
    end
  end
- split the result string based on white space and capitallize both strings, then join with a space and return this result


=end

FIRST_HALF = ('a'..'m').to_a
SECOND_HALF = ('n'..'z').to_a

def encrypt(string)
  results = ''
  string.each_char do |char|
    if FIRST_HALF.include?(char.downcase)
      index = FIRST_HALF.find_index(char.downcase)
      results << SECOND_HALF[index]
    elsif SECOND_HALF.include?(char.downcase)
      index = SECOND_HALF.find_index(char.downcase)
      results << FIRST_HALF[index]
    else
      results << char
    end
  end
  results.split.each(&:capitalize!).join(' ')
end


p encrypt("Nqn Ybirynpr")
p encrypt("Tenpr Ubccre")
p encrypt("Nqryr Tbyqfgvar")
p encrypt("Nyna Ghevat")
p encrypt("Puneyrf Onoontr")
p encrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p encrypt("Wbua Ngnanfbss")
p encrypt("Ybvf Unvog")
p encrypt("Pynhqr Funaaba")
p encrypt("Fgrir Wbof")
p encrypt("Ovyy Tngrf")
p encrypt("Gvz Orearef-Yrr")
p encrypt("Fgrir Jbmavnx")
p encrypt("Xbaenq Mhfr")
p encrypt("Fve Nagbal Ubner")
p encrypt("Zneiva Zvafxl")
p encrypt("Lhxvuveb Zngfhzbgb")
p encrypt("Unllvz Fybavzfxv")
p encrypt("Tregehqr Oynapu")
