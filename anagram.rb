# anagram.rb

require_relative 'reverse_letters'

def find_anagram(string)
    # Convert word to an array of letters
    letters = string.split(//)
 
    # Create an array to store our anagrams
    anagrams = []
 
    # Loop through each letter in letters
    letters.each do |letter|
      # Select the remaining letters
      remaining = letters.select { |l| l != letter }
 
      # Create a new word by combining the letter + the remaining letters
      # Add new word to anagrams array
      anagrams << letter + remaining.join('')
 
      # Create a new word by combining the letter + the reverse of the remaining letters
      # Add new word to anagrams array
      anagrams << letter + reverse_letters(remaining).join('')
    end
 
    # Return anagrams array
    anagrams	
end
