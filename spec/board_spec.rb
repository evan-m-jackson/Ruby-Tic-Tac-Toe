require 'rspec'
require './lib/board'

describe 'Board' do
  before(:each) do
    @board = Board.new
  end

  describe '.mark_board' do
    it 'Has String array (aka the board)' do
      expect(@board.board).to eq(%w[1 2 3 4 5 6 7 8 9])
    end

    it 'Mark the board in the middle spot(5) with an X' do
      @board.mark_board('5', 'X')
      expect(@board.board[4]).to eq('X')
    end

    it 'Mark the first spot(1) on the board' do
      @board.mark_board('1', 'X')
      expect(@board.board).to eq(%w[X 2 3 4 5 6 7 8 9])
    end

    it 'Mark the 6 spot with an O' do
      @board.mark_board('6', 'O')
      expect(@board.board).to eq(%w[1 2 3 4 5 O 7 8 9])
    end

    it 'Player X picks then Player O picks' do
      @board.mark_board('4', 'X')
      @board.mark_board('3', 'O')
      expect(@board.board).to eq(%w[1 2 O X 5 6 7 8 9])
    end
  end
end
