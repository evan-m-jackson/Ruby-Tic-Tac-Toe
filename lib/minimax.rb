class Minimax
  attr_reader :marker

  def initialize(game_over)
    @game_over = game_over
    @marker = 'O'
    @human_marker = 'X'
  end

  def get_available_spots(board)
    available = []
    board.each_with_index do |_spot, idx|
      available << idx if board[idx] != @marker && board[idx] != @human_marker
    end
    available
  end

  def minimax(isMaximizing, board)
    if @game_over.which_player_wins(board) == @marker
      return 10
    elsif @game_over.which_player_wins(board) == @human_marker
      return -10
    elsif @game_over.is_game_over(board)
      return 0
    end

    if isMaximizing
      available = get_available_spots(board)
      best_score = -1000
      available.each do |i|
        board[i] = @marker
        score = minimax(false, board)
        board[i] = (i + 1).to_s
        best_score = [best_score, score].max
      end

    else
      available = get_available_spots(board)
      best_score = 1000
      available.each do |i|
        board[i] = @human_marker
        score = minimax(true, board)
        board[i] = (i + 1).to_s
        best_score = [best_score, score].min
      end
    end
    best_score
  end
end
