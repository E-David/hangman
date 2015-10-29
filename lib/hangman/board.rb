module Hangman
	class Board
		attr_accessor :letters, :tries_left
		def initialize(tries_left = 6)
			@tries_left = tries_left
			@letters = ("a".."z").to_a
		end

		def get_guess
			p "DO IT"
			loop do
				hangman_picture(tries_left)
				guess = gets.chomp
				if guess.size == 1
					compare_guess_with_word(guess)
					@tries_left -= 1
					break
				else
					p "Please only type a single letter."
				end
			end
		end

		def compare_guess_with_word(guess)
			letters.map! { |letter| letter == guess ? letter = "__" : letter }
		end

		def display_letters
			letters.each { |letter| print "  #{letter}  " }
		end

		def hangman_picture(tries_left)
			#TODO: Make this work
			mapping = {
				"6" =>
						"[-"
						 "\______|"
							    "|",
				"5" =>
						"[-0
						 \______|
							    |",
				"4" =>
						"[-0--
						 \______|
							    |",
				"3" =>
						"[-0--/
						 \______|
							    |",
				"2" =>
						"[-0--<
						 \______|
							    |",
				"1" =>
						"[-0-`-<
						 \______|
							    |",
				"0" =>
						"[-0->-<
						 \______|
							    |",
			}
			p mapping[tries_left]
		end

	end
end

