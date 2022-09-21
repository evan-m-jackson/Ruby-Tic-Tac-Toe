require 'rspec'
require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/player_choice'
require './lib/play'

describe 'Play' do
    before(:each) do
        @end_of_game = GameOver.new
        @board = Board.new
        @cpu = CPUChoice.new(@end_of_game)
    end

 describe '.player_picks_a_spot' do
    it 'Player chooses 5 and the board is marked with their choice' do
        input = StringIO.new("5")
        @player = PlayerChoice.new(input: input)
        @play = Play.new(@board, @cpu, @player, @end_of_game)
        @play.player_picks_a_spot
        expect(@board.board).to eq(%w[1 2 3 4 X 6 7 8 9])
    end

    it 'Player chooses an invalid move and the function returns false' do
        input = StringIO.new("a")
        @player = PlayerChoice.new(input: input)
        @play = Play.new(@board, @cpu, @player, @end_of_game)
        expect(@play.player_picks_a_spot).to be false 
    end
 end

end