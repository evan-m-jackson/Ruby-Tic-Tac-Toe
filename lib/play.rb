require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/player_choice'
require './lib/command_ui'

class Play
  attr_reader :board, :cpu, :player, :game_over

  def initialize(board, cpu, player, game_over, output)
    @board = board
    @cpu = cpu
    @player = player
    @game_over = game_over
    @output = output
  end

  def run
    welcome_message

    @board.print_board

    run_game_until_win_or_draw

    game_over_message
  end

  private

  def welcome_message
    @output.give_welcome_message
  end

  def player_picks_a_spot
    choice = @player.get_player_input
    is_choice_valid = @player.is_user_input_valid(choice)
    if is_choice_valid
      choice_idx = @player.get_choice_idx(choice)
      is_choice_available = @player.is_space_free(@board.board, choice)
      if is_choice_available
        @board.mark_board(choice_idx, 'X')
        true
      else
        @output.sorry_taken
        false
      end
    else
      @output.sorry_invalid
      false
    end
  end

  def while_loop_for_player_picking_spot
    conditional = false
    @player.selection_message
    conditional = player_picks_a_spot until conditional
  end

  def run_game_until_win_or_draw
    while !@game_over.is_game_over(@board.board) && !@game_over.does_a_player_win(@board.board)
      while_loop_for_player_picking_spot

      @board.print_board

      @cpu.cpu_pick(@board.board)

      @board.print_board
    end
  end

  def game_over_message
    if @game_over.does_a_player_win(@board.board)
      winner = @game_over.which_player_wins(@board.board)
      @output.game_over_win(winner)
    else
      @output.game_over_draw
    end
  end
end
