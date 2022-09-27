class CPUChoice
  attr_reader :game_over

  def initialize(ai_function)
    @ai_function = ai_function
  end

  def cpu_pick(board)
    board_length = @ai_function.get_available_spots(board).length
    if board_length > 0
      pick = if board_length == 8
               cpu_first_pick(board)
             else
               best_move_to_make(board).to_s
             end
      board[pick.to_i - 1] = 'O'
    end
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
    available = @ai_function.get_available_spots(board)

    return 0 if available.length == 0

    available.each do |i|
      board[i] = @ai_function.marker
      score = @ai_function.minimax(false, board)
      board[i] = (i + 1).to_s
      if score > best_score
        best_score = score
        best_move = i
      end
    end
    best_move + 1
  end
end
