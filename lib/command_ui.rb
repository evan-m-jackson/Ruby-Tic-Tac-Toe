class CommandUI
  def sorry_invalid
    puts 'Sorry that is not a valid move. Please select an integer between 1 and 9.'
  end

  def sorry_taken
    puts 'Sorry this space is taken. Please select another.'
  end

  def game_over_win(player)
    puts "GAME OVER! Player #{player} wins!!"
  end

  def game_over_draw
    puts "GAME OVER! It's a draw!!"
  end
end
