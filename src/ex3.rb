def combine_anagrams(words)
    anagrams = Hash.new { |hash, key| hash[key] = [] }
    words.each do |word|
        sorted_word = word.downcase.chars.sort
        anagrams[sorted_word] << word
    end
    anagrams.values
end

# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# => output: [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
# HINT: you can quickly tell if two words are anagrams by sorting their
# letters, keeping in mind that upper vs lowercase doesn't matter

p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])