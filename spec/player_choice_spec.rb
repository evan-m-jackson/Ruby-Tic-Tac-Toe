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
      game.mark_board(choice, marker)
      expect(@choice.is_space_free(board, choice)).to be false
    end
  end

  describe '.move_confirmation_message' do
    it 'message prints if a spot is taken' do
      board = %w[X 2 3 4 5 6 7 8 9]

      @choice.move_confirmation_message(board, '1')

      expect(@test_ui.sorry_taken_called).to be true
    end

    it 'message prints for an invalid choice' do
      board = Board.new.board

      @choice.move_confirmation_message(board, 'a')

      expect(@test_ui.sorry_invalid_move).to be true
    end
  end
end
