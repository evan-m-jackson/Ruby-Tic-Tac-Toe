require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/player_choice'
require './lib/play'
require './lib/command_ui'
require './lib/minimax'

command_ui = CommandUI.new
board = Board.new
game_over = GameOver.new(output: command_ui)
ai_function = Minimax.new(game_over)
cpu = CPUChoice.new(ai_function)
player = PlayerChoice.new(output: command_ui)

tic_tac_toe = Play.new(board, cpu, player, game_over, output: command_ui)

tic_tac_toe.run
