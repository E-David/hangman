require "spec_helper"

module Hangman
	describe Computer do

		context "#initialize" do
			it "loads text file and grabs random word" do
				computer = Computer.new
				expect(computer.word.length).to be > 5
			end
		end

	end
end