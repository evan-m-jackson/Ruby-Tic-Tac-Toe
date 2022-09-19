require 'rspec'
require './lib/board'

describe 'Board' do
    before(:each) do
      @board = Board.new
    end
  
    it 'Has String array (aka the board)' do
    expect(@board.board).to eq(%w[1 2 3 4 5 6 7 8 9])
    end
  
    it 'Mark the board in the middle with an X' do
      @board.mark_board('5', 'X')
      expect(@board.board[4]).to eq('X')
    end
  
  end