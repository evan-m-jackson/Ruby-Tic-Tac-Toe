require 'rspec'
require './ticTacToe'
require './board'

describe 'Board' do
  before(:each) do
    @board = Board.new
  end

  it 'Has String array (aka the board)' do
  expect(@board.board).to eq(%w[1 2 3 4 5 6 7 8 9])
  end

end

describe 'Game' do

  before(:each) do
    @game = Game.new
  end

  it 'Has a Player Marker' do
    expect(@game.get_marker).to eq('X')
  end

  it 'When the user input is valid' do
    expect(@game.is_user_input_valid('5')).to be true
  end

  it 'When the user input is valid Pt 2' do
    expect(@game.is_user_input_valid('0')).to be false
  end

  it 'When the user input is valid Pt 2' do
    expect(@game.is_user_input_valid('8')).to be true
  end

  it "When the user input isn't valid" do
    expect(@game.is_user_input_valid('10')).to be false
  end

  it "When the user input isn't valid" do
    expect(@game.is_user_input_valid('15')).to be false
  end

  it "When the user input isn't an integer" do
    expect(@game.is_user_input_valid('a')).to be false
  end

  it "When the user input isn't an integer Pt 2" do
    expect(@game.is_user_input_valid('1.1')).to be false
  end

  it "When the user input isn't an integer Pt 3" do
    expect(@game.is_user_input_valid('1abc23')).to be false
  end

  it "When the user input isn't an integer Pt 4" do
    expect(@game.is_user_input_valid(' ')).to be false
  end

  it 'When the user input is an Empty String' do
    expect(@game.is_user_input_valid('')).to be false
  end

  it 'Mark the board in the middle' do
    @game.mark_board('5')
    expect(@game.board[4]).to eq('X')
  end

  it 'Mark the first spot on the board' do
    
    @game.mark_board('1')
    expect(@game.board).to eq(%w[X 2 3 4 5 6 7 8 9])
  end

  it 'Try to mark spot not on the board' do
    
    @game.mark_board('0')
    expect(@game.board).to eq(%w[1 2 3 4 5 6 7 8 9])
  end

  it 'Try to mark 6 spot with O' do
    
    @game.change_marker
    @game.mark_board('6')
    expect(@game.board).to eq(%w[1 2 3 4 5 O 7 8 9])
  end

  it 'When the user input is already taken' do
    
    @game.mark_board('1')
    expect(@game.is_space_free('1')).to be false
  end

  it 'Player X picks then Player O picks' do
    
    @game.mark_board('4')
    @game.change_marker
    @game.mark_board('3')
    expect(@game.board).to eq(%w[1 2 O X 5 6 7 8 9])
  end

  it 'message prints if a spot is taken' do
    
    @game.mark_board('1')
    expect do
      @game.move_confirmation('1')
    end.to output("Sorry this space is taken. Please select another.\n").to_stdout
  end

  it 'message prints for an invalid choice' do
    
    expect do
      @game.move_confirmation('a')
    end.to output("Sorry that is not a valid move. Please select an integer between 1 and 9.\n").to_stdout
  end

  it 'game is over' do
    
    (1..9).each do |n|
      num = n.to_s
      @game.mark_board(num)
    end
    expect(@game.game_over).to be true
  end

  it 'game is not over' do
    
    @game.mark_board('1')
    expect(@game.game_over).to be false
  end

  it 'Player X wins horizontally in the first row' do
    
    %w[1 4 2 5 3].each do |choice|
      @game.mark_board(choice)
    end
    expect(@game.player_wins).to be true
  end

  it 'Player O wins horizontally in the second row' do
    
    %w[1 4 2 5 9 6].each do |choice|
      @game.mark_board(choice)
    end
    expect(@game.player_wins).to be true
  end

  it 'No winner yet' do
    
    %w[1 2 3 4 5 6].each do |choice|
      @game.mark_board(choice)
      @game.change_marker
    end
    expect(@game.player_wins).to be false
  end

  it 'Player X wins horizontally in the third row' do
    
    %w[7 2 8 1 9].each do |choice|
      @game.mark_board(choice)
    end
    expect(@game.player_wins).to be true
  end

  it 'Player O wins vertically' do
    
    %w[1 2 9 5 7 8].each do |choice|
      @game.mark_board(choice)
    end
    expect(@game.player_wins).to be true
  end

  it 'Player X wins diagonally' do
    
    %w[1 2 5 3 9].each do |choice|
      @game.mark_board(choice)
      @game.change_marker
    end
    expect(@game.player_wins).to be true
  end

  it 'Player O wins diagonally the opposite way' do
    
    %w[1 3 2 5 4 7].each do |choice|
      @game.mark_board(choice)
    end
    expect(@game.player_wins).to be true
  end

  it 'Returns that O is the winner' do
    
    %w[1 3 2 5 4 7].each do |choice|
      @game.mark_board(choice)
      @game.change_marker
    end
    expect(@game.winning_player).to eq('O')
  end

  it 'Player X wins diagonally' do
    
    %w[1 2 5 3 9].each do |choice|
      @game.mark_board(choice)
      @game.change_marker
    end
    expect(@game.winning_player).to eq('X')
  end

  it 'Returns that there is no winner yet' do
    
    %w[1 2 3 4 5 6].each do |choice|
      @game.mark_board(choice)
      @game.change_marker
    end
    expect(@game.winning_player).to eq('No winner')
  end

  it 'CPU picks a spot' do
    
    @game.mark_board('1')
    @game.change_marker
    @game.cpu_pick
    @game.print_board
    expect(@game.board).not_to eq(%w[0 X 2 3 4 5 6 7 8])
  end

  it 'CPU picks a spot' do
    
    @game.mark_board('0')
    @game.change_marker
    @game.cpu_pick
    @game.mark_board('2')
    @game.print_board
    expect(@game.board).not_to eq(%w[0 X 2 3 4 5 6 7 8])
  end

  it 'Returns the available spots on the board' do
    
    %w[1 2 3 4 5 6].each do |choice|
      @game.mark_board(choice)
      @game.change_marker
    end
    expect(@game.get_available_spots).to eq([6, 7, 8])
  end

  it 'CPU chooses the most optimal position' do
    
    %w[1 3 8 4 9 6].each do |i|
      @game.mark_board(i)
      @game.change_marker
    end
    best_move = @game.best_move_to_make
    expect(best_move).to eq(5)
  end

  it 'CPU chooses the middle first if its open' do
    
    @game.mark_board('1')
    @game.change_marker
    @game.cpu_pick
    expect(@game.board[4]).to eq('O')
  end

  it 'If human picks the middle first, the CPU picks the corner' do
    
    @game.mark_board('5')
    @game.change_marker
    @game.cpu_pick
    expect(@game.board[8]).to eq('O')
  end
end
