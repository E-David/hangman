require "spec_helper"

module Hangman
	describe Player do

		context "#initialize" do
			it "starts with a default name if nothing is typed in" do
				player = Player.new
				expect(player.name).to eq "Player 1"
			end

			it "can change its name if given a value" do
				player = Player.new("I")
				expect(player.name).to eq "I"
			end
		end

	end
end