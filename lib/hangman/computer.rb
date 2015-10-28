module Hangman
	class Computer
	attr_reader :word
		def initialize
			wordlist = File.read("5desk.txt").split
			valid_words = wordlist.select{ |word| word.length > 5 && word.length < 12 }
			@word = valid_words.sample.downcase
		end
	end
end