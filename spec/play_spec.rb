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
        @player = PlayerChoice.new
        @play = Play.new(@board, @cpu, @player, @end_of_game) 
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

 describe '.while_loop_for_player_picking_spot' do
    it 'Method continues to run until a valid option is chosen' do
        @play.while_loop_for_player_picking_spot
    end
 end

 describe '.runs_game_until_win_or_draw' do
    it 'Player and CPU take turns playing' do
        @play.run_game_until_win_or_draw
    end
end

describe '.run' do
    it 'Runs the whole game' do
        @play.run
    end
end

end