class GameOver
  def initialize
    @WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
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

  def game_over_message(board)
    winner = which_player_wins(board)
    if winner != 'No winner'
      puts "GAME OVER! Player #{winner} has won!!"
    else
      puts "GAME OVER! It's a draw!!"
    end
  end
end
