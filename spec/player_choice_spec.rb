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

    it 'message prints if a spot is taken' do
        board = %w[X 2 3 4 5 6 7 8 9]
        expect do
          @choice.move_confirmation(board, '1')
        end.to output("Sorry this space is taken. Please select another.\n").to_stdout
      end
    
    it 'message prints for an invalid choice' do
        board = Board.new.board
        expect do
          @choice.move_confirmation(board, 'a')
        end.to output("Sorry that is not a valid move. Please select an integer between 1 and 9.\n").to_stdout
      end
    

  end