require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/player_choice'
require './lib/play'
require './lib/command_ui'

board = Board.new
command_ui = CommandUI.new
game_over = GameOver.new(output: command_ui)
cpu = CPUChoice.new(game_over)
player = PlayerChoice.new(output: command_ui)

tic_tac_toe = Play.new(board, cpu, player, game_over)

tic_tac_toe.run
