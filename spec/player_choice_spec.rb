require 'rspec'
require './lib/player_choice'
require './lib/board'

describe 'PlayerChoice' do
    before(:each) do
      @choice = PlayerChoice.new
    end
    
    it 'When the user input is valid' do
      expect(@choice.is_user_input_valid('5')).to be true
    end
  
    it 'When the user inputs an incorrect number' do
      expect(@choice.is_user_input_valid('0')).to be false
    end
  
    it 'When the user inputs an incorrect number' do
      expect(@choice.is_user_input_valid('b')).to be false
    end
  
    it 'When the user inputs an incorrect number' do
      expect(@choice.is_user_input_valid('')).to be false
    end
  
    it 'When the user input is already taken' do
      game = Board.new
      board = game.board
      choice = '1'
      marker = 'X'
      game.mark_board(choice, marker)
      expect(@choice.is_space_free(board, choice)).to be false
    end

  end