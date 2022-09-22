class CPUChoice
  attr_reader :game_over

  def initialize(game_over)
    @game_over = game_over
  end

  def cpu_pick(board)
    if get_available_spots(board).length > 0
      pick = if get_available_spots(board).length == 8
               cpu_first_pick(board)
             else
               best_move_to_make(board).to_s
             end
      board[pick.to_i - 1] = 'O'
    end
  end

  def get_available_spots(board)
    available = []
    board.each_with_index do |_spot, idx|
      available << idx if board[idx] != 'X' && board[idx] != 'O'
    end
    available
  end

  def cpu_first_pick(board)
    if board[4] == '5'
      '5'
    else
      '9'
    end
  end

  def best_move_to_make(board)
    best_score = -10_000
    best_move = 0
    available = get_available_spots(board)

    return 0 if available.length == 0

    available.each do |i|
      board[i] = 'O'
      score = minimax(false, board)
      board[i] = (i + 1).to_s
      if score > best_score
        best_score = score
        best_move = i
      end
    end
    best_move + 1
  end

  def minimax(isMaximizing, board)
    result = @game_over.which_player_wins(board)
    if result == 'O'
      return 1
    elsif result == 'X'
      return -1
    elsif @game_over.is_game_over(board)
      return 0
    end

    if isMaximizing
      best_score = -10_000
      available = get_available_spots(board)

      available.each do |i|
        board[i] = 'O'
        score = minimax(false, board)
        board[i] = (i + 1).to_s
        best_score = [best_score, score].max
      end
      best_score

    else
      best_score = 10_000
      available = get_available_spots(board)

      available.each do |i|
        board[i] = 'X'
        score = minimax(true, board)
        board[i] = (i + 1).to_s
        best_score = [best_score, score].min
      end
      best_score
    end
  end
end
