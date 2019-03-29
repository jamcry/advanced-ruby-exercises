def palindrome(word)
    if word.length == 0 || word.length == 1
        true
    else
        if word[0] == word[-1]
            palindrome(word[1..-2])
        else
            false
        end
    end
end

puts palindrome("selales")
puts palindrome("cem")
puts palindrome("arabara")
puts palindrome("a")