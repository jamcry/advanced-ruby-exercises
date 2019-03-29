def roman_to_int(roman_number, result = 0)
    return result if roman_number.empty? # base case
    mapping = {
        "M" => 1000, "CM" => 900, "D" => 500, "CD" => 400,
        "C" => 100, "XC" => 90, "L" => 50, "XL" => 40,
        "X" => 10, "IX" => 9, "V" => 5, "IV" => 4,
        "I" => 1
    }

    mapping.each do |roman_val, int_val|
        if roman_number.start_with?(roman_val)
            result += int_val
            # slice off the first roman number
            roman_number = roman_number[(roman_val.length)..]
            # invoke the method with the remaining roman number
            return roman_to_int(roman_number, result)
        end
    end

end

puts "MMCL = #{roman_to_int("MMCL")}" #=> MMCL = 2150
puts "DLI = #{roman_to_int("DLI")}" #=> DLI = 551