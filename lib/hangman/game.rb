require 'yaml'

module Hangman
	class Game
		attr_reader :board
		def initialize
			@board = Board.new
			@player = Player.new
		end

		def game_over
			return p "Player wins!" if board.win?(board.word)
			return p "Player loses. Your word was #{board.word}" if board.lose?
			false
		end

		def game_setup
			if File.exists?("file.txt")
				p "saved game found. Type new to begin a new game and load to continue this game."
				answer = gets.chomp
				if answer == "new"
					play
				elsif answer == "load"
					load_game
				else
					p "invalid response"
					game_setup
				end
			else
				play
			end
		end

		def play
			until game_over != false
					puts "Guess a letter. Type 'save' to save your progress."
					board.display_board
					save_game if board.get_guess == false
			end
			board.display_hangman(board.tries_left)
			restart?
		end

		def save_game
			File.open("file.txt", "w") do |file| 
				file.puts "#{board.word}"
				file.puts "#{board.letters}"
				file.puts "#{board.tries_left}"
			end
			puts "Game saved!" if File.exists?("file.txt")
		end

		def load_game
			game = File.open("file.txt", "r")
			game_lines = game.readlines.each { |line| line.chomp! }
			game.close
			board.word = YAML::load(game_lines[0])
			board.letters = YAML::load(game_lines[1])
			board.tries_left = YAML::load(game_lines[2])
			play
		end

		def restart?
			loop do 
				puts "Would you like to play again?"
				answer = gets.chomp
				if answer == "yes" || answer == "y"
					x = Hangman::Game.new
					x.play
					break
				else
					break
				end
			end
		end

	end
end