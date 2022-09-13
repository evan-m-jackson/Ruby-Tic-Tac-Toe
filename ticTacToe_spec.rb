require 'rspec/autorun'
require './ticTacToe'

describe '#Game' do
  it 'Has String array (aka the board)' do
    game = Game.new
    expect(game.board).to eq(%w[1 2 3 4 5 6 7 8 9])
  end

  it 'Has a Player Marker' do
    game = Game.new
    expect(game.get_marker).to eq('X')
  end

  it 'When the user input is valid' do
    game = Game.new
    expect(game.is_user_input_valid('5')).to be true
  end

  it 'When the user input is valid Pt 2' do
    game = Game.new
    expect(game.is_user_input_valid('0')).to be false
  end

  it 'When the user input is valid Pt 2' do
    game = Game.new
    expect(game.is_user_input_valid('8')).to be true
  end

  it "When the user input isn't valid" do
    game = Game.new
    expect(game.is_user_input_valid('10')).to be false
  end

  it "When the user input isn't valid" do
    game = Game.new
    expect(game.is_user_input_valid('15')).to be false
  end

  it "When the user input isn't an integer" do
    game = Game.new
    expect(game.is_user_input_valid('a')).to be false
  end

  it "When the user input isn't an integer Pt 2" do
    game = Game.new
    expect(game.is_user_input_valid('1.1')).to be false
  end

  it "When the user input isn't an integer Pt 3" do
    game = Game.new
    expect(game.is_user_input_valid('1abc23')).to be false
  end

  it "When the user input isn't an integer Pt 4" do
    game = Game.new
    expect(game.is_user_input_valid(' ')).to be false
  end

  it 'When the user input is an Empty String' do
    game = Game.new
    expect(game.is_user_input_valid('')).to be false
  end

  it 'Mark the board in the middle' do
    game = Game.new
    game.mark_board('5')
    expect(game.board[4]).to eq('X')
  end

  it 'Mark the first spot on the board' do
    game = Game.new
    game.mark_board('1')
    expect(game.board).to eq(%w[X 2 3 4 5 6 7 8 9])
  end

  it 'Try to mark spot not on the board' do
    game = Game.new
    game.mark_board('0')
    expect(game.board).to eq(%w[1 2 3 4 5 6 7 8 9])
  end

  it 'Try to mark 6 spot with O' do
    game = Game.new
    game.change_marker
    game.mark_board('6')
    expect(game.board).to eq(%w[1 2 3 4 5 O 7 8 9])
  end

  it 'When the user input is already taken' do
    game = Game.new
    game.mark_board('1')
    expect(game.is_space_free('1')).to be false
  end

  it 'Player X picks then Player O picks' do
    game = Game.new
    game.mark_board('4')
    game.change_marker
    game.mark_board('3')
    expect(game.board).to eq(%w[1 2 O X 5 6 7 8 9])
  end

  it 'message prints if a spot is taken' do
    game = Game.new
    game.mark_board('1')
    expect do
      game.move_confirmation('1')
    end.to output("Sorry this space is taken. Please select another.\n").to_stdout
  end

  it 'message prints for an invalid choice' do
    game = Game.new
    expect do
      game.move_confirmation('a')
    end.to output("Sorry that is not a valid move. Please select an integer between 0 and 8.\n").to_stdout
  end

  it 'game is over' do
    game = Game.new
    (1..9).each do |n|
      num = n.to_s
      game.mark_board(num)
    end
    expect(game.game_over).to be true
  end

  it 'game is not over' do
    game = Game.new
    game.mark_board('1')
    expect(game.game_over).to be false
  end

  it 'Player X wins horizontally in the first row' do
    game = Game.new
    %w[1 4 2 5 3].each do |choice|
      game.mark_board(choice)
    end
    expect(game.player_wins).to be true
  end

  it 'Player O wins horizontally in the second row' do
    game = Game.new
    %w[1 4 2 5 9 6].each do |choice|
      game.mark_board(choice)
    end
    expect(game.player_wins).to be true
  end

  it 'No winner yet' do
    game = Game.new
    %w[1 2 3 4 5 6].each do |choice|
      game.mark_board(choice)
      game.change_marker
    end
    expect(game.player_wins).to be false
  end

  it 'Player X wins horizontally in the third row' do
    game = Game.new
    %w[7 2 8 1 9].each do |choice|
      game.mark_board(choice)
    end
    expect(game.player_wins).to be true
  end

  it 'Player O wins vertically' do
    game = Game.new
    %w[1 2 9 5 7 8].each do |choice|
      game.mark_board(choice)
    end
    expect(game.player_wins).to be true
  end

  it 'Player X wins diagonally' do
    game = Game.new
    %w[1 2 5 3 9].each do |choice|
      game.mark_board(choice)
      game.change_marker
    end
    expect(game.player_wins).to be true
  end

  it 'Player O wins diagonally the opposite way' do
    game = Game.new
    %w[1 3 2 5 4 7].each do |choice|
      game.mark_board(choice)
    end
    expect(game.player_wins).to be true
  end

  it 'Returns that O is the winner' do
    game = Game.new
    %w[1 3 2 5 4 7].each do |choice|
      game.mark_board(choice)
      game.change_marker
    end
    expect(game.winning_player).to eq('O')
  end

  it 'Player X wins diagonally' do
    game = Game.new
    %w[1 2 5 3 9].each do |choice|
      game.mark_board(choice)
      game.change_marker
    end
    expect(game.winning_player).to eq('X')
  end

  it 'Returns that there is no winner yet' do
    game = Game.new
    %w[1 2 3 4 5 6].each do |choice|
      game.mark_board(choice)
      game.change_marker
    end
    expect(game.winning_player).to eq('No winner')
  end

  it 'CPU picks a spot' do
    game = Game.new
    game.mark_board('1')
    game.change_marker
    game.cpu_pick
    game.print_board
    expect(game.board).not_to eq(%w[0 X 2 3 4 5 6 7 8])
  end

  it 'CPU picks a spot' do
    game = Game.new
    game.mark_board('0')
    game.change_marker
    game.cpu_pick
    game.mark_board('2')
    game.print_board
    expect(game.board).not_to eq(%w[0 X 2 3 4 5 6 7 8])
  end

  it 'Returns the available spots on the board' do
    game = Game.new
    %w[1 2 3 4 5 6].each do |choice|
      game.mark_board(choice)
      game.change_marker
    end
    expect(game.get_available_spots).to eq([6, 7, 8])
  end

  it 'CPU chooses the most optimal position' do
    game = Game.new
    %w[1 3 8 4 9 6].each do |i|
      game.mark_board(i)
      game.change_marker
    end
    best_move = game.best_move_to_make
    expect(best_move).to eq(5)
  end

  it 'CPU chooses the middle first if its open' do
    game = Game.new
    game.mark_board('1')
    game.change_marker
    game.cpu_pick
    expect(game.board[4]).to eq('O')
  end

  it 'If human picks the middle first, the CPU picks the corner' do
    game = Game.new
    game.mark_board('5')
    game.change_marker
    game.cpu_pick
    expect(game.board[8]).to eq('O')
  end
end
