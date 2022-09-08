class Game
  attr_accessor :board

  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
    @pos_arrow = 1
    @WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @HUMAN = 'X'
    @CPU = 'O'
  end

  def get_marker
    if @pos_arrow == 1
      @HUMAN
    else
      @CPU
    end
  end

  def change_marker
    @pos_arrow *= -1
  end

  def welcome
    puts 'WELCOME TO TIC TAC TOE!'
  end

  def print_board
    board_string = "\n"

    @board.each_with_index do |space, idx|
      if [3, 6].include?(idx)
        board_string += "\n===========\n"
      elsif idx % 3 != 0
        board_string += '|'
      end
      board_string += " #{space} "
    end

    puts board_string + "\n"
  end

  def selection_message
    puts "\nPlease choose a spot on the board between 1-9: \r"
  end

  def get_player_input
    selection_message
    gets.chomp.to_s
  end

  def is_user_input_valid(choice)
    if choice !~ /\D/ && choice.length > 0
      num = choice.to_i
      if num <= 9 && num >= 1
        true
      else
        false
      end
    else
      false
    end
  end

  def is_space_free(choice)
    num = choice.to_i
    choice == @board[num - 1]
  end

  def mark_board(choice)
    @board[choice.to_i - 1] = get_marker if is_user_input_valid(choice) && is_space_free(choice)
  end

  def move_confirmation(choice)
    if !is_user_input_valid(choice)
      puts "Sorry that is not a valid move. Please select an integer between 0 and 8.\n"
    elsif !is_space_free(choice)
      puts 'Sorry this space is taken. Please select another.'
    else
      puts 'Thank you!'
    end
  end

  def game_over
    (1..9).each do |n|
      return false if @board[n - 1] == n.to_s
    end
    true
  end

  def winning_player
    @WINNING_COMBINATIONS.each do |arr|
      return @board[arr[0]] if @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]]
    end
    'No winner'
  end

  def player_wins
    winning_player != 'No winner'
  end

  def cpu_pick
    pick = if get_available_spots.length == 8
             cpu_first_pick
           else
             best_move_to_make.to_s
           end
    mark_board(pick)
    change_marker
  end

  def get_available_spots
    available = []
    @board.each_with_index do |_spot, idx|
      available << idx if @board[idx] != @HUMAN && @board[idx] != @CPU
    end
    available
  end

  def cpu_first_pick
    if @board[4] == '5'
      '5'
    else
      '9'
    end
  end

  def best_move_to_make
    best_score = -10_000
    best_move = 0
    available = get_available_spots

    available.each do |i|
      @board[i] = 'O'
      score = minimax(false)
      @board[i] = (i + 1).to_s
      if score > best_score
        best_score = score
        best_move = i
      end
    end
    best_move + 1
  end

  def minimax(isMaximizing)
    result = winning_player
    if result == 'O'
      return 1
    elsif result == 'X'
      return -1
    elsif game_over
      return 0
    end

    if isMaximizing
      best_score = -10_000
      available = get_available_spots

      available.each do |i|
        @board[i] = 'O'
        score = minimax(false)
        @board[i] = (i + 1).to_s
        best_score = [best_score, score].max
      end
      best_score

    else
      best_score = 10_000
      available = get_available_spots

      available.each do |i|
        @board[i] = 'X'
        score = minimax(true)
        @board[i] = (i + 1).to_s
        best_score = [best_score, score].min
      end
      best_score
    end
  end
end
