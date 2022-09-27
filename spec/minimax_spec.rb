require 'rspec'
require './lib/board'
require './lib/minimax'
require './lib/game_over'

describe 'Minimax' do
  before(:each) do
    @minimax = Minimax.new(GameOver.new)
    @isMaximizing = true
    @board = Board.new
    @playing_board = @board.board
  end

  describe '.get_available_spots' do
    it 'Returns the available spots on the board' do
      @playing_board = %w[X O X O X O 7 8 9]
      expect(@minimax.get_available_spots(@playing_board)).to eq([6, 7, 8])
    end
  end

  describe '.minimax' do
    it 'returns 10 if the AI could win in the spot' do
      @playing_board = %w[O O O 4 5 6 7 8 9]
      expect(@minimax.minimax(@isMaximizing, @playing_board)).to eq(10)
    end

    it "returns -10 if the AI's opponent is winning" do
      @playing_board = %w[X X X 4 5 6 7 8 9]
      expect(@minimax.minimax(@isMaximizing, @playing_board)).to eq(-10)
    end

    it 'returns 0 if the game is a draw' do
      @playing_board = %w[X O X O X O O X O]
      expect(@minimax.minimax(@isMaximizing, @playing_board)).to eq(0)
    end

    it 'returns the best score to win the game' do
      @playing_board = %w[O 2 O X 5 X 7 8 9]
      expect(@minimax.minimax(@isMaximizing, @playing_board)).to eq(10)
    end

    it 'return the best score (-10) to not let the other player win' do
      @playing_board = %w[X X 3 O 5 6 7 8 9]
      expect(@minimax.minimax(@isMaximizing, @playing_board)).to eq(-10)
    end
  end
end
