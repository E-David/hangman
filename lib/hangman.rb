require_relative "hangman/version"

module Hangman
end

require_relative "./hangman/computer.rb"
require_relative "./hangman/player.rb"
require_relative "./hangman/board.rb"
require_relative "./hangman/game.rb"
x = Hangman::Game.new
x.game_setup