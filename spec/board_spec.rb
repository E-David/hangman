require "spec_helper"

module Hangman
	describe Board do
		before :each do
			@board = Board.new
		end

		context "#initialize" do
			it "allows letters and tries_left to be read" do
				expect(@board.tries_left).to be_an(Integer)
				expect(@board.letters).to be_an(Array)
			end

			it "allows letters to be changed" do
				@board.letters = "I"
				expect(@board.letters).to eq "I"
			end
		end

		context "win?" do
			it "should be true if no shared letters between letters and word" do
				@board.letters = ['a', 'b', 'c']
				expect(@board.win?("defghijklmnopqrstuvwxyz")).to be true
			end
			it "should be false if any shared letters between letters and word" do
				@board.letters = ['a', 'b', 'c']
				expect(@board.win?("cdefghijklmnopqrstuvwxyz")).to be false
			end
		end
	end
end