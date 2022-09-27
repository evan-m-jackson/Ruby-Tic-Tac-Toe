require 'rspec'
require './lib/player_choice'
require './lib/board'
require 'stringio'

class TestUI
  attr_reader :sorry_taken_called, :sorry_invalid_move

  def sorry_taken
    @sorry_taken_called = true
  end

  def sorry_invalid
    @sorry_invalid_move = true
  end
end

describe 'PlayerChoice' do
  before(:each) do
    @test_ui = TestUI.new
    @choice = PlayerChoice.new(output: @test_ui)
  end

  describe '.is_user_input_valid' do
    it 'When the user input an integer between 1 and 9' do
      expect(@choice.is_user_input_valid('5')).to be true
    end

    it 'When the user inputs an integer not between 1 and 9' do
      expect(@choice.is_user_input_valid('0')).to be false
    end

    it 'When the user inputs a letter instead of an integer' do
      expect(@choice.is_user_input_valid('b')).to be false
    end

    it 'When the user inputs an empty string' do
      expect(@choice.is_user_input_valid('')).to be false
    end
  end

  describe '.is_space_free' do
    it 'When the user input is already taken on the board' do
      game = Board.new
      board = game.board
      choice = '1'
      marker = 'X'
      idx = @choice.get_choice_idx(choice)
      game.mark_board(idx, marker)
      expect(@choice.is_space_free(board, choice)).to be false
    end
  end

end
