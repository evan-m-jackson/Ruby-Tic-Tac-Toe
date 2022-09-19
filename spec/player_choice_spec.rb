require 'rspec'
require './lib/player_choice'
require './lib/board'

describe 'PlayerChoice' do
    before(:each) do
      @choice = PlayerChoice.new
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
            expect do
            @choice.move_confirmation_message(board, '1')
            end.to output("Sorry this space is taken. Please select another.\n").to_stdout
        end
        
        it 'message prints for an invalid choice' do
            board = Board.new.board
            expect do
            @choice.move_confirmation_message(board, 'a')
            end.to output("Sorry that is not a valid move. Please select an integer between 1 and 9.\n").to_stdout
        end
    end  

end