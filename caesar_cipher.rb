def caesar_cipher(string, num)
    alphabet = ('a'..'z').to_a
    cipher_string = ''
    string.chars.each do |ch|
        if alphabet.include?(ch.downcase)
            old_idx = alphabet.index(ch.downcase)
            new_idx = (old_idx + num) % 26
            if ch.downcase == ch
                cipher_string += alphabet[new_idx]
            else
                cipher_string += alphabet[new_idx].upcase
            end
        else
            cipher_string += ch
        end
    end
    cipher_string
end


puts caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"