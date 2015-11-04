module Hangman
	class Board
		attr_accessor :letters, :tries_left, :word
		def initialize
			@word = Computer.new.word
			@tries_left = 6
			@letters = ("a".."z").to_a
		end

		def get_guess
			loop do
				guess = gets.chomp.downcase
				if guess == "save"
					return false
				elsif letters.any? { |letter| letter == guess }
					convert_guess_to_blank(guess)
					correct_guess?(guess)
					break
				else
					p "Invalid letter."
				end
			end
		end

		def convert_guess_to_blank(guess)
			letters.map! { |letter| letter == guess ? letter = "__" : letter }
		end

		def display_hangman(input_tries_left)
			mapping = {
				6 => "-",
				5 => "-0",
				4 => "-0--",
				3 => "-0--/",
				2 => "-0--<",
				1 => "-0-/-<",
				0 => "-0-<-<",
			}
			puts mapping[input_tries_left]
		end

		def display_correct_guess
			word.split("").map do |char| 
				if letters.include?(char) 
					print "__ "
				else
					print "#{char} "
				end
			end
		end

		def correct_guess?(guess)
			@tries_left -= 1 unless word.include?(guess)
		end

		def display_letters
			letters.each { |letter| print "  #{letter}  " }
		end

		def display_board
			display_hangman(@tries_left)
			display_correct_guess
			print "\n"
			display_letters
			print "\n"
		end

		def win?(word)
			letters.none? { |letter| word.split("").any? { |char| letter == char} }
		end

		def lose?
			tries_left < 1
		end
	end
end

