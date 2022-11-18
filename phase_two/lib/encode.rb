def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char).to_i).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[char.ord - 65]
  end
  return plaintext_chars.join
end

=begin
## NOTES ##
Encode Debug
1. cipher "cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)" is an array 
   of unique characters beginning with each unique character in the secret key,
   #{key}, followed by the reamining characters from a-y\n"

2. Experiments: ciphertext_chars = plaintext.chars.map "print plaintext.chars.map returns <Enumerator:0x000055b97db17650>"
   Initally thought that ciphertext_chars should return an array with each character in plaintext 
   moved 65 places from its position in the cipher array. Debugging revealed it actually returns:
   main.rb:9:in `+': nil can't be coerced into Integer (TypeError)"

3. I examined the impact of each method in the block of code more thoroughly:
   ciphertext_chars = plaintext.chars.map do |char|
     (65 + cipher.find_index(char)).chr
   end
4. To address the TypeError, I removed the chr method and converted the out put in the brackets to an integer and printed the results which returned an array of numbers.

5. I added the chr method back to the outside of the bracket which returned an array of capitalised alphabetical characters.

6. I was puzzled by how adding the chr method to an integer turned it into a letter, so to investigate, I isolated the first entry in the ciphertext_chars array
   output minus the chr method (69) into the print statement print "69.chr" which returned "E", the first letter of the ciphertext_chars array with the chr method attatched.
   Googling the effect of chr on an integer revealed it applies an encoding function to integers.

Decode Debug
1. Using "E" as the ciphertext with the same key "secretkey" the expected plaintext return should've been "t" however the function returned no value.
2. The next step was to assess the functionality of the ord method. Printing 69.ord (69 being the value of the pre-encoded operation on the plaintext "t") returned 
   "E" (the value of encoded result from the previous operation). The objective was then to reverse the encoding process and pre-encoded operation to return
   the position of the plaintext that was used in the formulation of the cipher array. This was accomplished by simply switiching the order of each variable (65 & char.ord) 
   within the cipher[] operation in the iterator function. 
   

 ## PRE-DEBUGGED CODE ##
def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  return plaintext_chars.join
end
=end