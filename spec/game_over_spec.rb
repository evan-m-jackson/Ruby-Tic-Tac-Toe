require 'rspec'
require './lib/board'
require './lib/game_over'

describe 'GameOver' do

    before(:each) do
      @game = Board.new
      @board = @game.board
      @game_over = GameOver.new
    end
  
    describe '.is_game_over' do
    it 'game is over when the board is full of player choices' do
      @board = %w[X O X O X O X O X]
      expect(@game_over.is_game_over(@board)).to be true
    end
  
    it 'game is not over when board still has available spots' do
      @board = %w[X 2 3 4 5 6 7 8 9]
      expect(@game_over.is_game_over(@board)).to be false
    end
end
  
describe '.which_player_wins' do
    it 'Player X wins horizontally in the first row' do
      @board = %w[X X X O O 6 7 8 9]
      expect(@game_over.which_player_wins(@board)).to eq 'X'
    end
  
    it 'Player O wins horizontally in the second row' do
      @board = %w[X X 3 O O O 7 8 X]
      expect(@game_over.which_player_wins(@board)).to eq 'O'
    end
  
    it 'No winner yet' do
      @board = %w[X O X O X O 7 8 9]
      expect(@game_over.which_player_wins(@board)).to eq 'No winner'
    end
  
    it 'Player X wins horizontally in the third row' do
        @board = %w[O O 3 4 5 6 X X X]
        expect(@game_over.which_player_wins(@board)).to eq 'X'
    end
  
    it 'Player O wins vertically' do
        @board = %w[X O 3 4 O 6 X O X]
        expect(@game_over.which_player_wins(@board)).to eq 'O'
    end
  
    it 'Player X wins diagonally' do
        @board = %w[X O O 4 X 6 7 8 X]
        expect(@game_over.which_player_wins(@board)).to eq 'X'
    end
  
    it 'Player O wins diagonally the opposite way' do
        @board = %w[X X O X O 6 O 8 9]
        expect(@game_over.which_player_wins(@board)).to eq 'O'
    end
end

describe '.does_a_player_win' do
    it 'returns true if Player X wins' do
        @board = %w[X O O 4 X 6 7 8 X]
        expect(@game_over.does_a_player_win(@board)).to be true
    end

    it 'returns true if Player O wins' do
        @board = %w[X X O X O 6 O 8 9]
        expect(@game_over.does_a_player_win(@board)).to be true
    end

    it 'returns false if there is no winner' do
        @board = %w[X O X O X O 7 8 9]
        expect(@game_over.does_a_player_win(@board)).to be false
    end    
end
end