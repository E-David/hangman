require "spec_helper"

module Hangman
	describe Computer do

		context "#initialize" do
			it "starts with a default name if nothing is typed in" do
				computer = Computer.new
				expect(computer.name).to eq "Computer"
			end

			it "can change its name if given a value" do
				computer = Computer.new("")
				expect(computer.name).to eq ""
			end

			it "loads text file and grabs random word" do
				computer = Computer.new
				word = computer.word.length
				expect(word > 5 && word < 12).to eq true
			end
		end

	end
end