require 'rspec'
require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/minimax'
require './lib/player_choice'
require './lib/play'
require './spec/player_choice_spec'
require './mock/test_ui'
require './mock/test_player_choice'
require './mock/test_board'

describe 'Play' do
  before(:each) do
    @test_ui = TestUI.new
    @end_of_game = GameOver.new
    @ai_function = Minimax.new(@end_of_game)
    @board = Board.new
    @cpu = CPUChoice.new(@ai_function)
  end

  describe '.run' do
    before(:each) do
      @test_board = TestBoard.new
    end
    it 'prints a welcome message' do
      @test_board.board = %w[X X X 4 5 6 7 8 9]
      @player = PlayerChoice.new(output: @test_ui)
      @play = Play.new(@test_board, @cpu, @player, @end_of_game, @test_ui)
      @play.run
      expect(@test_ui.welcome_message_called).to be true
    end

    it 'prints the board' do
      @test_board.board = %w[X 2 X 4 5 6 7 8 9]
      @test_player = TestPlayerChoice.new(output: @test_ui, input: ['2'])
      @play = Play.new(@test_board, @cpu, @test_player, @end_of_game, @test_ui)
      @play.run
      expect(@test_board.board_printed).to be true
    end

    it 'Player chooses an invalid move and an error message is printed' do
      @test_board.board = %w[X 2 X 4 5 6 7 8 9]
      @test_player = TestPlayerChoice.new(output: @test_ui, input: %w[a 2])
      @play = Play.new(@test_board, @cpu, @test_player, @end_of_game, @test_ui)
      @play.run
      expect(@test_ui.sorry_invalid_move).to be true
    end

    it 'Player chooses a spot that is already taken and an error message is printed' do
      @test_board.board = %w[X 2 X 4 5 6 7 8 9]
      @test_player = TestPlayerChoice.new(output: @test_ui, input: %w[1 2])
      @play = Play.new(@test_board, @cpu, @test_player, @end_of_game, @test_ui)
      @play.run
      expect(@test_ui.sorry_taken_called).to be true
    end

    it 'Player wins the game and the win message is printed' do
      @test_board.board = %w[X 2 X 4 5 6 7 8 9]
      @test_player = TestPlayerChoice.new(output: @test_ui, input: ['2'])
      @play = Play.new(@test_board, @cpu, @test_player, @end_of_game, @test_ui)
      @play.run
      expect(@test_ui.game_over_win_called).to be true
    end

    it 'The game ends in a draw and the tie message is printed' do
      @test_board.board = %w[X X O O X X 7 O O]
      @test_player = TestPlayerChoice.new(output: @test_ui, input: ['7'])
      @play = Play.new(@test_board, @cpu, @test_player, @end_of_game, @test_ui)
      @play.run
      expect(@test_ui.game_over_draw_called).to be true
    end
  end
end
