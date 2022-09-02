require './ticTacToe.rb'

game = Game.new

game.welcome

while !game.game_over && !game.player_wins
    game.print_board
    
    choice = game.get_player_input

    if game.is_user_input_valid(choice) && game.is_space_free(choice)
        game.mark_board(choice)
        game.change_marker
        game.cpu_pick

    else
        game.move_confirmation(choice)
    end

end

game.print_board

if game.player_wins
    puts "GAME OVER! Player #{game.get_marker} wins!"

else
    puts "GAME OVER! It's a tie :("
end