require './lib/board'
require './lib/cpu_choice'
require './lib/game_over'
require './lib/player_choice'

class Play
    attr_reader :board, :cpu, :player, :game_over
    def initialize(board, cpu, player, game_over)
        @board = board
        @cpu = cpu
        @player = player
        @game_over = game_over
    end

    def welcome_message
        puts 'WELCOME TO TIC TAC TOE!'
    end

    def player_picks_a_spot 
        choice = @player.get_player_input
        is_choice_valid = @player.is_user_input_valid(choice)
        is_choice_available = @player.is_space_free(@board.board, choice)
        if  is_choice_available && is_choice_valid
            @board.mark_board(choice, 'X')
            return true
        else
            @player.move_confirmation_message(@board.board, choice)
            return false
        end
    end

    def while_loop_for_player_picking_spot 
        conditional = false
        @player.selection_message
        while !conditional
            conditional = player_picks_a_spot
        end
    end

    def run_game_until_win_or_draw
        while !@game_over.is_game_over(@board.board) && !@game_over.does_a_player_win(@board.board)
            while_loop_for_player_picking_spot

            @board.print_board

            @cpu.cpu_pick(@board.board)

            @board.print_board
        end
    end


    def run
        welcome_message

        @board.print_board

        run_game_until_win_or_draw

        @game_over.game_over_message(@board.board)
    end

end

board = Board.new
game_over = GameOver.new
cpu = CPUChoice.new(game_over)
player = PlayerChoice.new

# tic_tac_toe = Play.new(board, cpu, player, game_over)

# tic_tac_toe.run