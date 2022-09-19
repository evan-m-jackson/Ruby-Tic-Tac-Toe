require 'rspec'
require './lib/cpu_choice.rb'
require './lib/board.rb'
require './lib/game_over'

describe 'CPUChoice' do
    before(:each) do
        @board = Board.new
        @playing_board = @board.board
        @cpu = CPUChoice.new(GameOver.new)
    end

describe '.cpu_pick' do
    it 'CPU picks a spot' do
        @board.mark_board('2', 'X')
        @cpu.cpu_pick(@playing_board)
        expect(@playing_board).not_to eq(%w[1 X 3 4 5 6 7 8 9])
    end

end

describe '.get_available_spots' do
  it 'Returns the available spots on the board' do
    @playing_board = %w[X O X O X O 7 8 9]
    expect(@cpu.get_available_spots(@playing_board)).to eq([6, 7, 8])
  end
end

describe '.best_move_to_make' do
  it 'CPU chooses the most optimal position' do
    @playing_board = %w[X 2 O O 5 O 7 X X]
    best_move = @cpu.best_move_to_make(@playing_board)
    expect(best_move).to eq(5)
  end
end

describe '.cpu_first_pick' do
  it 'CPU chooses the middle first if its open' do
    @playing_board = %w[X 2 3 4 5 6 7 8 9]
    expect(@cpu.cpu_first_pick(@playing_board)).to eq('5')
  end

  it 'If human picks the middle first, the CPU picks the corner' do
    @playing_board = %w[1 2 3 4 X 6 7 8 9]
    expect(@cpu.cpu_first_pick(@playing_board)).to eq('9')
  end
end
end