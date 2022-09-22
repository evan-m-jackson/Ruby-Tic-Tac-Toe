require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/player_choice'
require './lib/play'

board = Board.new
game_over = GameOver.new
cpu = CPUChoice.new(game_over)
player = PlayerChoice.new

tic_tac_toe = Play.new(board, cpu, player, game_over)

tic_tac_toe.run
