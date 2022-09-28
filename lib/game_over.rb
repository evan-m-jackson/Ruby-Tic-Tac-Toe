class GameOver
  def initialize(output: output)
    @WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @output = output
  end

  def is_game_over(board)
    (1..9).each do |n|
      return false if board[n - 1] == n.to_s
    end
    true
  end

  def which_player_wins(board)
    @WINNING_COMBINATIONS.each do |arr|
      return board[arr[0]] if board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]]
    end
    'No winner'
  end

  def does_a_player_win(board)
    which_player_wins(board) != 'No winner'
  end
end
