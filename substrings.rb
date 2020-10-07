def substrings(string, dictionary)
    counts = Hash.new(0)
    dictionary.each { |dictionary_word| counts[dictionary_word] += string.downcase.scan(/(?=#{dictionary_word})/).count if string.downcase.include?(dictionary_word) }
    counts
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)
#{ "below" => 1, "low" => 1 }

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#{ "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }