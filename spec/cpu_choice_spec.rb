require 'rspec'
require './lib/cpu_choice'
require './lib/board'
require './lib/game_over'
require './lib/minimax'

describe 'CPUChoice' do
  before(:each) do
    @board = Board.new
    @playing_board = @board.board
    @minimax = Minimax.new(GameOver.new)
    @cpu = CPUChoice.new(@minimax)
  end

  describe '.cpu_pick' do
    it 'CPU picks a spot' do
      @board.mark_board(1, 'X')
      @cpu.cpu_pick(@playing_board)
      expect(@playing_board).not_to eq(%w[1 X 3 4 5 6 7 8 9])
    end

    it 'CPU does not pick a spot when the board is full' do
      @playing_board = %w[O X X X X O O O X]
      @cpu.cpu_pick(@playing_board)
      expect(@playing_board).to eq(%w[O X X X X O O O X])
    end
  end

  describe '.best_move_to_make' do
    it 'CPU chooses the most optimal position' do
      @playing_board = %w[X 2 O O 5 O 7 X X]
      best_move = @cpu.best_move_to_make(@playing_board)
      expect(best_move).to eq(4)
    end

    it 'CPU does not pick the first spot when the game is over' do
      @playing_board = %w[X O O O X X X X O]
      best_move = @cpu.best_move_to_make(@playing_board)
      expect(best_move).to eq(0)
    end
  end

  describe '.cpu_first_pick' do
    it 'CPU chooses the middle first if its open' do
      @playing_board = %w[X 2 3 4 5 6 7 8 9]
      expect(@cpu.cpu_first_pick(@playing_board)).to eq(4)
    end

    it 'If human picks the middle first, the CPU picks the corner' do
      @playing_board = %w[1 2 3 4 X 6 7 8 9]
      expect(@cpu.cpu_first_pick(@playing_board)).to eq(8)
    end
  end
end
