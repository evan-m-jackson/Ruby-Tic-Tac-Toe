require './ticTacToe.rb'

game = Game.new

game.welcome

while !game.game_over && !game.player_wins
    game.change_marker
    game.print_board
    
    choice = game.get_player_input

    game.playing_game(choice)


end

game.print_board

if game.player_wins
    puts "GAME OVER! Player #{game.get_marker} wins!"

else
    puts "GAME OVER! It's a tie :("
end