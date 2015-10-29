module Hangman
	class Computer
	attr_reader :name, :word
		def initialize(name = "Computer")
			@name = name
			wordlist = File.read("5desk.txt").split
			valid_words = wordlist.select{ |word| word.length > 5 && word.length < 12 }
			@word = valid_words.sample.downcase
		end
	end
end