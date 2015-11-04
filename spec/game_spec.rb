require "spec_helper"

module Hangman
  describe Game do
    before :each do
      @board = Board.new
    end

    context "#game_over" do
      it "returns :winner if win? == true" do
  			allow(@board).to receive_messages(:win? => true)
  			expect(@board.game_over).to eq :winner
  		end

  		it "returns :loser if win? = false and lose? == true" do
  			allow(@board).to receive_messages(:win? => false, :lose? => true)
  			expect(@board.game_over).to eq :lose
      end
    end
  end
end
